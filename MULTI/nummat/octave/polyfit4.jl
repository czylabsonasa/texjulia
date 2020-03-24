# 3 pont foegyutthato
let
  exname="polyfit4"
  d=rand([1,2])
  mit=["egyenest","parabolát"]
  
  n=rand(3:7)
  t=rand(-10:10,n)
  f=rand(-10:10,n)



  jv1="előfordulhat hogy a kapott polinom csak közelíti az adatokat"
  jv2="P fokszáma legfeljebb $(d)"
  jv3="előfordul, hogy P illeszkedik az adatokra, azaz "*tmm(raw"\P(T_k)=F_k")*raw" minden $k$-ra"
  rv1="P fokszáma pontosan $(d)"
  rv2="P fokszáma legalább $(d)"
  rv3="P mindig illeszkedik az adatokra, azaz "*tmm(raw"\P(T_k)=F_k")*raw" minden $k$-ra"


  mreplace(raw"""
\begin{multi}[multiple,penalty=1]{__EXNAME}

Egy-egy $__N$ elemű T és F vektor megadása után kiadjuk a P=$\mathrm{polyfit}(T,F,__D)$ 
parancsot. Ekkor a következő állítások igazak:
\item* __JV1
\item* __JV2
\item* __JV3
\item  __RV1
\item  __RV2
\item  __RV3
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
      ]
   )
end
