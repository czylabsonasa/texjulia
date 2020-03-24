# 3 pont foegyutthato
let
  exname="foeh3"

  
  eh=vcat(-4:-1,1:4)
  eh=vcat(eh,eh//2,eh//3)
  p=Poly(rand(eh,3))
  #println(stderr,p,"\n",eh)

  
  x=-10:10
  Ax,Bx,Cx=sample(x,3,replace=false)
  Ay,By,Cy=polyval(p,[Ax,Bx,Cx])
  
  
  jv=p[2] # 0-bazisu, offsetArray!!!
  pool=collect(setdiff(jv.+eh,0))
  rv1,rv2,rv3=sample( pool,3,replace=false)
  jv,rv1,rv2,rv3=tstring.([jv,rv1,rv2,rv3])


   mreplace(raw"""
\begin{multi}{__EXNAME}
Consider the Lagrange interpolational polynomial of the points $(__Ax,__Ay)$, $(__Bx,__By)$ and $(__Cx,__Cy)$. 
Then, its leading coefficient is:
\item* $ __JV $
\item  $ __RV1 $
\item  $ __RV2 $
\item  $ __RV3 $
\end{multi}
""", [
        "__EXNAME"=>exname,
        "__Ax"=>tstring(Ax),
        "__Ay"=>tstring(Ay),
        "__Bx"=>tstring(Bx),
        "__By"=>tstring(By),
        "__Cx"=>tstring(Cx),
        "__Cy"=>tstring(Cy),
        "__JV"=>jv,
        "__RV1"=>rv1,
        "__RV2"=>rv2,
        "__RV3"=>rv3,
      ]
   )
end
