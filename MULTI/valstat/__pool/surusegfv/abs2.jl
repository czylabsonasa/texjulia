let
   qname="abs2"

   fun=raw"""
   f(x)=
   \begin{cases}
   __A(__b-|x|)  & \text{ha } |x|<1 \\
   0             & \text{ máskor }
   \end{cases}"""


   b=rand(4:10)//3
   alak=replace(fun, [
      "__b", toS(b),
      "__A", "A"
      ]
   )

   A=1//(2*b-1)
   jv=toS(A)
   rv1=toS(A+1//2)
   rv2=toS(A+1//3)
   rv3=toS(A+1//4)

qText=replace(raw"""
\begin{multi}{abs2sfv}
Egy $ X $ valségi változó sűrűségfüggvénye:
$$ __ALAK $$ alakú valamely $ A $ számra.
Ekkor  $ A= $
\item* $ __JV $
\item $ __RV1 $
\item $ __RV2 $
\item $ __RV3 $
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


   #######################


   alak=replace(fun, [
      "__b", toS(b),
      "__A",toS(A)
      ]
   )

   jv=toS(0)
   rv1=toS(1//2)
   rv2=toS(-1//3)
   rv3=toS(1//4)

   qText=replace(raw"""
   \begin{multi}{abs2varhato}
   Egy $ X $ valségi változó sűrűségfüggvénye:
   $$ __ALAK $$ alakú. Ekkor $ E(X)= $
   \item* $ __JV $
   \item $ __RV1 $
   \item $ __RV2 $
   \item $ __RV3 $
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


      #######################

      d=((4*b-3)//(2*b-1))//6
      jv=toS(d)
      rv1=toS(d+1//2)
      rv2=toS(d+1//3)
      rv3=toS(d+1//4)

      qText=replace(raw"""
      \begin{multi}{absszoras}
      Egy $X$ valségi változó sűrűségfüggvénye:
      $$ __ALAK $$ alakú. Ekkor $ D^{2}(X)= $
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
