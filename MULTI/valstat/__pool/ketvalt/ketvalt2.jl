# f(x,y)=2a(1-ax)2b(1-by), 0<x<1/a,  0<y<1/b
# random, független X,Y
let
   qname="ketvalt2"
   pool=[1//3,1//2,1,2,3]#az együtthatókat ebből húzza
   a,b=sample(pool,2,replace=false)//1

   fxy=replace("__C(1-__ax-__by+__abxy)",[
      "__C",toS(4*a*b),
      "__ab",toS(a*b),
      "__a",toS(a),
      "__b",toS(b)
   ])

   fxyTeljes=replace(raw"""
   f_{X,Y}(x,y)=
   \begin{cases}
   __fxy  & \text{ha } 0<x<__aa,\: 0<y<__bb \\
   0             & \text{ máskor }
   \end{cases}
   """,[
      "__fxy",fxy,
      "__aa",toS(1//a),
      "__bb",toS(1//b)
   ])


   quest=raw"""Ekkor az $ Y $ egyedi (marginális) sűrűségfüggvénye, $ f_{Y}(y)= $"""
   
   jv=replace(raw"__a(1-__by),\: 0<y<\frac{1}{__c}",[
      "__a",toS(2*b),
      "__b",toS(b),
      "__c",toS(b)
   ])
   rv1=replace(raw"__a(1-__by),\: 0<y<\frac{1}{__c}",[
      "__a",toS(2*b),
      "__b",toS(a),
      "__c",toS(a)
   ])
   rv2=replace(raw"__a(1-__by),\: 0<y<\frac{1}{__c}",[
      "__a",toS(2*b),
      "__b",toS(b),
      "__c",toS(a)
   ])
   rv3=replace(raw"__a(1-__by),\: 0<y<\frac{1}{__c}",[
      "__a",toS(2*b),
      "__b",toS(a),
      "__c",toS(b)
   ])


qText=replace(raw"""
\begin{multi}{egyedi}
Az $X$ és $Y$ valségi változók együttes sűrűségfüggvénye:
$$ __fxyTeljes $$
__quest
\item* $ __jv $
\item $ __rv1 $
\item $ __rv2 $
\item $ __rv3 $
\end{multi}
""",[
   "__fxyTeljes",fxyTeljes,
   "__quest",quest,
   "__jv",jv,
   "__rv1",rv1,
   "__rv2",rv2,
   "__rv3",rv3
])
   print(_out,qText)


   quest=raw"Ekkor az $ X $ várható értéke, $ E(X)= $"
   jv=toS(1//(3*a))
   rv1=toS(1//(3*b))
   rv2=toS(1//a)
   rv3=toS(1//b)


   qText=replace(raw"""
   \begin{multi}{várható érték}
   Az $X$ és $Y$ valségi változók együttes sűrűségfüggvénye:
   $$ __fxyTeljes $$
   __quest
   \item* $ __jv $
   \item $ __rv1 $
   \item $ __rv2 $
   \item $ __rv3 $
   \end{multi}
   """,[
      "__fxyTeljes",fxyTeljes,
      "__quest",quest,
      "__jv",jv,
      "__rv1",rv1,
      "__rv2",rv2,
      "__rv3",rv3
   ])
      print(_out,qText)

      quest=raw"Ekkor az $ X $ és $ Y $ valségi változókra igaz, hogy:"

      jv=raw"\text{függetlenek}"
      rv1=raw"\text{nem függetlenek}"
      rv2="P(X<Y)=1"
      rv3="P(X>Y)=1"


      qText=replace(raw"""
      \begin{multi}{függetlenség}
      Az $X$ és $Y$ valségi változók együttes sűrűségfüggvénye:
      $$ __fxyTeljes $$
      \item* $ __jv $
      \item $ __rv1 $
      \item $ __rv2 $
      \item $ __rv3 $
      \end{multi}
      """,[
         "__fxyTeljes",fxyTeljes,
         "__jv",jv,
         "__rv1",rv1,
         "__rv2",rv2,
         "__rv3",rv3
      ])
      
      print(_out,qText)


end
