function kifejt(s)
  s=strip(s)
  if length(s)==0 || s[1]=='%'
    #s 
    ""
  else  
    s=replace(s,r"(\\Exp)(?=\W)"=>s"\\mathrm{Exp}")
    s=replace(s,r"(\\Binom)(?=\W)"=>s"\\mathrm{Binom}")
    s=replace(s,r"(\\Poi)(?=\W)"=>s"\\mathrm{Poisson}")
    s=replace(s,r"(\\Norm)(?=\W)"=>s"{\\cal N}")
    s=replace(s,r"(\\Unif)(?=\W)"=>s"{\\cal U}")
    s=replace(s,r"(\\E)(?=\W)"=>s"\\mathrm{E}")
    s=replace(s,r"(\\D)(?=\W)"=>s"\\mathrm{D}")
    s=replace(s,r"(\\P)(?=\W)"=>s"\\mathrm{P}")
    s=replace(s,r"(\\cov)(?=\W)"=>s"\\mathrm{cov}")
    s=replace(s,r"(\\corr)(?=\W)"=>s"\\mathrm{corr}")
    s=replace(s,r"(\\cond)(?=[^a-z])"=>s"\\mathrm{cond}") # underscore elrontotta
    s=replace(s,r"(\\d)(?=\W)"=>s"\\mathrm{d }")
    s=replace(s,r"(\\R)(?=\W)"=>s"\\mathbb{R}")
    s=replace(s,r"(\\ldots)(?=\W)"=>s"{...\\:}")
    s  
  end
end
