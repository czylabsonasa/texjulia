

####################################################



tstring(r::Int)=string(r)
function tstring(r::Float64)
  if r==Inf
    raw"\infty"
  elseif r==-Inf
    raw"-\infty"
  else
    string(round(r; digits=6))
  end
end

function tstring(r::Complex)
  ret="0"
  if abs(r.re)>1e-16
    ret=tstring(r.re)
  end
  if abs(r.im)>1e-16 
    if r.im<0
      ret*=tstring(r.im)
    else
      ret*="+"*tstring(r.im)
    end
    ret*=raw"\text{i}"
  end
  ret
end





# racionalis tex-alakja
function tstring(r::Rational{Int})
  if 0==r.num
     return "0"
  end
  if 1==r.den
     return string(r.num)
  end
  ret=""
  if r.num<0
     ret="-"
     r=-r
  end
  return ret*"\\frac{$(r.num)}{$(r.den)}"
end

# ketdim string matrix -> tex matrix
function tmatrix(A::Array{String,2}; delim::String="",brac=["[", "]"])
  r,c=size(A)
  ret="{"*repeat('c',c)*"}"
  for i in 1:r
     if i>1
        ret=ret*"\\\\ "
     end
     for j in 1:c
        if j>1
           ret=ret*delim*"& "
        end
        ret=ret*A[i,j]
     end
  end
  tbrac(ret|>tarr,brac)
end

# string vector -> tex matrix
function tvector(A::Array{String}; delim::String="",brac=["[", "]"])
  c=length(A)
  ret="{"*repeat('c',c)*"}"
  for j in 1:c
    if j>1
        ret=ret*delim*"& "
    end
    ret=ret*A[j]
  end
  tbrac(ret|>tarr,brac)
end


function tlista(A::Array{String}; delim::String=raw",\ ",brac=["(", ")"])
  tbrac(join(A,delim), brac)
end


# function ttable(A::Array{String,2})
#   r,c=size(A)
#   ret=raw"{\begin{array}{l|"*repeat("|c",c-1)*"}"
#   for i in 1:r
#      for j in 1:c
#         if j>1
#            ret=ret*"& "
#         end
#         ret*=A[i,j]
#      end
#      ret*=raw"\\ "
#      if i<r
#         ret*=raw"\hline "
#      end
#   end
#   ret=ret*raw"\end{array}}"
#   ret
# end

# elso ket sor t,f_0
function prelag(A::Array{Array{String,1}})
  r=length(A)
  n=length(A[1])
  ret=fill(" ",r,2n-1)
  ret[1,1:2:2n-1].=A[1]
  ret[2,1:2:2n-1].=A[2]
  for i=3:r
    # h=n-i+2
    h=length(A[i])
    ret[i,i-1:2:i-1+2*(h-1)]=A[i]
  end
  ret
end
# up to down shape
function tlagtableUD(A::Array{Array{String,1}})
  A=prelag(A) # matrix lesz A
  r,c=size(A)
  ret=raw"{l|"*repeat("c",c)*"}"
  ret*="t& "*join(A[1,:],"& ")*raw"\\ "
  ret*=raw"\hline "
  ret*="f& "*join(A[2,:],"& ")*raw"\\ "

  for i in 3:r
    ret*="f^{($(i-2))}& "*join(A[i,:],"& ")*raw"\\ "
  end
  ret |> tarr |> tdmm
end

# up to down shape
function tlagtableLR(A::Array{Array{String,1}})
  # n=length(A[1])
  A=prelag(A) # matrix lesz A
  A=permutedims(A,(2,1))
  r,c=size(A)
  n=c-1
  ret=raw"{l |c"*repeat("c",c-2)*"} "
  ret*="t& f"
  if n-1>0
    ret*="& "*join(["f^{($(i))}" for i=1:n-1],"& ")
  end
  ret*=raw"\\ \hline"
  
  for i=1:r
    ret*=join(A[i,:],"& ")*raw"\\ "
  end
  ret |> tarr |> tdmm
end

# up to down
function tlagtableUD(A::Array{Array{Rational{Int},1}})
  tlagtableUD([tstring.(v) for v=A])
end

# left to right
function tlagtableLR(A::Array{Array{Rational{Int},1}})
  tlagtableLR([tstring.(v) for v=A])
end



# adat-tablazat
function ttable(x::Array{String,1},sx::String,y::Array{String,1},sy::String)
  n=length(x)
  ret=raw"{l ||"*repeat("c|",n-1)*"c}"# ^+join
  ret=ret*sx*"&"
  for i in 1:n
     if i>1
        ret=ret*"&"
     end
     ret=ret*x[i]
  end
  ret=ret*raw"\\ \hline "
  ret=ret*sy*"&"
  for i in 1:n
     if i>1
        ret=ret*"&"
     end
     ret=ret*y[i]
  end
  ret*raw" \\ " |> tarr
end

function ttable(x::Array{Rational{Int},1},sx::String,y::Array{Rational{Int},1},sy::String)
  ttable(tstring.(x),sx,tstring.(y),sy)
end

function ttable(A::Array{String,2},nevek::Array{String,1})
  r=length(nevek)
  c=length(A[1,:])
  println(stderr,r," ",c)
  ret=raw"{l ||"*"r"^c*"}"
  ret*=nevek[1]*"& "*join(A[1,:],"& ")*raw"\\ \hline "
  for k=2:r
    ret*=nevek[k]*"& "*join(A[k,:],"& ")*raw"\\ "
  end
  ret |> tarr
end

# ezt nem lehet Array{String}-es mert nezni kell az elojeleket
# hol hasznalom?
# itt a p-ben novekvo rend szerint vannak
# [0,0]//1 re nem jo!!!!
function tpoly(p::Array{Rational{Int}};x="x",order="dec")
  n=length(p)-1
  if n==0 # nulladfokú (egyelemű tömb)
     return tstring(p[1])
  end
  tagok=0:n
  if order=="dec" 
     tagok=n:-1:0
  end
  ret=""
  for k in tagok
     c=p[k+1]
     if c==0 continue end
     if c>0
        ret*="+"
     else
        ret*="-"
     end
     ac=abs(c)
     if ac!=1
        ret*=tstring(ac)
     end
     if k>0
        ret*=x
        if k>1
           ret*="^$(k)"
        end
     else
        if ac==1
           ret*="1"
        end
     end
  end
  if '+'==ret[1]
     ret=ret[2:end]
  end

  ret
end


# newton alakhoz (x-a)(x-b)
function mkxx(s,xk,x)
  if xk==0
    s*x
  else
    if xk<0
      "$(s)($(x)+$(tstring(abs(xk))))"
    else
      "$(s)($(x)-$(tstring(abs(xk))))"
    end
  end
end

function tpoly(p::Array{Rational{Int}}, t::Array{Rational{Int}}; x="t")
  n=length(p)-1
  if n==0 # nulladfokú (egyelemű tömb)
     return tstring(p[1])
  end
  tagok=0:n
  xx=""
  ret=""
  for k in tagok
    c=p[k+1]
    if c!=0 
      if c>0
        ret*="+"
      else
        ret*="-"
      end
      ac=abs(c)
      ret*=tstring(ac)
      ret*=xx
    end
    xx=mkxx(xx,t[k+1],x)
  end
  if '+'==ret[1]
     ret=ret[2:end]
  end
  ret
end

