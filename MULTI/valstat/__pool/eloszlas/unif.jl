let
   qname="unif"
  
   M=rand(1:5)//10
   
   MIN,MAX=sample((1:10)//5,2,replace=false,ordered=true)
   MU=(MIN+MAX)//2

   r(x)=round(x,digits=4)

   A,B=sample((1:10)//5,2,replace=false,ordered=true)
   
   rA,rB=max(A,MIN),min(B,MAX)
   if rA>rB
     rA=rB
   end
   

   
   jv=toS((rB-rA)//(MAX-MIN))
   rv1=toS((rB-rA+1)//(MAX-MIN+1))
   rv2=toS((rB-rA+2)//(MAX-MIN+2))
   rv3=toS((rB-rA+3)//(MAX-MIN+3))


qText=replace(raw""" 
\begin{multi}{__QNAME}
Egy boltban a sorbanállással töltött $ X $ idő egyenletes eloszlású valségi változó a $[ __MIN, __MAX ]$ intervallumon.
Számoljuk ki a $ P( __A < X < __B) $ valséget!
\item* $ __JV $
\item $ __RV1 $
\item $ __RV2 $
\item $ __RV3 $
\end{multi}
""",[
   "__QNAME",qname,
   "__MIN",toS(MIN),
   "__MAX",toS(MAX),
   "__A",toS(A),
   "__B",toS(B),
   "__JV",jv,
   "__RV1",rv1,
   "__RV2",rv2,
   "__RV3",rv3
])
   print(_out,qText)


end
