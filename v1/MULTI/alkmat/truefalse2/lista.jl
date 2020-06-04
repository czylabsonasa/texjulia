haromszog=[
  IG=(
    "Egy derékszögű háromszög két befogójának összege nagyobb mint az átfogóval.",
    "Minden szabályos háromszög egyenlőszárú.",

  ),
  HA=(
    "Egy derékszögű háromszög két befogójának összege egyenlő az átfogóval"
    "Minden egyenlőszárú háromszög szabályos.",
  )


]
floatHA=[
raw"""In a floating point system ${\cal F}$, the distances between neighbouring 
numbers are fixed, and it is the system's characteristic property""",
raw"""Floating point addition is an associative operation: 
$(x+y)+z=x+(y+z)$ for all $x,y,z\in {\cal F}$""",
# raw"""Floating point addition is not commutative: 
# $x+y\neq y+x$ for some $x,y\in {\cal F}$""",
raw"""In a floating point system ${\cal F}$ the normalized representation of 
$1$ is $a^2\ 0.010...0$""",
]


floatIG=[
raw"""In a floating point system $\cal{F}$, the distances between neighbouring numbers depend on 
the magnitude of numbers""",
raw"""Floating point addition is not associative: 
$(x+y)+z\neq x+(y+z)$ for some $x,y,z\in {\cal F}$""",
# raw"""Floating point addition is commutative: $x+y = y+x$ for all $a,b\in {\cal F}$""",
raw"""In a floating point system ${\cal F}$ the normalized representation of 
$1$ is $a^1\ 0.10...0$""",
]

#################################################################################

normaHA=[
raw"$0<\cond(A)<1$",
raw"The value of the condition number does not depend on the norm used.",  
raw"For any induced matrix norm $\Vert AB\Vert = \Vert A\Vert \Vert B\Vert$",
raw"$x \mapsto \sqrt{x_1^2+x_2^2-x_3^2}$ defines a norm in $\R^3$",
raw"$\Vert x+y \Vert< \Vert x \Vert + \Vert y\Vert$ for all $x\neq y$",
raw"The $1$-norm for $x \in \R^3$ is defined by: $\max\{|x_1|,|x_2|,|x_3|\}$",
raw"The $\infty$-norm for  $x \in \R^2$ is defined by: $|x_1|+|x_2|$",
raw"""$\sqrt{(x_1+y_1)^2+(x_2+y_2)^2} > \sqrt{x_1^2+x_2^2} + \sqrt{y_1^2+y_2^2}$ 
for some $x,y\in \R^2$""",
raw"""The induced $1$-norm of $A=(a_{ij})\in {\cal M}_{2\times 2}$ is: 
$\max\{|a_{11}|+|a_{12}|,|a_{21}|+|a_{22}|\}$""",
raw"""The induced $\infty$-norm of $A=(a_{ij})\in {\cal M}_{2\times 2}$ is: 
$\max\{|a_{11}|+|a_{21}|,|a_{12}|+|a_{22}|\}$""",
]

normaIG=[
raw"$\cond(A)\ge 1$",
raw"The value of the condition number does depend on the norm used.",  
raw"For any induced matrix norm $\Vert AB\Vert\le\Vert A\Vert \Vert B\Vert$",
raw"$x \mapsto \sqrt{x_1^2+x_2^2+x_3^2+x_4^2}$ defines a norm in $\R^4$",
raw"$\Vert x+y \Vert \le \Vert x \Vert + \Vert y\Vert$ for all $x,y$",
raw"The $1$-norm for an $x \in \R^3$ is defined by: $|x_1|+|x_2|+|x_3|$",
raw"The $\infty$-norm for an $x\in \R^4$ is defined by: $\max\{|x_1|,|x_2|,|x_3|,|x_4|\}$",
raw"""$\sqrt{(x_1+y_1)^2+(x_2+y_2)^2} \le \sqrt{x_1^2+x_2^2} + \sqrt{y_1^2+y_2^2}$ 
for all $x,y\in R^2$""",
raw"""The induced $1$-norm of $A=(a_{ij})\in {\cal M}_{2\times 2}$ is: 
$\max\{|a_{11}|+|a_{21}|,|a_{12}|+|a_{22}|\}$""",
raw"""The induced $\infty$-norm of $A=(a_{ij})\in {\cal M}_{2\times 2}$ is: 
$\max\{|a_{11}|+|a_{12}|,|a_{21}|+|a_{22}|\}$""",
]

#################################################################################

linsysHA=[
raw"""The complexity of the Gaussian elimination for an $n\times n$ 
matrix is ${\cal O}(n^2)$""",
raw"Any square, invertible matrix admits an LU-decomposition.",
raw"Any square, symmetric matrix admits the Cholesky-decomposition.",
]


linsysIG=[
raw"""The complexity of the Gaussian elimination for an $n\times n$ 
matrix is ${\cal O}(n^3)$""",
raw"Any square matrix admits a PLU-decomposition.",
raw"Any square, symmetric and positive definite matrix admits the Cholesky-decomposition.",
]

#################################################################################


lknHA=[
  raw"The Gaussian normal equation of the least-squares approximation always possess a unique solution",
]

lknIG=[
  raw"The Gaussian normal equation of the least-squares approximation always possess a solution",
]

#################################################################################

interpolHA=[
raw"The complexity of the Horner method for evaluating $n$-th order polynomials is ${\cal O}(n^2)$",
raw"""There is exactly one polynomial $p$ of degree no more than $n-1$,  
for which $p(t_i)=f_i,\ \ i=1,\ldots,n$""",
raw"""There is exactly one polynomial $p$ for which $p(t_i)=f_i,\ \ i=1,\ldots,n$ - 
provided that the $t_i$'s are pairwise different""",
]


interpolIG=[
raw"The complexity of the Horner method for evaluating $n$-th order polynomials is ${\cal O}(n)$",
raw"""There is exactly one polynomial $p$ of degree no more than $n-1$,  
for which $p(t_i)=f_i,\ \ i=1,\ldots,n$ - provided that the $t_i$'s are pairwise different""",
raw"""For all point set with different base points, there are infinitely many different 
interpolating polynomials.""",
]




#################################################################################
#################################################################################

