let
  exname="botmaxvarhato"

  h=2+rand(2:2:10) # a bot hossza
  a,b=rand(0:h,2)
  if a>b
    a,b=b,a
  end
  h2=Int(floor(h/2))
  ra=max(h2,a)
  rb=min(h,b)


  jv=tstring(3*h//4)
  rv1=tstring(h2)
  rv2=tstring(h)
  rv3=tstring(h2//4)

  mreplace(raw"""
\begin{multi}{__EXNAME}
Egy $ __H $ méter hosszú cérnát egy ollóval véletlenszerűen elvágunk.
Legyen $ Y $ a keletkezett részek hosszának maximuma.
Ekkor az $ Y $ várható értéke:
\item* $ __JV $
\item $ __RV1 $
\item $ __RV2 $
\item $ __RV3 $
\end{multi}
""",
  [
    "__EXNAME"=>exname,
    "__H"=>tstring(h),
    "__JV"=>jv,
    "__RV1"=>rv1,
    "__RV2"=>rv2,
    "__RV3"=>rv3
  ])

end
