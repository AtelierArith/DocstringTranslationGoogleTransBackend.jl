# DocstringTranslationGoogleTransBackend.jl

This package translates Julia's docstring in your native languages using Python library [googletrans](https://py-googletrans.readthedocs.io/en/latest/). The Python library calls Google Translate Ajax API to make calls to such methods as detect and translate.

## Example: Japanese(日本語)

```julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.11.1 (2024-10-16)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> using DocstringTranslationGoogleTransBackend; @switchlang! :Japanese; @doc sin
  sin(x)

  ofのサインを計算しますx、 どこxラジアンです。

  参照してくださいsind、sinpi、sincos、cis、asin。

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

  正方行列のマトリックス正弦を計算しますA。

  もしA対称またはハーミット、その固有カムポジション（eigen）サインの計算に使用されます。それ以外の場合、サインは呼び出しによって決定されますexp。

  Examples
  ≡≡≡≡≡≡≡≡

  julia> sin(fill(1.0, (2,2)))
  2×2 Matrix{Float64}:
   0.454649  0.454649
   0.454649  0.454649
```

## Example: German(ドイツ語)

```julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.11.1 (2024-10-16)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> using DocstringTranslationGoogleTransBackend; @switchlang! :German; @doc sin
  sin(x)

  Berechnen Sie Sinus vonx, Woxist in Radians.

  Siehe auchsindAnwesendsinpiAnwesendsincosAnwesendcisAnwesendasin.

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

  Berechnen Sie die Matrix -Sinus einer quadratischen MatrixA.

  WennAist symmetrisch oder hermitisch, seine Eigenschaft (eigen) wird verwendet, um den Sinus zu berechnen.Andernfalls wird der Sinus durch
  Anruf bestimmtexp.

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

julia> using DocstringTranslationGoogleTransBackend; @switchlang! :French; @doc sin
  sin(x)

  Calculer la sinus dex, oùxest à Radians.

  Voir aussisind,sinpi,sincos,cis,asin.

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

  Calculez la matrice sinus d'une matrice carréeA.

  SiAest symétrique ou hermitien, sa composition eigenden (eigen) est utilisé pour calculer le sinus.Sinon, le sinus est déterminé en
  appelantexp.

  Examples
  ≡≡≡≡≡≡≡≡

  julia> sin(fill(1.0, (2,2)))
  2×2 Matrix{Float64}:
   0.454649  0.454649
   0.454649  0.454649

julia>
```