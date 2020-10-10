tmm(s)=raw"$"*s*raw"$" # tex math mode=$
tdmm(s)=raw"$$"*s*raw"$$" # tex display math=$$
tblk(s)=raw"\begin{block}{}"*s*raw"\end{block}" # blokk
tfra(s)=raw"\begin{frame}"*s*raw"\end{frame}" # frame
tarr(s)=raw"\begin{array}"*s*raw"\end{array}" # array
tdoc(s)=raw"\begin{document}"*s*raw"\end{document}" # document
tqui(s,name)=raw"\begin{quiz}{"*name*"}"*s*raw"\end{quiz}" # quiz
ttx(s)=raw"\text{"*s*"}"
tmulti(s;name="multi",sing="true")=raw"\begin{multi}[single="*sing*"]{"*name*"}"*s*raw"\end{multi}"
texpre=raw"""
\documentclass[12pt]{article}
\usepackage{setspace}
\onehalfspace
\usepackage{amsmath}
\usepackage{graphicx}
%%%% \graphicspath{{/tmp/}} % !!!
"""
tpre(s=[])=texpre*join(s,"\n") # s egy string array (ures alapban)


function tbrac(s,brac) # bezarojelezes
  if brac!=nothing 
    "\\left"*brac[1]*s*"\\right"*brac[2]
  else
    s
  end
end

function tmkvhely(ex) # vertikalis hely
  utana=raw"\vspace{"*string(ex)*raw"ex}"
  vhely(s)=s*utana
  vhely
end


############################################
############################################


function beameropen(tit)
raw"""
\documentclass[8pt]{beamer} 
\mode<presentation>
{
 \usetheme{Boadilla}
}
\usepackage[utf8]{inputenc}
\usepackage{amsmath,amssymb}
\author[]{}
\title{"""*tit*raw"""}
\date[]{}
\begin{document} 
\begin{frame}
\maketitle
\end{frame}
"""
end

function beamerclose()
raw"""
\end{document} 
"""
end

beameroc(s,tit)=beameropen(tit)*s*beamerclose()

############################################
############################################


function mktexfile(s,nev)
  fnev=open(nev*".tex","w")
  println(fnev,tpre()*(s |> tdoc))
  close(fnev)
end

