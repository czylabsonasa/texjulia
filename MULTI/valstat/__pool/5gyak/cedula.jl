let
   qname="cedula"

   db=rand(8:11)
   ced1=rand(1:3,db)
   ced2=rand(1:3,db)
   ced=(ced1*10 .+ced2)
   #println(ced)
   tabla=zeros(Int,3,3)
   for it in 1:db
      tabla[ced1[it],ced2[it]]+=1
   end
   s1=sum(tabla,dims=2)
   s2=sum(tabla,dims=1)
   S=sum(s1)
   #println("S=",S)
   tabla//=S
   s1//=S
   s2//=S
   mu1=sum((1:3).*s1)
   mu2=sum((1:3).*transpose(s2))

   # println(tabla)
   # println(s1)
   # println(s2)

   mu12=0
   for it in 1:3, jt in 1:3
      mu12=mu12+tabla[it,jt]*it*jt
   end
   #println("mu1=",mu1," mu2=",mu2," mu12=",mu12)


   co=mu12-mu1*mu2
   println("cov=",co)
   id=sum(s2*s1 .== tabla)
   idJ="függetlenek"
   idR="függetlenek"
   if id < 9
      idJ="nem "*idJ
   else
      idR="nem "*idJ
   end

   jv=idJ*raw" és $cov(X,Y)="*toS(co)*"\$"
   rv1=idR*raw" és $cov(X,Y)="*toS(co)*"\$"
   rv2=idJ*raw" és $cov(X,Y)="*toS(co+1)*"\$"
   rv3=idR*raw" és $cov(X,Y)="*toS(co-1)*"\$"

qText=replace(raw"""
\begin{multi}{__QNAME}
Egy dobozban $__DB$ cédula van, rajtuk a $__CED$ számok. Egy véletlenszerűen 
kihúzott cédula esetén jelentse $X$ az első, $Y$ a második számjegyét.
Ekkor $X$ és $Y$
\item* __JV
\item __RV1
\item __RV2
\item __RV3
\end{multi}
""",[
   "__QNAME",qname,
   "__DB",string(db),
   "__CED",toS(ced//1,brac=false),
   "__JV",jv,
   "__RV1",rv1,
   "__RV2",rv2,
   "__RV3",rv3
   ])

   print(_out,qText)

end
