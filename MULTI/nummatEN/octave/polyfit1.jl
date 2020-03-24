# 3 pont foegyutthato
let
  exname="polyfit1"

  
  x=-10:10
  Ax,Bx,Ay,By=sample(x,4,replace=false)

  sA=tlista(tstring.([Ax,Ay]),delim=",",brac=["(",")"])
  sB=tlista(tstring.([Bx,By]),delim=",",brac=["(",")"])
  
  minta="\\mathrm{polyfit}([__x1,__x2], [__y1,__y2], __d)"
  jv1=mreplace(minta, 
    [
      "__x1"=>tstring(Ax),
      "__x2"=>tstring(Bx),
      "__y1"=>tstring(Ay),
      "__y2"=>tstring(By),
      "__d"=>"1"
    ]
  )
  jv1=tmm(jv1)

  jv2=mreplace(minta, 
    [
      "__x2"=>tstring(Ax),
      "__x1"=>tstring(Bx),
      "__y2"=>tstring(Ay),
      "__y1"=>tstring(By),
      "__d"=>"1"
    ]
  )
  jv2=tmm(jv2)

  rv1=mreplace(minta, 
    [
      "__x1"=>tstring(Ax),
      "__x2"=>tstring(Ay),
      "__y1"=>tstring(Bx),
      "__y2"=>tstring(By),
      "__d"=>"1"
    ]
  )
  rv1=tmm(rv1)

  rv2=mreplace(minta, 
    [
      "__x2"=>tstring(Ax),
      "__x1"=>tstring(Ay),
      "__y2"=>tstring(Bx),
      "__y1"=>tstring(By),
      "__d"=>"1"
    ]
  )
  rv2=tmm(rv2)


  rv3=mreplace(minta, 
    [
      "__x1"=>tstring(Ax),
      "__x2"=>tstring(By),
      "__y1"=>tstring(Bx),
      "__y2"=>tstring(Ay),
      "__d"=>"1"
    ]
  )
  rv3=tmm(rv3)





   mreplace(raw"""
\begin{multi}[multiple]{__EXNAME}
Using the polyfit function, we are going to construct a line through the points $__sA$ and $__sB$. 
Choose the correct command(s)!

\item__AC __JV1
\item__AC __JV2
\item__WA  __RV1
\item__WA  __RV2
\item__WA  __RV3
\end{multi}
""", [
        "__EXNAME"=>exname,
        "__sA"=>sA,
        "__sB"=>sB,
        "__JV1"=>jv1,
        "__JV2"=>jv2,
        "__RV1"=>rv1,
        "__RV2"=>rv2,
        "__RV3"=>rv3,
        "__AC"=>szazalek(2),
        "__WA"=>szazalek(-2),
      ]
   )
end
