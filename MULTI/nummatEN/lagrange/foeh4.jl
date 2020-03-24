# 3 pont foegyutthato
let
  exname="foeh4"

  
  eh=vcat(-3:-1,1:3)
  #eh=vcat(eh,eh//2,eh//3)
  eh=vcat(eh,eh//2)
  p=Poly(rand(eh,4))
  #println(stderr,p,"\n",eh)

  
  x=-10:10
  Ax,Bx,Cx,Dx=sample(x,4,replace=false)
  Ay,By,Cy,Dy=polyval(p,[Ax,Bx,Cx,Dx])
  
  
  jv=p[3] # 0-bazisu, offsetArray!!!
  pool=collect(setdiff(jv.+eh,0))
  rv1,rv2,rv3=sample( pool ,3,replace=false)
  jv,rv1,rv2,rv3=tstring.([jv,rv1,rv2,rv3])


   mreplace(raw"""
\begin{multi}{__EXNAME}
Considering the Lagrange interpolational polynomial of the data $(__Ax,__Ay)$, $(__Bx,__By)$, $(__Cx,__Cy)$ and $(__Dx,__Dy)$, 
the leading coefficient is:
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
        "__Dx"=>tstring(Dx),
        "__Dy"=>tstring(Dy),
        "__JV"=>jv,
        "__RV1"=>rv1,
        "__RV2"=>rv2,
        "__RV3"=>rv3,
      ]
   )
end
