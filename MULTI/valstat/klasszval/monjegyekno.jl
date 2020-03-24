let
  exname="monjegyek2"

  d=rand(3:9)

  kedvezo=sum(binomial.((9-1):-1:(d-1),d-1)) # utolsó jegy szerint bontva 9,8,...,d
  osszes=10^d-10^(d-1) # 9*10^(d-1)

  jv=kedvezo//osszes
  rv1=(kedvezo+1)//(10*osszes)
  rv2=kedvezo//(osszes+1)
  rv3=(kedvezo+4)//(2*osszes)

  jv,rv1,rv2,rv3=tstring.([jv,rv1,rv2,rv3])

  mreplace(
  raw"""
\begin{multi}{__EXNAME}
Véletlenszerűen választva egyet az összes $__D$ jegyű ($10$-es rendszerben felírt, nem $0$-val kezdődő) számot, 
mennyi az esélye hogy a 
jegyei szigorúan monoton növekvő sorozatot alkotnak?
\item* $__JV$
\item $__RV1$
\item $__RV2$
\item $__RV3$
\end{multi}
"""
  ,
  [
    "__EXNAME"=>exname,
    "__D"=>d,
    "__JV"=>jv,
    "__RV1"=>rv1,
    "__RV2"=>rv2,
    "__RV3"=>rv3
  ])
end
