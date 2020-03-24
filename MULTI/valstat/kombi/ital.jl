let
  exname="ital"

  a1=rand(7:13)
  a2=rand(3:4)

  jv=prod((a1-(a2-1)):a1)
  rv1=prod(1:a2)
  rv2=div(jv,prod(1:a2))
  rv3=a1*a2


  a1,a2,jv,rv1,rv2,rv3=string.([a1,a2,jv,rv1,rv2,rv3])

  mreplace(
  raw"""
  \begin{multi}{__EXNAME}
  Van $__A1$ különböző italod, 1-1 üvegnyi. Eldöntötted, hogy
  óránként megiszol egyet, összesen $__A2$-t.
  Hányféleképpen ihatsz?

  \item* $__JV$
  \item  $__RV1$
  \item  $__RV2$
  \item  $__RV3$
  \end{multi}
  """
  ,
  [
      "__EXNAME"=>exname,
      "__A1"=>a1,
      "__A2"=>a2,
      "__JV"=>jv,
      "__RV1"=>rv1,
      "__RV2"=>rv2,
      "__RV3"=>rv3
  ])
end