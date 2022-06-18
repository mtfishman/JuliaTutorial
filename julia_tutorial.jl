
using Random
Random.seed!(1234)

struct BeginDropdown
  title::String
end
BeginDropdown() = BeginDropdown("")
Base.show(io::IO, m::MIME"text/html", b::BeginDropdown) = write(io, "<details><summary  style=\"display:list-item\">$(b.title)</summary>")

struct EndDropdown
end
Base.show(io::IO, m::MIME"text/html", e::EndDropdown) = write(io, "</details>")


function estimate_pi(n)
  s = 1.0
  for i in 1:n
    if i % 2 == 1
      si = -1 / (2i + 1)
    else
      si = 1 / (2i + 1)
    end
    s += si
  end
  return 4s
end
my_pi = estimate_pi(100_000_000)
my_pi - pi


@time estimate_pi(100_000_000)
using BenchmarkTools
@benchmark estimate_pi(100_000_000)


1 + 2
1 - 2
1.2 + 3.4


complex(1.2, 3.4)
1.2 + 3.4im
typeof(1.2 + 3.4im)


typeof(1)
typeof(1.2)
1 + 1.2
typeof(1 + 1.2)
2 * 1
typeof(2 * 1)
2 * 1.0
typeof(2 * 1.0)


x = 2
y = 3
z = x + y


let
  x::Int = 2
  y::Int = 3
  z::Int = x + y
end


pi
π # \pi TAB
typeof(π)
θ = π / 2 # \theta TAB


string1 = "hello "
string2 = "world!"
string1 * string2
string1^4
x = 12
"The answer is always $x"


sin(0.2)
sin(90 / 360 * 2 * π)
exp(log(x + 1))


function plus1(x)
  return x + 1
end
plus1(2)
plus1(2.3)
plus1("X") # Error


plus1(x) = x + 1


function plus1(x::String)
  return x * " + 1"
end
plus1("X")


using InteractiveUtils


@code_native plus1(1)
@code_native plus1(1.3)
@code_native plus1("X")


numbers = [10, 20, 30, 40]
typeof(numbers)
strings = ["X", "Y", "Z", "W"]
typeof(strings)
any = [10, "Y", 30, "W"]
typeof(any)


reshape(numbers, 2, 2)


numbers[1]
strings[2]


numbers[1] = 1
numbers
numbers[1] = "A" # Not allowed
any[3] = 1 + 2im
any


sin.(numbers)


sort([23, 14, 32, 41])
digits(1234)
sort([23, 14, 32, 41]; by=x -> first(digits(x)))


A = randn(2, 2, 2)
A[1, 2, 1]
zeros(2, 2, 2)


A = randn(2, 2)
B = randn(2, 2)
A * B
A * B' # ' denotes conjugate transpose
using LinearAlgebra
U, S, V = svd(A)
U * Diagonal(S) * V' ≈ A
Q, R = qr(A)
Q * R ≈ A


function is_smaller_than_3(x)
  if x < 3
    println("The input is small")
  else
    println("The input is big")
  end
  return nothing
end

is_smaller_than_3(1.2)
is_smaller_than_3(3.4)


using Pkg
Pkg.add("Symbolics")
using Symbolics
@variables x y
z = expand((x + y)^2)
substitute(z, Dict(y => 3))


using Pkg
Pkg.add("UnicodePlots")
using UnicodePlots
lineplot(sin, 0:0.1:2π)


# https://github.com/JunoLab/Weave.jl/issues/436
ENV["GKSwstype"]="nul"


using Pkg
Pkg.add("Plots")
using Plots
plot(sin, 0:0.1:2π);


ENV["GKSwstype"]="gksqt"


struct Polar <: Number
  r::Float64
  θ::Float64
end
z1 = Polar(1.2, π / 2)
Base.show(io::IO, z::Polar) = print(io, z.r, " * exp(", z.θ, "im)")
z1


z2 = Polar(3.3, π / 3)
z1 * z2
import Base: * # Overload the behavior of * for our new type
*(z1::Polar, z2::Polar) = Polar(z1.r * z2.r, z1.θ + z2.θ)
z1 * z2


z1 ^ 3


2.3 * z1
*(z1::Real, z2::Polar) = Polar(z1 * z2.r, z2.θ)
2.3 * z1
*(z1::Polar, z2::Real) = Polar(z1.r * z2, z1.θ)
z1 * 2.3


A = [z1 z2; z2 z1]
3 * A


A / 2
A * A


z1 / z2
import Base: /
/(z1::Polar, z2::Polar) = Polar(z1.r / z2.r, z1.θ - z2.θ)
z1 / z2


z1^(1 / 3)
import Base: ^
^(z::Polar, n::Float64) = Polar(z.r^n, n * z.θ)
z1^(1 / 3)


z1 + z2
import Base: +
function +(z1::Polar, z2::Polar)
  real = z1.r * cos(z1.θ) + z2.r * cos(z2.θ)
  imag = z1.r * sin(z1.θ) + z2.r * sin(z2.θ)
  z = real + imag * im
  return Polar(abs(z), angle(z))
end
z1 + z2


A = [z1 z2; z2 z1]
A * A
A ^ 3


using Pkg
Pkg.add("PythonCall")
using PythonCall
Pkg.add("CondaPkg")
using CondaPkg
CondaPkg.add("numpy")
np = pyimport("numpy")
A = [1 2; 3 4]
B = [5 6; 7 8]
Cnp = np.einsum("ij,jk->ik", np.array(A), np.array(B))
C = pyconvert(Matrix, Cnp)


using Pkg
Pkg.add("Zygote")
using Zygote
sin'(π / 6), cos(π / 6)
function f(x)
  M = [exp(x) exp(-x); exp(-x) exp(x)]
  return tr(M * M)
end
f'(0.2)

