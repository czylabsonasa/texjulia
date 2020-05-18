let
  exname="quadreg"

  fun1(x)=1//1
  fun2(x)=x//1
  fun3(x)=x^2//1

  m=rand(6:9)
  t,f,b=let
    t,f,b=[],[],[]
    while true
      t=rand(-4:4,m)//1
      f=rand(-3:3,m)//1
      (length(Set(t))<3)&&continue
      A=hcat(fun1.(t),fun2.(t),fun3.(t))
      At=transpose(A)
      EH=At*A #egyutthato matrix
      dEH=det(EH)
      if dEH==0 || abs(dEH)>50 continue end
      b=EH\(At*f)
      break
    end
    t,f,b
  end


  jv=tpoly(b,x="t")
  b[3]*=(-1);
  rv1=tpoly(b,x="t")
  b[2]*=(-1);
  rv2=tpoly(b,x="t")
  b[1]*=(-1);
  rv3=tpoly(b,x="t")

mreplace(raw"""
\begin{multi}{__EXNAME}
Adja meg az alábbi adatokat legkisebb négyzetes értelemben legjobban 
közelítő $ b_2 t^2+b_1 t+b_0$ alakú polinomot!
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
