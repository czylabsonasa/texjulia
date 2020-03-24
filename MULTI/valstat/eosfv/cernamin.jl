let
  exname="cernamineo"

  # intuitívan:
  # mikor kisebb mint x a min? a ket vegen x+x hosszú
  # helyről választhatok
  #
  # precízebben:komplementert érdemes vizsgálni
  # Y=min(X,h-X)>x
  # X>x h-X>x -->
  # x < X < h - x
  # Y ~ U(0,h/2)
  # max hasonloan

  h=rand(2:10)//1 # a cerna hossza
  h2=h//2
  h,h2=tstring.([h,h2])


  jv=mreplace(
    raw"\frac{x}{__H2},\:\: 0<x<__H2",
    ["__H2"=>h2,"__H"=>h]
  )

  rv1=mreplace(
    raw"\frac{x-__H}{__H2},\:\: __H2<x<__H",
    ["__H2"=>h2,"__H"=>h]
  )

  rv2=mreplace(
    raw"\frac{x}{__H},\:\: 0<x<__H",
    ["__H2"=>h2,"__H"=>h]
  )

  rv3=mreplace(
    raw"\frac{x-__H}{__H},\:\: 0<x<__H2",
    ["__H2"=>h2,"__H"=>h]
  )

  body=mreplace(raw"""
\begin{multi}{__EXNAME}
Egy $ __H $ méter hosszú cérnát egy ollóval véletlenszerűen elvágunk.
Legyen $ Y $ a keletkezett részek hosszának minimuma.
Ekkor $ Y $ eloszlásfüggvényének nem-konstans része: 
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