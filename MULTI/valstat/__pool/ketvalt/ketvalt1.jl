# f(x,y)=2(1-x)4(1-2y), 0<x<1,  0<y<1/2
let
   qname="ketvalt1"

   alak=raw"""
   f_{X,Y}(x,y)=
   \begin{cases}
   8-8x-16y+16xy  & \text{ha } 0<x<1,\: 0<y<\frac{1}{2} \\
   0             & \text{ máskor }
   \end{cases}
   """

   jv,rv1,rv2,rv3="","","",""

   jv=raw"4(1-2y),\: 0<y<\frac{1}{2}"
   rv1=raw"4(1-2y),\: 0<y<1"
   rv2=raw"(1-2y),\: 0<y<\frac{1}{2}"
   rv3=raw"2(1-2y),\: 0<y<1"


qText=replace(raw"""
\begin{multi}{marg}
Az $X$ és $Y$ valségi változók együttes sűrűségfüggvénye:
$$ __ALAK $$
Ekkor az $ Y $ egyedi (marginális) sűrűsegfüggvénye, $ f_{Y}(y)= $
\item* $ __JV $
\item $ __RV1 $
\item $ __RV2 $
\item $ __RV3 $
\end{multi}
""",[
   "__ALAK",alak,
   "__JV",jv,
   "__RV1",rv1,
   "__RV2",rv2,
   "__RV3",rv3
])
   print(_out,qText)



   jv=toS(1)
   rv1=toS(1//2)
   rv2=toS(2)
   rv3=toS(1//3)


   qText=replace(raw"""
   \begin{multi}{varhato}
   Az $X$ és $Y$ valségi változók együttes sűrűségfüggvénye:
   $$ __ALAK $$
   Ekkor az $ X $ várható értéke, $ E(X)= $
   \item* $ __JV $
   \item $ __RV1 $
   \item $ __RV2 $
   \item $ __RV3 $
   \end{multi}
   """,[
      "__ALAK",alak,
      "__JV",jv,
      "__RV1",rv1,
      "__RV2",rv2,
      "__RV3",rv3
   ])
      print(_out,qText)

      jv=raw"\text{függetlenek}"
      rv1=raw"\text{nem függetlenek}"
      rv2="P(X<Y)=1"
      rv3="P(X>Y)=1"


      qText=replace(raw"""
      \begin{multi}{tulajdon}
      Az $X$ és $Y$ valségi változók együttes sűrűségfüggvénye:
      $$ __ALAK $$
      Ekkor az $ X $ és $ Y $ valségi változókra igaz, hogy:
      \item* $ __JV $
      \item $ __RV1 $
      \item $ __RV2 $
      \item $ __RV3 $
      \end{multi}
      """,[
         "__ALAK",alak,
         "__JV",jv,
         "__RV1",rv1,
         "__RV2",rv2,
         "__RV3",rv3
      ])
         print(_out,qText)



end
