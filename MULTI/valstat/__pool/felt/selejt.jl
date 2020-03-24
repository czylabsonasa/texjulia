let
    qname="selejt"

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
    jv=toS(v1)*",  "*toS(v2)

    v1=v1//2
    v2=1-v2
    rv1=toS(v1)*",  "*toS(v2)

    v1=1-v1
    v2=v2//3
    rv2=toS(v1)*",  "*toS(v2)

    v1=v1/3
    v2=1-v2
    rv3=toS(v1)*",  "*toS(v2)

qText=raw"""
\begin{multi}{__QNAME}
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
"""
    qText=replace(qText,"__QNAME"=>qname)
    qText=replace(qText,"__G1"=>string(g1))
    qText=replace(qText,"__G2"=>string(g2))
    qText=replace(qText,"__S1"=>string(s1))
    qText=replace(qText,"__S2"=>string(s2))
    qText=replace(qText,"__Q"=>string(q))
    qText=replace(qText,"__JV"=>jv)
    qText=replace(qText,"__RV1"=>rv1)
    qText=replace(qText,"__RV2"=>rv2)
    qText=replace(qText,"__RV3"=>rv3)
    print(_out,qText)

end
