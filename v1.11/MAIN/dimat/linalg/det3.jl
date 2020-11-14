let
  exname="det3"
  n=3
  A=rand(-10:10, n, n)//1  # igy nem hasznal lebegopontos algoritmust
  jv=det(A)
  jv=tstring(jv)
  A=tstring.(A) |> tmatrix |> tdmm

mreplace(raw"""
\begin{numerical}{__EXNAME}
Számolja ki az alábbi mátrix determinánsát:
__A

\item __JV
\end{numerical}
""",
  [
    "__EXNAME"=>exname,
    "__A"=>A,
    "__JV"=>jv,
  ]
)
end
