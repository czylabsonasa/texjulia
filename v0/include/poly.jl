# horner
function horner(p)
   function f(x)
      n=length(p)
      px=p[n]
      for i=(n-1):-1:1
         px=px*x+p[i]
      end
      px       
   end
end

function polyDer(pol)
   n=length(pol)
   dpol=[];
   if n==1
      dpol=[0]
   else
      dpol=pol[2:n].*(1:(n-1))
   end
   dpol
end



# veletlen ketvaltozos polinom
# latex alak + ertek a megadott helyen
function ranPoly(x::Int, y::Int)
   tagok=rand(3:4)
   alak=""
   ertek=0
   for tag in 1:tagok
      eh=rand(1:4)
      if rand(0:1)>0
         eh=-eh
      end
      xh=rand(0:2)
      yh=rand(0:2)
      ertek=ertek+eh*x^xh*y^yh
      akt=string(eh)
      if eh>0
         akt="+"*akt
      end
      if xh>0
         if xh>1
            akt=akt*"x^$(xh)"
         else
            akt=akt*"x"
         end
      end
      if yh>0
         if yh>1
            akt=akt*"y^$(yh)"
         else
            akt=akt*"y"
         end
      end
      alak=alak*akt
   end
   if '+'==alak[1]
      alak=alak[2:end]
   end

   return ertek,alak
end


# ez rossz
function _polyToS(p::Array{T,1};x="x") where {T}
   n=length(p)
   function coeff(k)
      a=p[k]
      ret= a>0 ? "+" : "-"
      a=abs(a)
      if a!=1
         ret*=toS(a)
      else
         if a==1 && k==n
            ret*="1"
         end
      end      
      ret
   end
   function vari(k)
      ret=""
      if k>0
         ret=x
      end
      if k>1
         ret*="^{$(k)}"
      end
      ret
   end

   ret=""
   for k in 1:n
      if p[k]!=0
         ret*=coeff(k)*vari(n-k)
      end
   end

   if '+'==ret[1]
      ret=ret[2:end]
   end
   ret
end

function polyToS(p::Array{T,1};x="x",order="dec") where {T}
   n=length(p)-1
   if n==0 # nulladfokú (egyelemű tömb)
      return toS(p[1])
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
         ret*=toS(ac)
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

