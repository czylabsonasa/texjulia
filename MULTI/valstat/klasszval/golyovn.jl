let
  exname="golyovn"
  K=rand(2:5)
  P=rand(2:5)
  S=rand(2:5)
  golyok=[K,P,S]
  szinek=["kék","piros","sárga"]

  urna=[ones(Int,K); 2*ones(Int,P); 3*ones(Int,S)]

  hsz=rand(2:4)

  # ezek a húzások
  most=sample(urna,hsz,replace=false) 
  huz=szinek[most]

  sg=sum(golyok)
  osszes=binomial(sum(golyok),hsz)
  aK,aP,aS=[count(x->x==y,most) for y=1:3] # 0126 vizsgan a most helyett urna volt (rossz!!!)
  kedvezo=prod([binomial(K,aK),binomial(P,aP),binomial(S,aS)])


  jv=kedvezo//osszes
  rv1=(kedvezo+1)//(osszes+1)
  rv2=kedvezo//(osszes+1)
  rv3=(kedvezo-1)//osszes

  huz=join(huz,",")
  jv,rv1,rv2,rv3=tstring.([jv,rv1,rv2,rv3])


  K,P,S,hsz=string.([K,P,S,hsz])



  mreplace(
  raw"""
  \begin{multi}{__EXNAME}
  Egy dobozban van $__K$ kék, $__P$ piros és $__S$ sárga golyó. Visszatevés nélkül húzunk
  $__HSZ$ golyót. Mi a valsége, hogy a __HUZ golyókat kapjuk?
  \item* $__JV$
  \item $__RV1$
  \item $__RV2$
  \item $__RV3$
  \end{multi}
  """
  ,
  [
    "__EXNAME"=>exname,
    "__K"=>K,
    "__P"=>P,
    "__S"=>S,
    "__HSZ"=>hsz,
    "__HUZ"=>huz,
    "__JV"=>jv,
    "__RV1"=>rv1,
    "__RV2"=>rv2,
    "__RV3"=>rv3,
  ])
end
