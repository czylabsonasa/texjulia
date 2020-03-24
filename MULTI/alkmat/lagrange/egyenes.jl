let
  exname="egyenes"

  x=-10:10
  y=-10:10
  Ax,Bx,z=sample(x,3,replace=false)
  Ay,By=rand(y,2)
  

  slope=(By-Ay)//(Bx-Ax)
  f(t)=Ay+slope*(t-Ax)

  jv=f(z)
  rv1,rv2,rv3=sample( jv.+[-4,-3,-2,-1,1,2,3,4].*slope,3,replace=false)
  jv,rv1,rv2,rv3=tstring.([jv,rv1,rv2,rv3])


   mreplace(raw"""
\begin{multi}{__EXNAME}
Milyen érteket vesz fel a(z) $(__Ax,__Ay)$ és $(__Bx,__By)$ pontokra illeszkedő 
egyenes a $__Z$ helyen?
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
        "__Z"=>string(z),
        "__JV"=>jv,
        "__RV1"=>rv1,
        "__RV2"=>rv2,
        "__RV3"=>rv3,
      ]
   )
end
