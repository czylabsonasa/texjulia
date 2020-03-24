# 3 pont foegyutthato
let
  exname="polyfit3"
  n=rand(3:10)
  d=n-1

  jv1="előfordulhat hogy a kapott polinom csak közelíti az adatokat"
  jv2="P fokszáma legfeljebb $(d)"
  jv3="előfordul, hogy P illeszkedik az adatokra, azaz "*tmm(raw"\P(T_k)=F_k")*raw" minden $k$-ra"
  rv1="P fokszáma pontosan $(d)"
  rv2="P fokszáma legalább $(d)"
  rv3="P mindig illeszkedik az adatokra, azaz "*tmm(raw"\P(T_k)=F_k")*raw" minden $k$-ra"


  mreplace(raw"""
\begin{multi}[single=false]{__EXNAME}
Egy-egy $__N$ elemű T és F vektor megadása után kiadjuk a P=$\mathrm{polyfit}(T,F,__D)$ 
parancsot. Ekkor a következő állítások igazak:
\item__AC __JV1
\item__AC __JV2
\item__AC __JV3
\item__WA  __RV1
\item__WA  __RV2
\item__WA  __RV3
\end{multi}
""", [
        "__EXNAME"=>exname,
        "__N"=>tstring(n),
        "__D"=>tstring(d),
        "__JV1"=>jv1,
        "__JV2"=>jv2,
        "__JV3"=>jv3,
        "__RV1"=>rv1,
        "__RV2"=>rv2,
        "__RV3"=>rv3,
        "__AC"=>szazalek(3),
        "__WA"=>szazalek(-3),
      ]
   )
end
