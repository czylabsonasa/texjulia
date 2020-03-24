texopenmoodle=raw"""
\documentclass[12pt]{article}

\usepackage{setspace}
\onehalfspace

\usepackage{amsmath}
\usepackage{moodle}


\begin{document}

\begin{quiz}{mquizname}
"""

texopen=raw"""
\documentclass[12pt]{article}

\usepackage{setspace}
\onehalfspace

\usepackage{amsmath}

\begin{document}

"""


texclose=raw"""
\end{document}
"""

texclosemoodle=raw"""
\end{quiz}
\end{document}
"""

function mktexfile(s,nev)
  fnev=open(nev*".tex","w")
  println(fnev,texopen*s*texclose)
  close(fnev)
end



# tfname-true/false name
tfpre=raw"""
\begin{multi}[single=false]{mtfname}
"""
tfpreFB=raw"""
\begin{multi}[feedback=_FB]{mtfname}
"""

tfpost=raw"""
\end{multi}
"""

tfdict=Dict(
true=>
raw"""
\item* igaz
\item hamis
""",
false=>
raw"""
\item igaz
\item* hamis
"""
)

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

# vege=raw"""
# \end{document} 
# """
