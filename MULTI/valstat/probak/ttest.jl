let
  exname="ttest"
  
  MU=rand(150:10:200)
  SIGMA=rand(1:5)

  r(x)=round.(x,digits=4)

  N=rand(8:12)

  p=[0.75,0.90,0.95,0.975,0.98,0.99,0.995]
  student=TDist(N-1)
  q=quantile.(student,p)
  table=ttable(p,"p",q,"t_{$(N-1)}(p)")
  

  F=Normal(MU,1.5*SIGMA)
  X=rand(F,N); X=r(X)

  SUM=sum(X); SUM=r(SUM)
  SUM2=sum(X.*X) ; SUM2=r(SUM2)
  t=(mean(X)-MU)/(std(X)/sqrt(N)) ; t=r(t)
  al=rand([0.10,0.05,0.02,0.01],3)
  c=quantile.(student,1 .-0.5*al); c=r(c)

  jv,rv1,rv2,rv3=["" for it in 1:4]

  if abs(t)<c[1]
    jv=mreplace(raw"elfogadjuk, mivel $ |t|=__T < __C $, ahol $ t_{__DF}(__P)=__C $",
    [
        "__T"=>tstring(abs(t)),
        "__C"=>tstring(c[1]),
        "__P"=>tstring(1-0.5*al[1]),
        "__DF"=>tstring(N-1)
    ])
    rv1=mreplace(raw"elfogadjuk, mivel $ |t|=__T < __C $, ahol $ t_{__DF}(__P)=__C $",
    [
        "__T"=>tstring(0.9*c[2]),
        "__C"=>tstring(c[2]),
        "__P"=>tstring(1-0.5*al[2]),
        "__DF"=>tstring(N-1)
    ])
    rv2=mreplace(raw"elvetjük, mivel $ |t|=__T > -__C $, ahol $ t_{__DF}(__P)=__C $",
    [
        "__T"=>tstring(abs(t)),
        "__C"=>tstring(c[3]),
        "__P"=>tstring(1-0.5*al[3]),
        "__DF"=>tstring(N-1)
    ])
    rv3=mreplace(raw"elvetjük, mivel $ |t|=__T > __C $, ahol $ t_{__DF}(__P)=__C $",
    [
        "__T"=>tstring(1.1*c[3]),
        "__C"=>tstring(c[3]),
        "__P"=>tstring(1-0.5*al[3]),
        "__DF"=>tstring(N-1)
    ])
  else
    jv=mreplace(raw"elvetjük, mivel $ |t|= __T \ge __C $, ahol $ t_{__DF}(__P)=__C $",
    [
        "__T"=>tstring(abs(t)),
        "__C"=>tstring(c[1]),
        "__P"=>tstring(1-0.5*al[1]),
        "__DF"=>tstring(N-1)
    ])
    rv1=mreplace(raw"elfogadjuk, mivel $ |t|=__T < __C $, ahol $ t_{__DF}(__P)=__C $",
    [
      "__T"=>tstring(0.9*c[2]),
      "__C"=>tstring(c[2]),
      "__P"=>tstring(1-0.5*al[2]),
      "__DF"=>tstring(N-1)
    ])
    rv2=mreplace(raw"elvetjük, mivel $ |t|=__T > -__C $, ahol $ t_{__DF}(__P)=__C $",
    [
      "__T"=>tstring(abs(t)),
      "__C"=>tstring(c[3]),
      "__P"=>tstring(1-0.5*al[3]),
      "__DF"=>tstring(N-1)
    ])
    rv3=mreplace(raw"elvetjük, mivel $ |t|=__T > __C $, ahol $ t_{__DF}(__P)=__C $",
    [
      "__T"=>tstring(1.1*c[3]),
      "__C"=>tstring(c[3]),
      "__P"=>tstring(1-0.5*al[3]),
      "__DF"=>tstring(N-1)
    ])
  end

  mreplace(raw""" 
\begin{multi}{__EXNAME}
Egy zacskós tea-féle névleges (átlagos) tömege a gyártó állítása szerint $ __MU $ gramm. 
A fogyasztóvédelem emberei véletlenszerűen megvizsgáltak  néhány 
terméket ( $ X_{1},\ldots,X_{__N}$ ) és a következő eredményeket kapták:
$$
\sum_{k=1}^{ __N } X_{k}= __SUM \hspace{1cm} \sum_{k=1}^{ __N } X^{2}_{k}= __SUM2
$$  
$$
__TABLE
$$
A töltőtömeg normalitását feltételezve a minta alapján a gyártó állítását 
$ \alpha=__ALPHA $ szinten
\item*  __JV 
\item  __RV1 
\item  __RV2 
\item  __RV3 
\end{multi}
""",[
  "__EXNAME"=>exname,
  "__TABLE"=>table,
  "__MU"=>tstring(MU),
  "__SIGMA"=>tstring(SIGMA),
  "__N"=>tstring(N),
  "__SUM2"=>tstring(SUM2),
  "__SUM"=>tstring(SUM),
  "__ALPHA"=>tstring(al[1]),
  "__JV"=>jv,
  "__RV1"=>rv1,
  "__RV2"=>rv2,
  "__RV3"=>rv3
])

end
