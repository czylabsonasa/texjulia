let
    exname="tanul"

    #gépek
    pg=[1//1,1//1]
    g1=rand(40:5:60)
    pg[1]=g1//100
    g2=(100-g1)
    pg[2]=g2//100


    #jó arányok
    pj=[1//1,1//4]

    q=rand(1:2)
    sq=["szorgalmas","lusta"]
    v1=sum(pg.*pj)
    v2=pj[q]*pg[q]//v1
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

mreplace(raw"""
\begin{multi}{__EXNAME}
Egy tesztrendszerű vizsgánál a kérdésekre négy válasz-lehetőség közül kell a jót kiválasztani.
A hallgatók __G1\%-a szorgalmas, ők minden kérdésre a jó választ adják, a többiek lusták, ők véletlenszerűen tippelnek.
Kiválasztunk véletlenszerűen egy feladatot a vizsga után.
Mennyi a valsége hogy jó választ látunk rajta? Ha csak a jó választ tartalmazó feladatok közül választunk, 
mennyi az esélye hogy olyan feladatot húzunk mely egy __Q tanulóé?
(A megadott válaszok a kérdéseknek megfelelő sorrendben vannak.)
\item* $__JV$
\item  $__RV1$
\item  $__RV2$
\item  $__RV3$
\end{multi}
""",
[
    "__EXNAME"=>exname,
    "__G1"=>string(g1),
    "__G2"=>string(g2),
    "__J1"=>string(pj[1]),
    "__J2"=>string(pj[2]),
    "__Q"=>sq[q],
    "__JV"=>jv,
    "__RV1"=>rv1,
    "__RV2"=>rv2,
    "__RV3"=>rv3,
]
)
end
