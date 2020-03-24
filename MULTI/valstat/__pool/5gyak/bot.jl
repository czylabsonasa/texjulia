let
   qname="bot"

   h=rand(2:4) # a bot hossza
   # komplementert érdemes vizsgálni
   # Y=min(X,h-X)>x
   # X>x h-X>x --> 
   # x < X < h - x
   # Y ~ U(0,h/2)

   A=rand(3:20)
   B=rand((A+1):40)
   A=A//50
   B=B//50
   
   
   jv=2*(B-A)//h
   rv1=2*B//h
   rv2=2*A//h
   rv3=(B-A)//h

qText=replace(raw"""
\begin{multi}{__QNAME}
Egy $ __H $ méter hosszú botot  egy csapással véletlenszerűen kettétörünk. Legyen $ Y $ 
a keletkezet részek hosszának minimuma. Mennyi $ P(__A<Y<__B) $?
\item* $__JV$
\item $__RV1$
\item $__RV2$
\item $__RV3$
\end{multi}
""",[
   "__QNAME",qname,
   "__H",string(h),
   "__A",toS(A),
   "__B",toS(B),
   "__JV",toS(jv),
   "__RV1",toS(rv1),
   "__RV2",toS(rv2),
   "__RV3",toS(rv3)
])

   print(_out,qText)

end
