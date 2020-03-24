let
  exname="vezetoseg"

  n=rand(9:20)
  v=rand(2:5)
  jv=prod(20:-1:20-(v-1))
  rv1=binomial(n,v)
  rv2=jv+rand([-1,1])
  rv3=n^v


  n,v,jv,rv1,rv2,rv3=string.([n,v,jv,rv1,rv2,rv3])

  mreplace(
  raw"""
  \begin{multi}{__EXNAME}
  Egy $__N$ tagú társaság $__V$ tagú vezetőséget választ. 
  A vezetőség tisztségei különbözőek (elnök,alelnök,titkár,...)
  és egy ember legfeljebb egy tisztséget tölthet be. Hányféleképpen választhatnak?
  \item* $__JV$
  \item  $__RV1$
  \item  $__RV2$
  \item  $__RV3$
  \end{multi}
  """
  ,
  [
      "__EXNAME"=>exname,
      "__N"=>n,
      "__V"=>v,
      "__JV"=>jv,
      "__RV1"=>rv1,
      "__RV2"=>rv2,
      "__RV3"=>rv3
  ])
end
