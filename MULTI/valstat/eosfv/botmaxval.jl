let
  exname="botmaxval"
  h=2+rand(2:2:10) # a bot hossza
  h2=Int(floor(h/2))

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
    jv=tstring(sol)
    rv1=tstring(1-sol)
    rv2=tstring(1//2)
    rv3=tstring(1//3)
  else
    jv=tstring(sol)
    rv1=tstring((1-sol)^2)
    rv2=tstring(sol^3)
    rv3=tstring(1-sol*sol)
  end


  mreplace(raw"""
\begin{multi}{__EXNAME}
Egy $ __H $ méter hosszú botot egy fűrésszel elvágunk egy véletlenszerűen választtott
helyen.
Legyen $ Y $ a keletkezett részek hosszának maximuma.
Ekkor $ \P(__A<Y<__B) $=
\item* $ __JV $
\item $ __RV1 $
\item $ __RV2 $
\item $ __RV3 $
\end{multi}
""",
  [
   "__EXNAME"=>exname,
   "__H"=>tstring(h),
   "__A"=>tstring(a),
   "__B"=>tstring(b),
   "__JV"=>jv,
   "__RV1"=>rv1,
   "__RV2"=>rv2,
   "__RV3"=>rv3
])
end
