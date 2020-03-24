mquizname="interpol"
mcoll=[
  (
    tema="octave",
    darab=-1,
    lista=fill("polyfit2",33) # 33-at csinal
  ),
  (
    tema="lagrange",
    darab=0,
    lista=[
      "egyenes",
      "parabola",
      "foeh3",
      "foeh4",
      "fokszam",
    ]

  ),

  (
    tema="hermite",
    darab=0,
    lista=[
      "ertek", # egy derivált
      "ertek2", # ket derivált két pontban
      "ertek3", # ket derivált egy pontban
    ]
  ),


  (
    tema="octave",
    darab=0,
    lista=[
      "polyfit1", # melyik a helyes
      "polyfit2", # melyek igazak
      "polyfit3", # melyek igazak
    ]
  ),

  (
    tema="horner",
    darab=0,
    lista=[
      "horner1", # kiertekeles reszletesen
    ]
  ),

]
