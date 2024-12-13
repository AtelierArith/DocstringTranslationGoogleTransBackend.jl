#=
MIT License

Copyright (c) 2023 Henrik Wolf <henrik-wolf@freenet.de> and contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
=#
module LocalisedLiterals

using HTTP
using JSON

const TRANSLATE_URL = "https://translate.googleapis.com/translate_a/single"

function translate_params(source_language, target_language, text)
    return (client = "gtx", sl = source_language, tl = target_language, dt = "t", q = text)
end
translate_params(target_language, text) = translate_params("auto", target_language, text)

function translate(args...)
    resp = HTTP.get(TRANSLATE_URL, query = translate_params(args...))
    resp.status != 200 &&
        @warn "something went wrong when translating. Status code: $(resp.status)"
    result = resp.body |> String |> JSON.parse
    return join([s[1] for s in result[1]], "")
end

function parse_language_codes()
    path = joinpath(dirname(@__FILE__), "language_codes.tsv")
    lines = readlines(path)
    Dict(
        map(lines) do line
            full_name, identifier_raw = split(line, " \t")
            identifiers = split(identifier_raw, " ")
            if length(identifiers) > 1
                identifiers = identifiers[1:2:end]
            end

            return string.(full_name) =>
                map(code -> replace(code, "-" => "_"), identifiers)
        end...,
    )
end

const ALL_LANGUAGES_DICT = parse_language_codes()

for target_lang in vcat(values(ALL_LANGUAGES_DICT)...)
    macro_name = Symbol(target_lang * "_str")
    contents = :(translate(from, $target_lang, text))
    @eval begin
        macro $macro_name(text, from = "auto")
            $contents
        end
    end
    at_macro_name = Symbol("@" * target_lang * "_str")
    @eval export $at_macro_name
end
end
