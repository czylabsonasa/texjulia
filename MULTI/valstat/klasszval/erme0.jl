let
  exname="erme0"

  n=rand(6:2:12) 
  osszes=2^n
  kedvezo=(osszes-binomial(n,n÷2))//2

  jv=kedvezo//osszes
  rv1=(kedvezo+1)//(osszes)
  rv2=(kedvezo+3)//(2*osszes)
  rv3=(kedvezo-1)//osszes

  egyik,masik="fejet","írást"
  (rand()<0.5)&&((egyik,masik)=(masik,egyik))

  n,jv,rv1,rv2,rv3=tstring.([n,jv,rv1,rv2,rv3])

  body=mreplace(
  raw"""
\begin{multi}{__EXNAME}
$__N$ érmét feldobva, mennyi a valószínűsége hogy
több __E kapunk mint __M ?
\item* $__JV$
\item $__RV1$
\item $__RV2$
\item $__RV3$
\end{multi}
"""
  ,
  [
  "__EXNAME"=>exname,
  "__N"=>n,
  "__JV"=>jv,
  "__RV1"=>rv1,
  "__RV2"=>rv2,
  "__RV3"=>rv3,
  "__E"=>egyik,
  "__M"=>masik
  ])
end
