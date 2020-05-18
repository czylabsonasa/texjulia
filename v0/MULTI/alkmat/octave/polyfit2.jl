# 3 pont foegyutthato
let
  exname="polyfit2"
  d=rand(2:4)
  pool=vcat(-4:-1,1:4)
  pool=vcat(pool,pool//2,pool//3,pool//5)

  p=sample(pool,d+1,replace=false)
  sp=tlista(tstring.(p),brac=["[","]"])

  jv1="az illesztett polinom:"*tmm(tpoly(reverse(p)))
  rv1="T és F legfeljebb $(d+1) elemű vektorok"
  rv2="az illesztett polinom:"*tmm(tpoly(p))
  rv3="T és F pontosan $(d) elemű vektorok"
  rv4="T és F legalább $(d+1) elemű vektorok"



  mreplace(raw"""
\begin{multi}[multiple]{__EXNAME}
Konkrét T és F vektorok megadása után kiadjuk a p=$\mathrm{polyfit}(T,F,__D)$ 
parancsot, melynek eredményeként a $p=__P$ vektort kapjuk. 
Ekkor a következő állítások igazak:
\item__AC __JV1
\item__WA  __RV1
\item__WA  __RV2
\item__WA  __RV3
\item__WA __RV4
\end{multi}
""", [
        "__EXNAME"=>exname,
        "__D"=>tstring(d),
        "__P"=>sp,
        "__JV1"=>jv1,
        "__RV1"=>rv1,
        "__RV2"=>rv2,
        "__RV3"=>rv3,
        "__RV4"=>rv4,
        "__AC"=>szazalek(1),
        "__WA"=>szazalek(-1),
      ]
   )
end
