#### moodle tesztek generalasa juliaval
* menjunk bele a MULTI konyvtarba
* inditsuk el a julia-t
* include("MULTI.jl")
* generaljuk le amit akarunk:
* multi("alkmat/config.jl","dir")
* a dir konyvtar letrejon az "alkmat/output" alatt
* a config.jl megvaltozott:
  * vagy tomeges modban van: mass=true es a darab valtozoval szabalyozhatjuk hanyat akarunk
  * vagy valogatas modban mass=false, ekkor az egyes feladatoknal levo darab valtozok szerint
  veletlenszeruen huz a listabol
  * fontos az elejen az mquizname valtozo, mert egy ilyen nevu kulso kategoria nevet kapnak 
  a generalt feladatok
    * pontosabban azokban az xml fajlokban melyek "_M.xml"-re vegzodnek megjelenik 
    az mquizname mint felso kategorianev. elvileg igy kevesebbet kell a moodleban szarozni.
    * a regi "-moodle.xml"-re vegzodok is megvannak
* a lib.jl-ben az msaveandrun-ban a parancs-futtatas ha nem mukodik sima "octave"-val akkor csereljuk ki
  "octave-cli"-re
  * ubuntu: "octave-cli" a jo, egy masik debian szarmazekon viszont sima "octave".
