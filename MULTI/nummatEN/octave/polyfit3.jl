# 3 pont foegyutthato
let
  exname="polyfit3"
  n=rand(3:10)
  d=n-1

  jv1="it is possible, that P only approximates the points"
  jv2="the degree of P at most $(d)"
  jv3="it is possible, that P fits exactly points"
  rv1="the degree of P is exactly $(d)"
  rv2="the degree of P is at least $(d)"
  rv3="P is always the minimal degree interpolational polynomial"


  mreplace(raw"""
\begin{multi}[single=false]{__EXNAME}
For the $__N$ element vectors T and F, we issue the command P=$\mathrm{polyfit}(T,F,__D)$.
Choose the true statement(s)!
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
