# at kell irni hogy a parok egymas mellett legyenek
let
  exname="tf"
  include("lista.jl")


  function generate(ig,ha;prop=4) # egyforma hosszuak!, prop>=2 !
    n=length(ig)
    cn=n÷prop
println("cn=",cn)    
    idx=1:n
    idx=sample(idx, cn, replace=false)
    igO=ig[idx]
    idx=setdiff(1:n,idx)
    idx=sample(idx, cn, replace=false)
    haO=ha[idx]
    igO, haO
  end

  allIG=vcat(floatIG,normaIG,linsysIG,lknIG,interpolIG)
  allHA=vcat(floatHA,normaHA,linsysHA,lknHA,interpolHA)

  IG,HA=generate(allIG,allHA,prop=4)
  n=length(IG) # =length(HA)
  titem(s,pt)=join([ raw"\item"*szazalek(pt)*v for v in s],'\n')
  tmulti(
    "Choose the true/correct statements!\n"*
    titem(IG,n)*titem(HA,-n),
    name="tf",
    sing="false")
end
