let
  exname="parabola"

  x=-10:10
  
  eh=vcat(-4:-1,1:4)
  p=Poly(rand(eh,3))

  
  x=-10:10
  Ax,Bx,Cx,z=sample(x,4,replace=false)
  Ay,By,Cy=polyval(p,[Ax,Bx,Cx])
  
  pz=polyval(p,z)

  jv=pz
  rv1,rv2,rv3=sample( jv.+[-4,-3,-2,-1,1,2,3,4],3,replace=false)
  jv,rv1,rv2,rv3=tstring.([jv,rv1,rv2,rv3])


   mreplace(raw"""
\begin{multi}{__EXNAME}
If $L$ is the quadratic function that interpolates the points 
$(__Ax,__Ay),\ (__Bx,__By)$ and $(__Cx,__Cy)$, then its value at $__Z$ is:
\item* $ __JV $
\item  $ __RV1 $
\item  $ __RV2 $
\item  $ __RV3 $
\end{multi}
""", [
        "__EXNAME"=>exname,
        "__Ax"=>string(Ax),
        "__Ay"=>string(Ay),
        "__Bx"=>string(Bx),
        "__By"=>string(By),
        "__Cx"=>string(Cx),
        "__Cy"=>string(Cy),
        "__Z"=>string(z),
        "__JV"=>jv,
        "__RV1"=>rv1,
        "__RV2"=>rv2,
        "__RV3"=>rv3,
      ]
   )
end
