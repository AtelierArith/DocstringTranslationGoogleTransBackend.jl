module DocstringTranslationGoogleTransBackend

using Base.Docs: DocStr
using Markdown: Markdown

include("LocalizedLiterals.jl")
using .LocalisedLiterals: LocalisedLiterals

export @switchlang!, @revertlang!

function tocode(s)
    m = match(r"`\s*(.*?)\s*`", s)
    isnothing(m) && return s
    Markdown.Code("", replace(s, r"`\s*(.*?)\s*`"m => s"\1"))
end

preprocess(c) = c
preprocess(c::Markdown.LaTeX) = c
preprocess(c::Markdown.Code) = "`" * c.code * "`"
function preprocess(c::Markdown.Link)
    map(c.text) do t
        preprocess(t)
    end |> join
end
translate!(c) = c
function translate!(md::Markdown.MD)
    for c in md.content
        translate!(c)
    end
    md
end
translate!(c::Markdown.Code) = c
translate!(c::Markdown.Header{n}) where {n} = c
function translate!(p::Markdown.Paragraph)
    pnew = map(p.content) do c
        preprocess(c)
    end

    t = join(pnew)
    t = LocalisedLiterals.translate("ja", t)
    # for instance "`x`" => "\n`x`\n"
    ts = split(replace(t, r"`\s*(.*?)\s*`"m => s"\n`\1`\n"), "\n")
    ts = filter(ts) do t
        !isempty(t)
    end
    p.content = Markdown.Paragraph(tocode.(ts)).content
end

# Translate
translate!(s::String) = LocalisedLiterals.translate("ja", s)
function translate!(li::Markdown.List)
    for iter in li.items
        for i in iter
            translate!(i)
        end
    end
end


function translate_with_googletrans(md::Markdown.MD, lang)
    translate!(md)
    md
end

"""
	@switchlang!(lang)

Modify Docs.parsedoc(d::DocStr) to insert translation engine.
"""
macro switchlang!(lang)
    @eval function Docs.parsedoc(d::DocStr)
        if d.object === nothing
            md = Docs.formatdoc(d)
            md.meta[:module] = d.data[:module]
            md.meta[:path] = d.data[:path]
            d.object = md
        end
        translate_with_googletrans(d.object, string($(lang)))
    end
end

"""
	@revertlang!

re-evaluate original implementation for 
Docs.parsedoc(d::DocStr)
"""
macro revertlang!()
    @eval function Docs.parsedoc(d::DocStr)
        if d.object === nothing
            md = Docs.formatdoc(d)
            md.meta[:module] = d.data[:module]
            md.meta[:path] = d.data[:path]
            d.object = md
        end
        d.object
    end
end

function __init__()
    #PythonCall.pycopy!(Translator, pyimport("googletrans").Translator)
end

end # module DocstringTranslationGoogleTransBackend
