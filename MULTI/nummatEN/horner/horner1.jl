let
  exname="horner1"

  
  eh=vcat(-4:-1,1:4)
  deg=rand(4:6)
  z=rand(vcat(-3:-1,1:3))
  p=rand(vcat(-4:4,[0,0]),deg+1)
  if p[1]==0
    p[1]=rand([-1,1])
  end
  p=p//1

  function hornertab(P,X)
    tab=P[:]
    for it=2:length(P)
      tab[it]=tab[it-1]*X+P[it]
    end
    tab
  end

  sp=tpoly(reverse(p))
  k=rand(1:deg-3)

  tab=hornertab(p,z)
  loc=deg+1-k
  jv=tab[loc]
  rv1=tstring(jv+1)
  rv2=tstring(jv-1)
  rv3=tstring(jv-2)
  jv=tstring(jv)




  mreplace(raw"""
\begin{multi}{__EXNAME}
__DBG
Using Horners tabular method, we compute $P(__Z)$ for the polynomial 
$$P(x)=__P$$ 
Then, the value under the degree $__K$ term is: 
\item* $ __JV $
\item  $ __RV1 $
\item  $ __RV2 $
\item  $ __RV3 $
\end{multi}
""", [
        "__DBG"=>"",#tmm(tlista(tstring.(p)))*"\n",
        "__EXNAME"=>exname,
        "__P"=>sp,
        "__Z"=>tstring(z),
        "__K"=>tstring(k),
        "__JV"=>jv,
        "__RV1"=>rv1,
        "__RV2"=>rv2,
        "__RV3"=>rv3,
      ]
   )
end
