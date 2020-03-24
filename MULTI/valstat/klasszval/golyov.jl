let
  exname="golyov"
  K=rand(2:5)
  P=rand(2:5)
  S=rand(2:5)

  golyok=[K,P,S]
  szinek=["kék","piros","sárga"]

  hsz=rand(2:4)

  most=rand(1:3,hsz) 
  huzas=szinek[most]

  osszes=sum(golyok)^hsz
  kedvezo=prod(golyok[most])

  jv=kedvezo//osszes
  rv1=(kedvezo+1)//(osszes+1)
  rv2=kedvezo//(osszes+1)
  rv3=(kedvezo-1)//osszes

  jv,rv1,rv2,rv3=tstring.([jv,rv1,rv2,rv3])
  huzas=join(huzas,",")

  mreplace(
raw"""
\begin{multi}{__EXNAME}
Egy dobozban van $__K$ kék, $__P$ piros és $__S$ sárga golyó. Visszatevéssel húzunk
$__HSZ$ golyót. Mi a valsége, hogy sorban: __HUZAS golyót kapunk?
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
    "__HUZAS"=>huzas,
    "__JV"=>jv,
    "__RV1"=>rv1,
    "__RV2"=>rv2,
    "__RV3"=>rv3
  ])
end