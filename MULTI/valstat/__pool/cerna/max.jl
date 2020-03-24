let
   qname="cernaMax"

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

   jv=replace(raw"F(x)=\frac{x-__H2}{__H2},\:\: __H2<x<__H",
      ["__H2",toS(h2),"__H",toS(h)]
   )
   rv1=replace(raw"F(x)=\frac{x}{__H2},\:\: __H2<x<__H",
      ["__H2",toS(h2),"__H",toS(h)]
   )
   rv2=replace(raw"F(x)=\frac{x-__H2}{__H},\:\: 0<x<__H",
      ["__H2",toS(h2),"__H",toS(h)]
   )
   rv3=replace(raw"F(x)=\frac{x}{__H},\:\: 0<x<__H",
      ["__H2",toS(h2),"__H",toS(h)]
   )

qText=replace(raw"""
\begin{multi}{maxEo}
Egy $ __H $ méter hosszú cérnát egy ollóval véletlenszerűen elvágunk.
Legyen $ Y $ a keletkezett részek hosszának maximuma.
Ekkor $ Y $ eloszlásfüggvénye: (ami a jelzett intervallumtól jobbra 1,
balra pedig 0 értéket vesz fel)
\item* $ __JV $
\item $ __RV1 $
\item $ __RV2 $
\item $ __RV3 $
\end{multi}
""",[
   "__QNAME",qname,
   "__H",toS(h),
   "__JV",jv,
   "__RV1",rv1,
   "__RV2",rv2,
   "__RV3",rv3
])
   print(_out,qText)



a,b=rand(0:h,2)
if a>b
   a,b=b,a
end
ra=max(h2,a)
rb=min(h,b)

sol=0//1
if rb>ra
   sol=(rb-ra)//h2
end


jv,rv1,rv2,rv3="","","",""

if sol==0 || sol==1
   jv=toS(sol)
   rv1=toS(1-sol)
   rv2=toS(1//2)
   rv3=toS(1//3)
else
   jv=toS(sol)
   rv1=toS((1-sol)^2)
   rv2=toS(sol^3)
   rv3=toS(1-sol*sol)
end


qText=replace(raw"""
\begin{multi}{maxVal}
Egy $ __H $ méter hosszú cérnát egy ollóval véletlenszerűen elvágunk.
Legyen $ Y $ a keletkezett részek hosszának maximuma.
Ekkor $ P(__A<Y<__B) $=
\item* $ __JV $
\item $ __RV1 $
\item $ __RV2 $
\item $ __RV3 $
\end{multi}
""",[
   "__QNAME",qname,
   "__H",toS(h),
   "__A",toS(a),
   "__B",toS(b),
   "__JV",jv,
   "__RV1",rv1,
   "__RV2",rv2,
   "__RV3",rv3
])
   print(_out,qText)



jv=toS(3*h//4)
rv1=toS(h2)
rv2=toS(h)
rv3=toS(h2//4)

qText=replace(raw"""
\begin{multi}{maxE}
Egy $ __H $ méter hosszú cérnát egy ollóval véletlenszerűen elvágunk.
Legyen $ Y $ a keletkezett részek hosszának maximuma.
Ekkor az $ Y $ várható értéke:
\item* $ __JV $
\item $ __RV1 $
\item $ __RV2 $
\item $ __RV3 $
\end{multi}
""",[
   "__QNAME",qname,
   "__H",toS(h),
   "__JV",jv,
   "__RV1",rv1,
   "__RV2",rv2,
   "__RV3",rv3
])


   print(_out,qText)

end
