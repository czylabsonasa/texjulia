# 3 pont foegyutthato
let
  exname="fokszam"

  
  eh=vcat(-3:-1,1:3)
  #eh=vcat(eh,eh//2,eh//3)

  deg=rand([1,2,3])
  n=rand(deg+1:deg+3)
  
  p=Poly(rand(eh,deg+1))
  #println(stderr,p,"\n",eh)

  
  x=-10:10
  t=sample(x,n,replace=false)
  f=polyval(p,t)
  
  
  jv=deg # 0-bazisu, offsetArray!!!
  pool=jv.+[-2,-1,1,2]
  pool=pool[pool.>0]
  if length(pool)<3
    #pool=vcat(pool, [3,4])
    pool=vcat(pool, [1,2].+pool[end])
  end
  rv1,rv2,rv3=sample( pool,3,replace=false)
  jv,rv1,rv2,rv3=tstring.([jv,rv1,rv2,rv3])


   mreplace(raw"""
\begin{multi}{__EXNAME}
Consider the Lagrange interpolational polynomial for the data:
$$__TBL$$
Its degree is:
\item* $ __JV $
\item  $ __RV1 $
\item  $ __RV2 $
\item  $ __RV3 $
\end{multi}
""", [
        "__EXNAME"=>exname,
        "__TBL"=>ttable(tstring.(t),"t",tstring.(f),"f"),
        "__JV"=>jv,
        "__RV1"=>rv1,
        "__RV2"=>rv2,
        "__RV3"=>rv3,
      ]
   )
end
