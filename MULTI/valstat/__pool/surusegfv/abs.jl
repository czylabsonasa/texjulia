# A|x| , |x|<b, b random
let
   qname="abs"

   b=rand(4:10)//3
   fx=replace(raw"""
   f(x)=
   \begin{cases}
   A|x|  & \text{ha } |x|<__b \\
   0             & \text{ máskor }
   \end{cases}
   """, [
      "__b", toS(b)
      ]
   )

   quest=raw"Ekkor $A=$"
   A=1//(b^2)
   jv=toS(A)
   rv1=toS(A+1//2)
   rv2=toS(A+1//3)
   rv3=toS(A+1//4)

qText=replace(raw"""
\begin{multi}{konstans}
Egy $X$ valségi változó sűrűségfüggvénye:
$$ __fx $$ alakú valamely $A$ számra. __quest
\item* $__jv$
\item $__rv1$
\item $__rv2$
\item $__rv3$
\end{multi}
""",[
   "__fx",fx,
   "__quest",quest,
   "__jv",jv,
   "__rv1",rv1,
   "__rv2",rv2,
   "__rv3",rv3
])

   print(_out,qText)


   #######################



   quest=raw"Ekkor $ E(X)= $"
   jv=toS(0)
   rv1=toS(1//2)
   rv2=toS(1//3)
   rv3=toS(1//4)

   qText=replace(raw"""
   \begin{multi}{várható}
   Egy $X$ valségi változó sűrűségfüggvénye:
   $$ __fx $$ alakú. __quest
   \item* $__jv$
   \item $__rv1$
   \item $__rv2$
   \item $__rv3$
   \end{multi}
   """,[
      "__fx",fx,
      "__quest",quest,
      "__jv",jv,
      "__rv1",rv1,
      "__rv2",rv2,
      "__rv3",rv3
   ])

      print(_out,qText)


      #######################



      quest=raw"Ekkor $ D^{2}(X)= $"
      jv=toS((b^2)//2)
      rv1=toS(b^2)
      rv2=toS(2*b^2)
      rv3=toS(b//2)

      qText=replace(raw"""
      \begin{multi}{szórás2}
      Egy $X$ valségi változó sűrűségfüggvénye:
      $$ __fx $$ alakú. __quest
      \item* $__jv$
      \item $__rv1$
      \item $__rv2$
      \item $__rv3$
      \end{multi}
      """,[
         "__fx",fx,
         "__quest",quest,
         "__jv",jv,
         "__rv1",rv1,
         "__rv2",rv2,
         "__rv3",rv3
      ])

         print(_out,qText)



end
