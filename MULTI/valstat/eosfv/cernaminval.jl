let
  exname="cernaminval"

  h=rand(2:10)//1 # a cerna hossza
  h2=h//2
  a,b=let
    a,b=0//1,0//1
    while true
      a,b=rand(1:20,2)//20
      (a!=b)&&break
    end
    (a<b) ? (a,b) : (b,a)
  end

  aa,bb=min(h2,a),min(h2,b)
  jv=bb-aa>0 ? bb-aa : 0
  jv=jv//h2
  rv1=jv+1//h
  rv2=jv+2//h
  rv3=jv+4//h
  jv,rv1,rv2,rv3=tstring.([jv,rv1,rv2,rv3])
  h,h2,a,b=tstring.([h,h2,a,b])


  mreplace(raw"""
\begin{multi}{__EXNAME}
Egy $ __H $ méter hosszú cérnát egy ollóval véletlenszerűen elvágunk.
Legyen $ Y $ a keletkezett részek hosszának minimuma.
Ekkor $ \P(__A<Y<__B) $=
\item* $ __JV $
\item $ __RV1 $
\item $ __RV2 $
\item $ __RV3 $
\end{multi}
""",
  [
    "__EXNAME"=>exname,
    "__H"=>h,
    "__A"=>a,
    "__B"=>b,
    "__JV"=>jv,
    "__RV1"=>rv1,
    "__RV2"=>rv2,
    "__RV3"=>rv3
  ])
end