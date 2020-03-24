let
  exname="osszeg"
  A=sample(-10:10,rand(4:7),replace=false)
  B=sample(-10:10,rand(4:7),replace=false)
  osszes=length(A)*length(B)
  kedvezo=sum(1 for a in A for b in B if a+b<0)

  jv=kedvezo//osszes
  rv1=(kedvezo+1)//(osszes+1)
  rv2=kedvezo//(osszes+1)
  rv3=(kedvezo-1)//osszes

  jv,rv1,rv2,rv3=tstring.([jv,rv1,rv2,rv3])

  A="\\{"*tstring(A//1,brac=false)*"\\}"
  B="\\{"*tstring(B//1,brac=false)*"\\}"


  mreplace(
  raw"""
\begin{multi}{__EXNAME}
Az $__A$ és $__B$ halmazokból véletlenszerűen választva egy-egy számot, annak 
az esély, hogy a kapott számok osszege negatív:
\item* $__JV$
\item $__RV1$
\item $__RV2$
\item $__RV3$
\end{multi}
"""
  ,
  [
    "__EXNAME"=>exname,
    "__A"=>A,
    "__B"=>B,
    "__JV"=>jv,
    "__RV1"=>rv1,
    "__RV2"=>rv2,
    "__RV3"=>rv3,
  ])
end
