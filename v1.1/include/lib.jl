using 
  StatsBase, 
  Random, 
  Distributions, 
  LinearAlgebra, 
  Polynomials,
  QuadGK,
  DelimitedFiles,
  Combinatorics,
  MultivariatePolynomials,
  TypedPolynomials

# reduce-szal megoldva inline (mreplace)
# bulk replace
# import Base.replace
# function replace(s::String,d::Dict{String,String})
#    for (k,dk) in dmrep
#       s=replace(s,k=>dk)
#    end
#    return s
# end
mreplace(s,arr)=reduce(replace,arr,init=s)

function mopnorm(A::Array{Rational{Int},2},t)
  if t==-1
    maximum(sum(abs.(A),dims=2))
  else
    maximum(sum(abs.(A),dims=1))
  end
end

# altalanos udvozle, miez?+hasznalat
function mkudv(s)
  println(stderr)
  for v=split(s,'\n')
    println(stderr,"\t"*v)
  end
  println(stderr)
end

# pdflatex a nev.tex file-ra
function mkpdf(nev)
  arg1="tmp/"*nev*".tex"
  opt1="-interaction=batchmode"
  opt2="-output-directory=tmp"
  run(`pdflatex $(opt1) $(opt2) $(arg1)`)
  a1="tmp/"*nev*".pdf"
  a2="pdf/"*nev*".pdf"
  run(`cp $(a1) $(a2)`)
end


function mkkiir(name)
  fil=open("tmp/"*name*".tex","w")
  kiir(s)=println(fil,s) 
  bezar()=close(fil)
  kiir, bezar
end




szazalek(njv)=raw"[fraction="*string(round(100.0/njv,digits=5))*raw"]"

# # ketvaltozos polinom: generalas, kiertekeles, tex-alak
# function ranPoly(xh,yh,pz=0.1)  #xh,yh max kitevok, pz:kihagyas valsege
#   poli=Dict{Tuple{Int,Int},Rational{Int}}()
#   for x=0:xh,y=0:yh
#     (rand()<pz)&&continue
#     eh=rand(-3:3)//rand(1:5)
#     (eh==0)&&continue
#     poli[(x,y)]=eh
#   end
#   poli
# end
# function evalPoly(p::Dict{Tuple{Int,Int},Rational{Int}},x,y)
#   ret=0//1
#   for (k,v) in p
#     ret+=v*x^k[1]*y^k[2]
#   end
#   ret
# end



# shellben futtatas
function msaveandrun(prog,who)
  if who=="OCT"
    of=open("/tmp/progOCT","w"); println(of,prog); close(of)
    run(`octave /tmp/progOCT`) # ez 5.2-es octave
    return
  end
end

function mrun(s)
  if s=="OCT"
    run(`octave-cli /tmp/progOCT`) # ez 5.2-es octave
    return
  end
  if s=="R"
    run(`Rscript /tmp/progR`)
    return
  end
  if s=="MAT"
    run(`matlab -nojvm \< /tmp/progMAT \> /dev/null`) # matlab
    return
  end
  if s=="PY"
    run(`python /tmp/progPY`) # matlab
    return
  end
end
# fuggveny atalakitas dotmentesse
function tononoct(s)
  mreplace(s,["./"=>"/", ".*"=>"*", ".^"=>"^"]) # dont use: 2.^10 ! 
end

# primitiv, nem jo komplex adatra c(c(1,2),"A")
function rvek(x)
  n=length(x)
  ret=fill("", n)
  for i in 1:n
    if typeof(x[i])<:Number
      ret[i]=string(x[i])
    else
      ret[i]="\""*string(x[i])*"\""
    end
  end
  "c("*join(ret,",")*")"
end


