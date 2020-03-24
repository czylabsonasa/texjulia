let
   
   qname="hatvany2"

   a=rand(1:7)
   B=rand(1:7)
   alak=replace(raw"""
   f(x)=
   \begin{cases}
   \frac{A}{__B x^2} & \text{ha } x>__a \\
   0             & \text{ máskor } 
   \end{cases}
   """, [
      "__a", toS(a),
      "__B",toS(B)
      ]
   )

   jv=toS(a)
   rv1=toS(a+1)
   rv2=toS(a+2)
   rv3=toS(a*2+1)

qText=replace(raw"""
\begin{multi}{__QNAME}
Egy $X$ valségi változó sűrűségfüggvénye: 
$$ __ALAK $$ alakú valamely $A$ számra. 
Ekkor $A=$
\item* $__JV$
\item $__RV1$
\item $__RV2$
\item $__RV3$
\end{multi}
""",[
   "__QNAME",qname,
   "__ALAK",alak,
   "__JV",jv,
   "__RV1",rv1,
   "__RV2",rv2,
   "__RV3",rv3
])

   print(_out,qText)

end
