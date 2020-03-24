let
   qname="std"
  
 
   N=rand(5:11)
   X=rand(-4:4,N)
   SUM=sum(X)
   SUM2=sum(X.*X)
   mX=SUM//N
   tmp=(SUM2-N*(mX^2))

# println("sum= ",SUM)
# println("sum2= ",SUM2)


   jv=toS(tmp//(N-1))
   rv1=toS(tmp//N)
   rv2=toS(tmp)
   rv3=toS(2*tmp//(N-1))

qText=replace(raw""" 
\begin{multi}{__QNAME}
Egy $ __N $ elemű $ X $ mintáról a következőket tudjuk:
$$
\sum_{k=1}^{ __N } X_{k}= __SUM \hspace{1cm} \sum_{k=1}^{ __N } X^{2}_{k}= __SUM2
$$  
Ekkor a korrigált tapasztalati szórásnégyzet:
\item* $ __JV $
\item $ __RV1 $
\item $ __RV2 $
\item $ __RV3 $
\end{multi}
""",[
   "__QNAME",qname,
   "__N",toS(N),
   "__SUM2",toS(SUM2),
   "__SUM",toS(SUM),
   "__JV",jv,
   "__RV1",rv1,
   "__RV2",rv2,
   "__RV3",rv3
])
   print(_out,qText)


end
