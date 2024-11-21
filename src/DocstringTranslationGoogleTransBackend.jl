module DocstringTranslationGoogleTransBackend

using Base.Docs: DocStr
using Markdown: Markdown

export @switchlang!, @revertlang!

using PythonCall

const Translator = PythonCall.pynew()

function _translate(s::String, dest, src = "en")
    translator = Translator()
    trans_text = translator.translate(s, src = src, dest = dest)
    pyconvert(String, trans_text.text)
end

function _translate(docstr::Markdown.MD, dest, src = "en")
    for d in docstr.content
        for c in d.content
            if c isa Markdown.Paragraph
                paragraph = c.content
                for i in eachindex(paragraph)
                    p = paragraph[i]
                    if p isa String
                        paragraph[i] = _translate(p, dest, src)
                    end
                end
            end
        end
    end
    docstr
end


function translate_with_googletrans(inp::Markdown.MD, lang)
    _translate(inp, lang)
end

function translate_with_ai(md::Markdown.MD, lang)
    translated_md = translate_with_googletrans(md, lang)
    md.content = translated_md.content
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
        translate_with_ai(d.object, string($(lang)))
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
    PythonCall.pycopy!(Translator, pyimport("googletrans").Translator)
end

end # module DocstringTranslationGoogleTransBackend
