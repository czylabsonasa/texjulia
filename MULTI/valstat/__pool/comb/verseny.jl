let

    qname="verseny"

    a1=rand(7:13)
    a2=rand(3:4)

    jv=prod((a1-(a2-1)):a1)
    rv1=prod(1:a2)
    rv2=div(jv,prod(a2))
    rv3=a1*a2

qText=raw"""
\begin{multi}{__QNAME}
Hányféleképpen végződhet egy futóverseny, ha $__A1$
résztvevő van, az első $__A2$ helyezett érdekel
és nincs holtverseny?
\item* $__JV$
\item  $__RV1$
\item  $__RV2$
\item  $__RV3$
\end{multi}
"""

    qText=replace(qText,"__QNAME"=>qname)
    qText=replace(qText,"__A1"=>string(a1))
    qText=replace(qText,"__A2"=>string(a2))
    qText=replace(qText,"__JV"=>string(jv))
    qText=replace(qText,"__RV1"=>string(rv1))
    qText=replace(qText,"__RV2"=>string(rv2))
    qText=replace(qText,"__RV3"=>string(rv3))

    print(_out,qText)
end
