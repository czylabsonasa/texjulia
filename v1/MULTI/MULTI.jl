# mass beepitese
# hierarchia
# !!! a hasznalt kategorianeveket a mass/non-mass eseten at kellene gondolni

include("../include/lib.jl") # altalanos
include("../include/tstring.jl") # ebben vannak a tex-string eloallito fv-ek

include("../include/makro.jl") # tex-makrok "kifejtese" kezzel (moodle@latex nem tudja)
include("../include/tex.jl")

function multi(what,moutname)
  # elokeszuletek
  # what: alkmat/config.jl 
  # moutname: create output/moutname.tex 
  mobj=split(what,"/")
  moutermost=mobj[1] # alkmat/integralas/config.jl is mukodik 
  mcollection=mobj[end]
  mobj=join(mobj[1:end-1],"/") # igy mar barmilyen hieararhia megadhato
  include(mobj*"/"*mcollection) # aktualis kollekcio (konfiguracio?)
  moutdir=moutermost*"/output/"*moutname # a legkulso alatti output-ba rakja
  mkpath(moutdir)
  
  # ebbe lesz a tex-file
  mout="" # string!

  # nehany helper fuggveny
  function process(out,outdir,outname)
    outname=outdir*"/"*outname*".tex"
    outfile=open(outname,"w")
    print(outfile,out)
    close(outfile)

    # shell
    latexit="pdflatex"
    # arg0="-quiet" no such option
    arg0="-interaction=batchmode" # almost quiet pdflatex
    arg01="--enable-write18"
    arg1= "-output-directory=$(outdir)" 
    arg2="$(outname)"
    #run(`$(mcmd) $(arg0) $(arg1) $(arg2)`)
    run(`$(latexit) $(arg01) $(arg1) $(arg2)`)
  end


  function postprocess(outdir,outname,kat)
    inname=outdir*"/"*outname*"-moodle.xml"
    infile=open(inname,"r") # do block kell, more julian
    instr=read(infile,String)
    close(infile)

    outname=outdir*"/"*outname*"_M.xml"
    outfile=open(outname,"w")
    println(outfile, replace(instr, raw"$module$"=>kat))
    close(outfile)
  end


  mjoin(s)=join(s,"\n")
  berant(mtema,mex)=include(mobj*"/"*mtema*"/"*mex*".jl")*"\n" # berántja a mex-et

  if kind.mass==true
    darab=kind.darab # pozitivnak kell lenni, nem akarok + ifeket
    for gr in mcoll # gr: group
      tema,lista=gr.tema,gr.lista # itt a darab nem szamit
      for ex in lista
#println(stderr,tema," ",ex)
        mname=replace(tema,'/'=>'.')*"."*ex
        mout=tpre(["\\usepackage{moodle}"])*
        (tqui(berant.(tema,fill(ex,darab)) |> mjoin |> kifejt,mname) |> tdoc)
        process(mout, moutdir, mname) 
        postprocess(moutdir, mname, mquizname) 
      end
    end
  else # valogatas!!!!
    mout=""
    for gr in mcoll # gr: group
      darab,tema,lista=gr.darab,gr.tema,gr.lista
      (darab==0)&&continue
      (darab<0)&&(darab=length(lista)) # negativ: osszes
#println(stderr,"tema: ",tema," darab: ",darab)
      mout*=(berant.(tema,sample(lista,darab,replace=false)) |> mjoin |> kifejt)
    end
    mout=tpre(["\\usepackage{moodle}"])*(tqui(mout,mquizname) |> tdoc)
    process(mout,moutdir,moutname)
    postprocess(moutdir, moutname, moutname) 
  end
 
end # multi()
