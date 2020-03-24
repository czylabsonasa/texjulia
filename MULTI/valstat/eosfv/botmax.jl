let
   exname="botmax"

   h=2+rand(2:2:10) # a bot hossza
   # komplementert érdemes vizsgálni
   # Y=min(X,h-X)>x
   # X>x h-X>x -->
   # x < X < h - x
   # Y ~ U(0,h/2)
   # max hasonloan

   h2=Int(floor(h/2))
   h//=1
   h2//=1

   jv=mreplace(raw"F(x)=\frac{x-__H2}{__H2},\:\: __H2<x<__H",
      ["__H2"=>tstring(h2),"__H"=>tstring(h)]
   )
   rv1=mreplace(raw"F(x)=\frac{x}{__H2},\:\: __H2<x<__H",
      ["__H2"=>tstring(h2),"__H"=>tstring(h)]
   )
   rv2=mreplace(raw"F(x)=\frac{x-__H2}{__H},\:\: 0<x<__H",
      ["__H2"=>tstring(h2),"__H"=>tstring(h)]
   )
   rv3=mreplace(raw"F(x)=\frac{x}{__H},\:\: 0<x<__H",
      ["__H2"=>tstring(h2),"__H"=>tstring(h)]
   )

  mreplace(raw"""
\begin{multi}{__EXNAME}
Egy $ __H $ méter hosszú cérnát egy ollóval véletlenszerűen elvágunk.
Legyen $ Y $ a keletkezett részek hosszának maximuma.
Ekkor $ Y $ eloszlásfüggvénye: (ami a jelzett intervallumtól jobbra 1,
balra pedig 0 értéket vesz fel)
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
