let
    qname="pMul"

    a1=rand(2:5)
    sol=1//a1

    jv=toS(sol)
    rv1=toS(1-sol//2)
    rv2=toS(sol//2)
    rv3=toS(sol//3)


qText=raw"""
\begin{multi}{__QNAME}
A [0,1] intervallumon kiválasztunk két számot.
Mennyi a valószínűsége, hogy az egyik szám több mint
__A1x akkora mint a másik?
\item* $__JV$
\item  $__RV1$
\item  $__RV2$
\item  $__RV3$
\end{multi}
"""

    qText=replace(qText,"__QNAME"=>qname)
    qText=replace(qText,"__A1"=>string(a1))
    qText=replace(qText,"__JV"=>jv)
    qText=replace(qText,"__RV1"=>rv1)
    qText=replace(qText,"__RV2"=>rv2)
    qText=replace(qText,"__RV3"=>rv3)
    print(_out,qText)

end
