# DocstringTranslationGoogleTransBackend.jl

This package translates Julia's docstring in your native languages using Google Translate API to make calls to such methods as detect and translate. The idea is based on [henrik-wolf/LocalisedLiterals.jl](https://github.com/henrik-wolf/LocalisedLiterals.jl) repository.

## Setup

```julia
$ git clone https://github.com/AtelierArith/DocstringTranslationGoogleTransBackend.jl.git
$ cd DocstringTranslationGoogleTransBackend.jl
$ julia --project -e 'using Pkg; Pkg.instantiate()'
```

# Usage

## Example: Japanese(日本語)

```julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.11.2 (2024-12-01)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> using Revise; using DocstringTranslationGoogleTransBackend; @switchlang! :Japanese; @doc sin
  sin(x)

  x の正弦を計算します。x の単位はラジアンです。

  sind、sinpi、sincos、cis、asin も参照してください。

  Examples
  ≡≡≡≡≡≡≡≡

  julia> round.(sin.(range(0, 2pi, length=9)'), digits=3)
  1×9 Matrix{Float64}:
   0.0  0.707  1.0  0.707  0.0  -0.707  -1.0  -0.707  -0.0

  julia> sind(45)
  0.7071067811865476

  julia> sinpi(1/4)
  0.7071067811865475

  julia> round.(sincos(pi/6), digits=3)
  (0.5, 0.866)

  julia> round(cis(pi/6), digits=3)
  0.866 + 0.5im

  julia> round(exp(im*pi/6), digits=3)
  0.866 + 0.5im

  sin(A::AbstractMatrix)

  正方行列 ``A`` の行列正弦を計算します。

  A が対称またはエルミートの場合、その固有分解 (eigen)
  を使用してサインが計算されます。それ以外の場合、正弦は exp
  を呼び出すことによって決定されます。

  Examples
  ≡≡≡≡≡≡≡≡

  julia> sin(fill(1.0, (2,2)))
  2×2 Matrix{Float64}:
   0.454649  0.454649
   0.454649  0.454649

julia>
```

## Example: German(ドイツ語)

```julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.11.2 (2024-12-01)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> using Revise; using DocstringTranslationGoogleTransBackend; @switchlang! :German; @doc sin
  sin(x)

  Berechnen Sie den Sinus von „x“, wobei „x“ im Bogenmaß angegeben ist.

  Siehe auch „sind“, „sinpi“, „sincos“, „cis“, „asin“.

  Examples
  ≡≡≡≡≡≡≡≡

  julia> round.(sin.(range(0, 2pi, length=9)'), digits=3)
  1×9 Matrix{Float64}:
   0.0  0.707  1.0  0.707  0.0  -0.707  -1.0  -0.707  -0.0

  julia> sind(45)
  0.7071067811865476

  julia> sinpi(1/4)
  0.7071067811865475

  julia> round.(sincos(pi/6), digits=3)
  (0.5, 0.866)

  julia> round(cis(pi/6), digits=3)
  0.866 + 0.5im

  julia> round(exp(im*pi/6), digits=3)
  0.866 + 0.5im

  sin(A::AbstractMatrix)

  Berechnen Sie den Matrixsinus einer quadratischen Matrix „A“.

  Wenn „A“ symmetrisch oder hermitesch ist, wird seine Eigenzerlegung
  („eigen“) zur Berechnung des Sinus verwendet. Andernfalls wird der Sinus
  durch den Aufruf von „exp“ ermittelt.

  Examples
  ≡≡≡≡≡≡≡≡

  julia> sin(fill(1.0, (2,2)))
  2×2 Matrix{Float64}:
   0.454649  0.454649
   0.454649  0.454649

julia>
```

## French(フランス語)

```julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.11.1 (2024-10-16)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> using Revise; using DocstringTranslationGoogleTransBackend; @switchlang! :French; @doc sin
  sin(x)

  Calculez le sinus de x. Les unités de `x` sont les radians.

  Voir aussi `sind`, `sinpi`, `sincos`, `cis`, `asin `.

  Examples
  ≡≡≡≡≡≡≡≡

  julia> round.(sin.(range(0, 2pi, length=9)'), digits=3)
  1×9 Matrix{Float64}:
   0.0  0.707  1.0  0.707  0.0  -0.707  -1.0  -0.707  -0.0

  julia> sind(45)
  0.7071067811865476

  julia> sinpi(1/4)
  0.7071067811865475

  julia> round.(sincos(pi/6), digits=3)
  (0.5, 0.866)

  julia> round(cis(pi/6), digits=3)
  0.866 + 0.5im

  julia> round(exp(im*pi/6), digits=3)
  0.866 + 0.5im

  sin(A::AbstractMatrix)

  Calcule le sinus de la matrice carrée ``A``.

  Si `A` est symétrique ou hermitien, sa décomposition propre (`eigen`) est
  utilisée pour calculer le sinus. Sinon, le sinus est déterminé en
  appelant exp.

  Examples
  ≡≡≡≡≡≡≡≡

  julia> sin(fill(1.0, (2,2)))
  2×2 Matrix{Float64}:
   0.454649  0.454649
   0.454649  0.454649

julia>
```