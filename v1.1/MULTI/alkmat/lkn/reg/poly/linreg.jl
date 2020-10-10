let
  exname="linreg"

  m=rand(5:7)
  t=rand(-4:4,m)//1
  f=rand(-3:3,m)//1
  fun1(x)=1//1
  fun2(x)=x//1
  fun=[fun1,fun2]

  A=hcat(fun[1].(t),fun[2].(t))
  At=transpose(A)
  EH=At*A #egyutthato matrix
  JO=At*f #jobb-oldal

  b=EH\JO


  jv=tpoly(b,x="t")
  b[1]*=(-1);
  rv1=tpoly(b,x="t")
  b[2]*=(-1);
  rv2=tpoly(b,x="t")
  b[1]*=(-1);
  rv3=tpoly(b,x="t")

mreplace(raw"""
\begin{multi}{__EXNAME}
Adja meg az alábbi adatokat legkisebb négyzetes értelemben legjobban 
közelítő $ b_1 t+b_0$ alakú fügvvényt!
$$ __TBL $$
\item* $__JV$
\item $__RV1$
\item $__RV2$
\item $__RV3$
\end{multi}
""", 
  [
    "__EXNAME"=>exname,
    "__TBL"=>ttable(tstring.(t),"t",tstring.(f),"f"),
    "__JV"=>jv,
    "__RV1"=>rv1,
    "__RV2"=>rv2,
    "__RV3"=>rv3
  ]
)

end
