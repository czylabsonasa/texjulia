let
  exname="ertek3"

  eh=vcat(-4:-1,1:4)
  h=Poly(rand(eh,4))
  dh=polyder(h)
  ddh=polyder(dh)
  
  a,b,c=sample(-5:5,3,replace=false)
  ha,hb,hc=polyval(h,[a,b,c])
  dha=polyval(dh,a)
  ddha=polyval(ddh,a)
  

  jv=hc
  rv1,rv2,rv3=sample( jv.+[-4,-3,-2,-1,1,2,3,4],3,replace=false)
  jv,rv1,rv2,rv3=string.([jv,rv1,rv2,rv3])


   mreplace(raw"""
\begin{multi}{__EXNAME}
Milyen érteket vesz fel a $__C$ helyen az a  minimális fokszámú $H$ polinom, melyre 
$H(__A)=__HA,\ H(__B)=__HB, \ H'(__A)=__DHA, H''(__A)=__DDHA$?
\item* $ __JV $
\item  $ __RV1 $
\item  $ __RV2 $
\item  $ __RV3 $
\end{multi}""", 
  [
        "__EXNAME"=>exname,
        "__A"=>a,
        "__HA"=>ha,
        "__B"=>b,
        "__HB"=>hb,
        "__DHA"=>dha,
        "__DDHA"=>ddha,
        "__C"=>c,
        "__JV"=>jv,
        "__RV1"=>rv1,
        "__RV2"=>rv2,
        "__RV3"=>rv3,
  ]
)
end
