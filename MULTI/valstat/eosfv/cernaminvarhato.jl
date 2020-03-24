let
  exname="cernaminvarhato"

  h=rand(2:10)//1 # a cerna hossza
  h2=h//2

  jv=h2//2
  rv1=jv-1//h
  rv2=jv+2//h
  rv3=jv+4//h
  jv,rv1,rv2,rv3=tstring.([jv,rv1,rv2,rv3])
  h,h2=tstring.([h,h2])


  mreplace(raw"""
\begin{multi}{__EXNAME}
Egy $ __H $ méter hosszú cérnát egy ollóval véletlenszerűen elvágunk.
Legyen $ Y $ a keletkezett részek hosszának minimuma.
Ekkor $\E(Y)=$
\item* $ __JV $
\item $ __RV1 $
\item $ __RV2 $
\item $ __RV3 $
\end{multi}
""",
  [
    "__EXNAME"=>exname,
    "__H"=>h,
    "__JV"=>jv,
    "__RV1"=>rv1,
    "__RV2"=>rv2,
    "__RV3"=>rv3
  ])
end
