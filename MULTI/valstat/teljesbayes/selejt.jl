let
  exname="selejt"

  #gépek
  pg=[1//1,1//1]
  g1=rand(40:70)
  pg[1]=g1//100
  g2=(100-g1)
  pg[2]=g2//100


  #selejtarányok
  ps=[1//1,1//1]
  s1,s2=rand(3:7),rand(3:7)
  ps[1],ps[2]=s1//100,s2//100

  q=rand(1:2)
  v1=sum(pg.*ps)
  v2=ps[q]*pg[q]//v1

  jv=tstring(v1)*",  "*tstring(v2)

  v1=v1//2
  v2=1-v2
  rv1=tstring(v1)*",  "*tstring(v2)

  v1=1-v1
  v2=v2//3
  rv2=tstring(v1)*",  "*tstring(v2)

  v1=v1/3
  v2=1-v2
  rv3=tstring(v1)*",  "*tstring(v2)


  g1,g2,s1,s2,v1,v2=tstring.([g1,g2,s1,s2,v1,v2]//1)

  mreplace(
  raw"""
  \begin{multi}{__EXNAME}
  Két gépen azonos típusú alkatrészeket gyártanak. Az első gép
  a termelés __G1\%-át adja, melynek selejtaránya __S1\%.
  A második __S2\% selejtet ad. Kiválasztunk véletlenszerűen egy terméket.
  Mennyi a valsége hogy selejtes? Ha tudjuk hogy ez a termék selejtes,
  mennyi az esélye hogy a __Q. gép gyártotta? (A megadott válaszok a kérdéseknek megfelelő
  sorrendben vannak.)
  \item* $__JV$
  \item  $__RV1$
  \item  $__RV2$
  \item  $__RV3$
  \end{multi}
  """,
  [
      "__EXNAME"=>exname,
      "__G1"=>g1,
      "__G2"=>g2,
      "__S1"=>s1,
      "__S2"=>s2,
      "__Q"=>q,
      "__JV"=>jv,
      "__RV1"=>rv1,
      "__RV2"=>rv2,
      "__RV3"=>rv3
  ])
end
