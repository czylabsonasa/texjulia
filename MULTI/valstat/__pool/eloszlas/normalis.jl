let
   qname="normalis"
  
   MU=rand(150:10:200)
   SIGMA=rand(1:5)
   A,B=sample((MU-2):(MU+2),2,replace=false,ordered=true)
   x=collect(-3:3)//SIGMA
   d=Normal()
   Fx=cdf.(d,x)
   
   r(x)=round(x,digits=4)
   Fx=map(r,Fx)
   sFx=map(string,Fx)
   table=toTable(x,"x",Fx,raw"\Phi(x)")


   jv=toS(r(cdf(d,(B-MU)/SIGMA)-cdf(d,(A-MU)/SIGMA)))
   rv1=toS(r(cdf(d,(1+B-MU)/SIGMA)-cdf(d,(A-MU)/SIGMA)))
   rv2=toS(r(cdf(d,(B-MU)/SIGMA)-cdf(d,(1+A-MU)/SIGMA)))
   rv3=toS(r(cdf(d,(1+B-MU)/SIGMA)-cdf(d,(1+A-MU)/SIGMA)))

qText=replace(raw""" 
\begin{multi}{__QNAME}
Egy boltban a sorbanállással töltött $ X $ idő normális eloszlású valségi változó, 
$ __MU $ óra várható értékkel és $ __SIGMA $ óra szórással. Számoljuk ki a $ P( __A < X < __B) $ valséget!
$$
__TABLE
$$
\item* $ __JV $
\item $ __RV1 $
\item $ __RV2 $
\item $ __RV3 $
\end{multi}
""",[
   "__QNAME",qname,
   "__MU",toS(MU),
   "__SIGMA",toS(SIGMA),
   "__A",toS(A),
   "__B",toS(B),
   "__TABLE",table,
   "__JV",jv,
   "__RV1",rv1,
   "__RV2",rv2,
   "__RV3",rv3
])
   print(_out,qText)


end
