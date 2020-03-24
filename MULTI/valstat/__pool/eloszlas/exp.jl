let
   qname="exp"
  
   MU=rand(1:5)//10
   LAMBDA=1//MU
   A,B=sample((MU-2):(MU+2),2,replace=false,ordered=true)

   r(x)=round(x,digits=4)

   rA=max(0,A)
   rB=B
   if rB<rA
      rB=rA
   end

   # 
   
   function pwr(a,k) #a^k , a,k sztringek
      ret=""
      while true
         if "0"==k
            ret="1"
            break
         end
         if "1"==k            
            ret=a
            break
         end
         ret=a*"^{"*k*"}"
         break
      end
      ret
   end

   function sol(alap,a,b) #alap string, a,b szamok, alap^a-alap^b
      ret=""
      if a<=b
         ret="0"
      else
         ret=pwr(alap,toS(a))*"-"*pwr(alap,toS(b))
      end
      ret
   end

   jv=sol("e",-LAMBDA*rA,-LAMBDA*rB)
   rv1=sol("e",-LAMBDA*(rA-1),-LAMBDA*(rB+1))
   rv2=sol("e",-LAMBDA*(rA-1),-LAMBDA*rB)
   rv3=sol("e",-LAMBDA*rA,-LAMBDA*(rB+1))

qText=replace(raw""" 
\begin{multi}{__QNAME}
Egy boltban a sorbanállással töltött $ X $ idő  exponenciális elszlású valségi változó, 
$ __MU $ óra várható értékkel. Számoljuk ki a $ P( __A < X < __B) $ valséget!
\item* $ __JV $
\item $ __RV1 $
\item $ __RV2 $
\item $ __RV3 $
\end{multi}
""",[
   "__QNAME",qname,
   "__MU",toS(MU),
   "__A",toS(A),
   "__B",toS(B),
   "__JV",jv,
   "__RV1",rv1,
   "__RV2",rv2,
   "__RV3",rv3
])
   print(_out,qText)


end
