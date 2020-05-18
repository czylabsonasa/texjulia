# Newton lebegopontos valaszokkal

let
  exname="approx"

  bas=vcat(-10:-3, 3:10)
  pool=bas[:]
  for den in [2,3,4,5]
    pool=vcat(pool,bas//den)
  end
  pool=setdiff(pool, 0) # 0 kiszedve


  u0,u1,a,b,c=fill(0,5)
  while true
    u0,u1=sample(pool, 2, replace=false, ordered=true)
    println( stderr, "u0+u1=", u0+u1)
    if u0+u1 == 0 continue end
    a=rand(pool)
    b,c=[(u0+u1),u0*u1]*a
    break
  end

  n=3
  fun=tpoly([c,b,a])
  nit(x)=x-(a*x^2+b*x+c)/(2*a*x+b)
  x0=if rand()<0.5 u0-rand(3:5) else u1+rand(3:5) end
  jv=x0/1.0
  for it=1:n jv=nit(jv) end

  pool=[1.2,1.3,1.4,1.5,0.8,0.7,0.6,0.5]

  rv1,rv2,rv3,rv4,rv5=sample(pool, 5, replace=false)*jv
  tol=1e-5
  @assert abs(jv-rv1)>tol
  @assert abs(jv-rv2)>tol
  @assert abs(jv-rv3)>tol
  @assert abs(jv-rv4)>tol
  @assert abs(jv-rv5)>tol


  jv,rv1,rv2,rv3,rv4,rv5=tstring.(round.([jv,rv1,rv2,rv3,rv4,rv5],digits=6)) .|> tmm




  n=tstring(n)
  x0=tstring.(x0)
  

mreplace(raw"""
\begin{multi}{__EXNAME}
Newton-módszerrel közelítjük a
$$__FUN$$
függvény egy gyökét. Az $x_{0}=__X0$ pontból indulunk és $__N$ iterációt hajtunk 
négre. Ekkor $x_{__N}$ =
\item* __JV
\item  __RV1
\item  __RV2
\item  __RV3
\item  __RV4
\item  __RV5
\end{multi}
""", [
        "__EXNAME"=>exname,
        "__FUN"=>fun,
        "__X0"=>x0,
        "__N"=>n,
        "__JV"=>jv,
        "__RV1"=>rv1,
        "__RV2"=>rv2,
        "__RV3"=>rv3,
        "__RV4"=>rv4,
        "__RV5"=>rv5,
        ]
   )
end
