# racionalis latex alakja, hagyomanyos egy /-es jelolessel + 2//1->2 stb.
#!!!TODO!!!
# elég sok felesleges dolog van itt, elsősorban a map(broadcast) használatával
# egyszerüsíthető...

function toS(r::Int64)
    string(r)
end

function toS(r::Rational{Int64})
   if 0==numerator(r)
      return "0"
   end
   if 1==denominator(r)
      return toS(numerator(r))
   end
   ret=""
   if numerator(r)<0
      ret="-"
      r=-r
   end
   return ret*"\\frac{$(numerator(r))}{$(denominator(r))}"
end

function toS(r::Float64)
   string(round(r; digits=4))
end



function toS(z::Complex)
   ret=""
   rz=toS(real(z))
   iz=toS(imag(z))
   if 0==imag(z)
      return rz
   end
   if 0==real(z)
      return iz*"i"
   end
   if imag(z)<0
      return rz*iz*"i"
   else
      return rz*"+"*iz*"i"
   end
end

function toS(r::String)
    r
end


#vektor
function toS(v::Array{T,1};delim::String=", ",brac::Bool=true) where {T}
   ret=""
   if brac==true
      ret="\\left["
   end

   for i in 1:length(v)
      if i>1
         ret=ret*delim
      end
      ret=ret*toS(v[i])
   end
   if brac==true
      ret=ret*"\\right]"
   end
   return ret
end

function toS(A::Array{T,2};delim::String="",brac::Bool=true) where {T}
   r,c=size(A)
   ret="{\\begin{array}{"*repeat('c',c)*"}"
   for i in 1:r
      if i>1
         ret=ret*"\\\\ "
      end
      for j in 1:c
         if j>1
            ret=ret*delim*"& "
         end
         ret=ret*toS(A[i,j])
      end
   end
   ret=ret*"\\end{array}}"
   if brac==true
      ret="\\left["*ret*"\\right]"
   end
   return ret
end

function toTable(A::Array{String,2})
   r,c=size(A)
   ret=raw"{\begin{array}{l|"*repeat("|c",c-1)*"}"
   for i in 1:r
      for j in 1:c
         if j>1
            ret=ret*"& "
         end
         ret*=A[i,j]
      end
      ret*=raw"\\ "
      if i<r
         ret*=raw"\hline "
      end
   end
   ret=ret*raw"\end{array}}"

   ret
end


function _toTable(x::Array{Rational{Int},1},sx::String,y::Array{Rational{Int},1},sy::String)
   n=length(x)
   ret=raw"\begin{array}{l ||"*repeat("c|",n-1)*"c}"
   ret=ret*sx*"&"
   for i in 1:n
      if i>1
         ret=ret*"&"
      end
      ret=ret*toS(x[i])
   end
   ret=ret*raw"\\ \hline "
   ret=ret*sy*"&"
   for i in 1:n
      if i>1
         ret=ret*"&"
      end
      ret=ret*toS(y[i])
   end
   ret=ret*raw" \\ "
   ret=ret*raw"\end{array}"
end

function toTable(x::Array{T,1},sx::String,y::Array{S,1},sy::String) where {T,S}
   n=length(x)
   ret=raw"\begin{array}{l ||"*repeat("c|",n-1)*"c}"
   ret=ret*sx*"&"
   for i in 1:n
      if i>1
         ret=ret*"&"
      end
      ret=ret*toS(x[i])
   end
   ret=ret*raw"\\ \hline "
   ret=ret*sy*"&"
   for i in 1:n
      if i>1
         ret=ret*"&"
      end
      ret=ret*toS(y[i])
   end
   ret=ret*raw" \\ "
   ret=ret*raw"\end{array}"
end
