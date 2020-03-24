#### moodle tesztek generalasa juliaval
menjunk bele a MULTI konyvtarba

inditsuk el a juliat

telepitsuk a szukseges csomagokat (mind a programhoz, mind a feladatok megoldasahoz kellenek):
```julia
import Pkg
for p=["StatsBase", "Random", "Distributions", "LinearAlgebra", "Polynomials"]
  Pkg.add(p)
end
```
ez nyilvan csak 1x kell.

adjuk ki a
```
include("MULTI.jl")
```
parancsot. ez behozza a ```multi``` fv-t. ez eloszor sokaig tart(hat)
ezutan a:
```julia
multi("alkmat/interpol.jl", "A")
```
legeneralja az ```alkmat/output/A``` alkonyvtarba az ```alkmat/interpol.jl``` fajlban levo feladat valogatasnak megfelelo fajlokat. Az ```xml``` jo a moodlenak.
