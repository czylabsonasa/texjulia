let
  exname="trigreg"

  function msin(x::Rational{Int})
    local t
    t=x.num
    (x.den==1)&&(t*=2)
    t-=4div(t,4)
    (t<0)&&(t+=4)
    [0//1, 1//1, 0//1, -1//1][1+(t%4)]
  end
  function mcos(x::Rational{Int})
    local t
    t=x.num;
    (x.den==1)&&(t*=2)
    t-=4div(t,4)
    (t<0)&&(t+=4)
    [1//1, 0//1, -1//1, 0//1][1+(t%4)]
  end
  fun1(x)=1//1
  valaszt=rand(0:1)
  fun2,s2=if valaszt>0 
    x->mcos(x//1), raw"\cos(\pi t)" 
  else 
    x->msin(x//1), raw"\sin(\pi t)"
  end

  t,f,b=let
    t,f,b=[],[],[]
    while true
      #println(stderr,"\n\n")
      m=rand(6:9)
      t=rand(0:40,m)//2 # csak kettedekig megy le
      atlag=sum(t)//m
      if valaszt>0 t=t.-atlag.num÷atlag.den end
      #println(stderr,"t=",t)
      f=rand(-10:10,m)//2
      (length(Set(t))<2)&&continue
      A=hcat(fun1.(t),fun2.(t))
      #println(stderr,"A=",A)
      At=transpose(A)
      EH=At*A #egyutthato matrix
      #println(stderr,"EH=",EH)
      dEH=det(EH)
      (dEH==0 || dEH>50)&&continue 
      b=EH\(At*f)
      break
    end
    t,f,b
  end

  jv=tpoly(b,x=s2)
  b[1]*=(-1);
  rv1=tpoly(b,x=s2)
  b[2]*=(-1);
  rv2=tpoly(b,x=s2)
  b[1]*=(-1);
  rv3=tpoly(b,x=s2)

mreplace(raw"""
\begin{multi}{__EXNAME}
Adja meg az alábbi adatokat legkisebb négyzetes értelemben legjobban 
közelítő $ b_1 __S2 +b_0$ alakú függvényt!
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
    "__S2"=>s2,
    "__JV"=>jv,
    "__RV1"=>rv1,
    "__RV2"=>rv2,
    "__RV3"=>rv3
  ]
)

end
