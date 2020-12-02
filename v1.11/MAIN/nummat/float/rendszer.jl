let
  # az egészet beraktam egy fv-be
  # amit random valasztas volt azt kicsereltem parameterre
  function egy(par)
    exname="rendszer"
    a=par.a
    k=par.k
    t=par.t

    egy=[1-1//a^t,1+a//a^t]

    Minf=a^k[2]*(1//1-1//a^t)
    eps0=1//a^(-k[1]+1)
    #siz=(k[2]-k[1]+1)*(a-1)*a^(t-1)
    egybal=egy[1]
    egyjobb=egy[2]
    eps1=egyjobb-1

    szam=[Minf,eps0,egybal,egyjobb,eps1]
    szimbol=[
      raw"M_{\infty}",
      raw"\varepsilon_{0}",
      raw"1_{-}",
      raw"1_{+}",
      raw"\varepsilon_{1}"
    ]

    m=sample(1:5,3,replace=false)

    mszimbol=tvector(szimbol[m],brac=nothing)
    mSzam=szam[m]
    jv=tvector(tstring.(mSzam),brac=nothing)

    r1=copy(mSzam)
    d=[1,a,a]
    r1=r1.//d
    r1=tvector(tstring.(r1),brac=nothing)


    r2=copy(mSzam)
    d=[a,1//a,1]
    r2=r2.//d
    r2=tvector(tstring.(r2),brac=nothing)

    r3=copy(mSzam)
    d=[1,a,1//a]
    r3=r3.//d
    r3=tvector(tstring.(r3),brac=nothing)

    Fs=mreplace(
    raw" {\cal F}=\left[ a=__a, k_{-}=__k1, k_{+}=__k2, t=__t \right] ",
    [
        "__a"=>tstring(a),
        "__k1"=>tstring(k[1]),
        "__k2"=>tstring(k[2]),
        "__t"=>tstring(t)
    ]
    )


    mreplace(
      raw"""
      \begin{multi}{__EXNAME}
      Az $ __F $ rendszerben az $ __MSZIM $ mennyiségek rendre: 
      \item* $ __JV $
      \item  $ __RV1 $
      \item  $ __RV2 $
      \item  $ __RV3 $
      \end{multi}
      """, [
          "__EXNAME"=>exname,
          "__F"=>Fs,
          "__MSZIM"=>mszimbol,
          "__JV"=>jv,
          "__RV1"=>r1,
          "__RV2"=>r2,
          "__RV3"=>r3,
      ]
    )
  end

  # itt felsolod amiket konkretan akarsz:
  par=[
    (a=2,k=[-3,3],t=4), # ezt erdemes hasznalni, névvel lehet hivatkozni a tagra
    (a=2,k=[-4,3],t=4), # nem kell megjegyezni hogy hanyadik (vectornal nincs ilyen csak tuple-nel)
    (a=2,k=[-4,4],t=4),
    (a=3,k=[-3,3],t=4),
    (a=3,k=[-4,3],t=4),
    (a=3,k=[-4,4],t=4),
  ]

  # a par lista minden elemere meghivjuk az egy-fvt az akt parameterekkel
  # a join a kapott sztring listabol egy sztringet csinal ujsorral elvalasztva
  # ezt fogja a main-fv megkapni (es berakja egy megfelelo tex fajlba)
  join( [egy(v) for v in par], "\n" )
end
