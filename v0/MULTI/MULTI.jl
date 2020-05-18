# használat:
# obj=targy, a valgatas egy konfig file a temakorokket tartalmazza
# include("obj/valogatas.jl") 
# vegul pdflatex

include("../include/lib.jl") # altalanos
include("../include/tstring.jl") # ebben vannak a tex-string eloallito fv-ek

include("../include/makro.jl") # tex-makrok "kifejtese" kezzel (moodle)
include("../include/tex.jl")

function multi(what,moutname)
  mobj,mcollection=split(what,"/")
  include(mobj*"/"*mcollection) # aktualis kollekcio
  moutdir=mobj*"/output/"*moutname
  mkpath(moutdir)
  tmpname=moutdir*"/tmptex"
  tmpfile=open(tmpname,"w") # temp a makrok miatt
  
  print(tmpfile,replace(texopenmoodle,"mquizname"=>mquizname))

  kiir(mtema,mex)=print(tmpfile,include(mobj*"/"*mtema*"/"*mex*".jl"))
  for ex in mcoll
    darab=ex.darab
    (darab==0)&&continue
    println(stderr,ex.tema)
    (darab<0)&&(darab=length(ex.lista))
    kiir.(ex.tema,sample(ex.lista,darab,replace=false))
  end

  print(tmpfile,texclosemoodle)
  close(tmpfile)


  # a macrokat nem kezelte jol a latex-moodle-xml
  # ezert meg 1x vegigmegyek
  mtexfilename=moutdir*"/"*moutname*".tex"
  mtexfile=open(mtexfilename,"w") # vegleges
  for s=eachline(tmpname)
    println(mtexfile,kifejt(s))
  end
  close(mtexfile)
  rm(tmpname)

  # shell
  latexit="pdflatex"
  # arg0="-quiet" no such option
  arg0="-interaction=batchmode" # almost quiet pdflatex
  arg1= "-output-directory=$(moutdir)" 
  arg2="$(mtexfilename)"
  #run(`$(mcmd) $(arg0) $(arg1) $(arg2)`)
  run(`$(latexit) $(arg1) $(arg2)`)

end # multi()
