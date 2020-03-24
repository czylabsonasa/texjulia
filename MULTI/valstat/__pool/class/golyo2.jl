# w/o replace
let
   qname="golyo2"
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
   osszes=prod(sg:-1:(sg-hsz+1))

   tg=copy(golyok)
   kedvezo=1
   for i in most
      kedvezo=kedvezo*tg[i]
      tg[i]=tg[i]-1
   end

   jv=kedvezo//osszes
   rv1=(kedvezo+1)//(osszes+1)
   rv2=kedvezo//(osszes+1)
   rv3=(kedvezo-1)//osszes

qText=raw"""
\begin{multi}{__QNAME}
Egy dobozban van $__K$ kék, $__P$ piros és $__S$ sárga golyó. Visszatevés nélkül húzunk
$__HSZ$ golyót. Mi a valsége, hogy sorban: $__HUZ$ golyót kapunk?
\item* $__JV$
\item $__RV1$
\item $__RV2$
\item $__RV3$
\end{multi}
"""

   qText=replace(qText,"__QNAME"=>qname)
   qText=replace(qText,"__K"=>string(K))
   qText=replace(qText,"__P"=>string(P))
   qText=replace(qText,"__S"=>string(S))
   qText=replace(qText,"__HSZ"=>string(hsz))
   qText=replace(qText,"__HUZ"=>toS(huz))
   qText=replace(qText,"__JV"=>toS(jv))
   qText=replace(qText,"__RV1"=>toS(rv1))
   qText=replace(qText,"__RV2"=>toS(rv2))
   qText=replace(qText,"__RV3"=>toS(rv3))

   print(_out,qText)

end
