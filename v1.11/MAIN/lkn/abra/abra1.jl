let
  exname="abra1"

OCT=raw"""
figure ("visible", "off");
TIT="ABCD";
T=__T; 
F=__F;
for it=1:4
  subplot(2,2,it);
  t=T(it,:); f=F(it,:);
  plot(t,f,'*');
  p=polyfit(t,f,1);
  hold on;
  dom=linspace(min(t)-1,max(t)+1,10);
  plot(dom,polyval(p,dom));
  axis([min(t)-2, max(t)+2 min(f)-2 max(f)+2])
  title(TIT(it))
  hold off;
end
print -dpng __NEV
"""
  arr2str(x)="["*join( [join([ string(v) for v in xi]  ,", ") for xi in x] ,"; ")*"]"

  np=5
  t=sample(-20:20,2*np,replace=false)
  f=t[np+1:end]
  t=t[1:np]

  dt=Int(ceil(maximum(abs.(t))*0.5))
  df=Int(ceil(maximum(abs.(f))*0.5))

  T=[t,t.-dt, t.+dt, t]
  F=[f,f.+df, -f.-df, -f]
  perm=rand(collect(permutations([1,2,3,4])))
  T=T[invperm(perm)]
  F=F[invperm(perm)]

  jv,rv1,rv2,rv3="ABCD"[perm]

  TBL=ttable(tstring.(t),"t",tstring.(f),"f") |> tdmm

  NEV="/tmp/pic"*string(hash(time()));
  prog=mreplace(OCT,
    [
      "__T"=>arr2str(T),
      "__F"=>arr2str(F),
      "__NEV"=>NEV,
    ]
  )
  msaveandrun(prog,"OCT")


mreplace(raw"""
\begin{multi}{__EXNAME}
\includegraphics[width=110ex]{__NEV}

One of the plots corresponds to the linear approximation of the data below.
Choose the correct one!
__TBL
  \item* __JV
    \item  __RV1
    \item  __RV2
    \item  __RV3
    \end{multi}
    """, [
      "__EXNAME"=>exname,
      "__JV"=>jv,
      "__RV1"=>rv1,
      "__RV2"=>rv2,
      "__RV3"=>rv3,
      "__TBL"=>TBL,
      "__NEV"=>NEV,
    ]
  )
end
