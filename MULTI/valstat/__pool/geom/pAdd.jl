let
    qname="pAdd"

    den=rand(3:5)
    a1=1//den

    jv=(1-a1)^2
    rv1=a1
    rv2=1-a1
    rv3=a1^2

qText=raw"""
\begin{multi}{__QNAME}
A [0,1] intervallumon kiválasztunk két számot.
Mennyi a valószínűsége, hogy távolságuk legalább $__A1$?
\item* $__JV$
\item  $__RV1$
\item  $__RV2$
\item  $__RV3$
\end{multi}
"""

    qText=replace(qText,"__QNAME"=>qname)
    qText=replace(qText,"__A1"=>toS(a1))
    qText=replace(qText,"__JV"=>toS(jv))
    qText=replace(qText,"__RV1"=>toS(rv1))
    qText=replace(qText,"__RV2"=>toS(rv2))
    qText=replace(qText,"__RV3"=>toS(rv3))
    print(_out,qText)

end
