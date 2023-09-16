### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ e5bf1ad6-cdee-4f7a-8adf-97eb804c583a
using Pkg

# ╔═╡ 062e92f7-0878-4878-8a80-860ed9e1bd43
Pkg.add("BenchmarkTools")

# ╔═╡ c7334536-a047-48e2-ac83-378ef371de5f
Pkg.add("PyCall")

# ╔═╡ 126f1293-c91f-43cb-b8df-d7118f6c1959
Pkg.add("Conda")

# ╔═╡ 79f5782e-ac9e-11ed-18b4-2d81e939096d
using BenchmarkTools  

# ╔═╡ 1244aa4e-720d-40f7-8b20-dbf082fc02cf
using Libdl

# ╔═╡ da356705-0d4a-4733-9240-d18e7836d68b
using Plots

# ╔═╡ e4d85473-3420-4c2e-8820-b1c975be037b
using Statistics # bring in statistical support for standard deviations

# ╔═╡ ca47fe8d-9a3a-463f-9f83-076dc956148b
using PyCall

# ╔═╡ 40cd04dc-6d69-43ea-9dfb-a1b7415c0d0a
using Conda

# ╔═╡ 79f57766-ac9e-11ed-2c87-1b5db85db252
md"""# Julia is fast

Very often, benchmarks are used to compare languages.  These benchmarks can lead to long discussions, first as to exactly what is being benchmarked and secondly what explains the differences.  These simple questions can sometimes get more complicated than you at first might imagine.

The purpose of this notebook is for you to see a simple benchmark for yourself.  One can read the notebook and see what happened on the author's Macbook Pro with a 4-core Intel Core I7, or run the notebook yourself.

(This material began life as a wonderful lecture by Steven Johnson at MIT: https://github.com/stevengj/18S096/blob/master/lectures/lecture1/Boxes-and-registers.ipynb.)
"""

# ╔═╡ 79f57798-ac9e-11ed-1f60-271c801f83f2
md"""# Outline of this notebook

- Define the sum function
- Implementations & benchmarking of sum in...
    - C (hand-written)
    - C (hand-written with -ffast-math)
    - python (built-in)
    - python (numpy)
    - python (hand-written)
    - Julia (built-in)
    - Julia (hand-written)
    - Julia (hand-written with SIMD)
- Summary of benchmarks
"""

# ╔═╡ 79f577a2-ac9e-11ed-202a-e7a07e530bee
md"""# `sum`: An easy enough function to understand
"""

# ╔═╡ 79f577ac-ac9e-11ed-390c-0d5baba2ac7f
md"""Consider the  *sum* function `sum(a)`, which computes
```math
\mathrm{sum}(a) = \sum_{i=1}^n a_i,
```
where $n$ is the length of `a`.
"""

# ╔═╡ 79f577ca-ac9e-11ed-0db0-0dd95fa58805
a = rand(10^7) # 1D vector of random numbers, uniform on [0,1)

# ╔═╡ 79f577d4-ac9e-11ed-2761-25e4ed60a3c6
sum(a)

# ╔═╡ 79f577de-ac9e-11ed-2c0f-b1b031b438f3
md"""The expected result is 0.5 * 10^7, since the mean of each entry is 0.5
"""

# ╔═╡ 79f577e8-ac9e-11ed-1e3c-ed3a1a341feb
md"""# Benchmarking a few ways in a few languages
"""

# ╔═╡ 79f577f0-ac9e-11ed-1d27-e71867bb9664
@time sum(a)

# ╔═╡ 79f577fc-ac9e-11ed-2708-359da61c4c52
@time sum(a)

# ╔═╡ 79f57806-ac9e-11ed-2142-61a66aa1327e
@time sum(a)

# ╔═╡ 79f57810-ac9e-11ed-184e-61e4bfb71943
md"""The `@time` macro can yield noisy results, so it's not our best choice for benchmarking!

Luckily, Julia has a `BenchmarkTools.jl` package to make benchmarking easy and accurate:
"""

# ╔═╡ 79f57838-ac9e-11ed-3d77-05e066a413b4
md"""#  1. The C language

C is often considered the gold standard: difficult on the human, nice for the machine. Getting within a factor of 2 of C is often satisfying. Nonetheless, even within C, there are many kinds of optimizations possible that a naive C writer may or may not get the advantage of.

The current author does not speak C, so he does not read the cell below, but is happy to know that you can put C code in a Julia session, compile it, and run it.
"""

# ╔═╡ 7ca6c8c2-d70e-4afc-965e-3d7658298117
C_code = """
#include <stddef.h>
double c_sum(size_t n, double *X) {
    double s = 0.0;
    for (size_t i = 0; i < n; ++i) {
        s += X[i];
    }
    return s;
}
"""

# ╔═╡ 9134cfd7-4840-4cd2-8c29-ac7a61501859
const Clib = tempname()   # make a temporary file

# ╔═╡ 9b4d8ff0-fb1c-42c0-81b5-2ee5c4e94499
# compile to a shared library by piping C_code to gcc
# (works only if you have gcc installed):

open(`gcc -fPIC -O3 -msse3 -xc -shared -o $(Clib * "." * Libdl.dlext) -`, "w") do f
    print(f, C_code) 
end

# ╔═╡ 4fb36624-1175-4bd9-b5f6-92f66d5a4695
# define a Julia function that calls the C function:
c_sum(X::Array{Float64}) = ccall(("c_sum", Clib), Float64, (Csize_t, Ptr{Float64}), length(X), X)

# ╔═╡ 79f57856-ac9e-11ed-0006-917010dd0e71
c_sum(a)

# ╔═╡ 79f57860-ac9e-11ed-1a8b-7d621da1acc2
c_sum(a) ≈ sum(a) # type \approx and then <TAB> to get the ≈ symbolb

# ╔═╡ 79f5786a-ac9e-11ed-1dda-63165d604305
c_sum(a) - sum(a)  

# ╔═╡ 79f57874-ac9e-11ed-0f47-39b6c6870034
≈  # alias for the `isapprox` function

# ╔═╡ 79f57888-ac9e-11ed-34f3-2df7bb175d8b
md"""We can now benchmark the C code directly from Julia:
"""

# ╔═╡ 79f57888-ac9e-11ed-1128-997a572b3eab
c_bench = @benchmark c_sum($a)

# ╔═╡ 79f57894-ac9e-11ed-2a16-d3662c133a82
println("C: Fastest time was $(minimum(c_bench.times) / 1e6) msec")

# ╔═╡ f5222777-1d9b-46fd-bddb-91c1df128ef9
d = Dict()  # a "dictionary", i.e. an associative array

# ╔═╡ 5b7d7af9-8fc5-4b7b-8475-5a84f0060cfd
d["C"] = minimum(c_bench.times) / 1e6  # in milliseconds

# ╔═╡ 67b4428e-f1dc-43c0-8310-236100177fba
d

# ╔═╡ 8fae05c0-34db-4228-8776-7922e28257e3
gr()

# ╔═╡ 34ceee55-9f01-4e4d-a7ac-e03cb7cff8b7
t = c_bench.times / 1e6 # times in milliseconds

# ╔═╡ b56624b7-e3cc-41b4-98be-ebdd82020ac3
m, σ = minimum(t), std(t)

# ╔═╡ e03bdff1-db8f-4a17-9b0a-9e5f32c54f3b
histogram(t, bins=500,
    xlim=(m - 0.01, m + σ),
    xlabel="milliseconds", ylabel="count", label="")

# ╔═╡ 79f578ba-ac9e-11ed-1d5c-7dfb270b807c
md"""# 2. C with -ffast-math

If we allow C to re-arrange the floating point operations, then it'll vectorize with SIMD (single instruction, multiple data) instructions.
"""

# ╔═╡ 71db1d60-f5bf-4ae9-a9d1-a511abc41e3d
const Clib_fastmath = tempname()   # make a temporary file

# ╔═╡ 22831692-2c13-4ac9-8614-7fd7cfbb20e6
# The same as above but with a -ffast-math flag added
open(`gcc -fPIC -O3 -msse3 -xc -shared -ffast-math -o $(Clib_fastmath * "." * Libdl.dlext) -`, "w") do f
    print(f, C_code) 
end

# ╔═╡ a5ca8dbe-9bda-4c40-9fa3-ef44891f7ec6
# define a Julia function that calls the C function:
c_sum_fastmath(X::Array{Float64}) = ccall(("c_sum", Clib_fastmath), Float64, (Csize_t, Ptr{Float64}), length(X), X)

# ╔═╡ 79f578d8-ac9e-11ed-3ef9-11755cd3e207
c_fastmath_bench = @benchmark $c_sum_fastmath($a)

# ╔═╡ 79f578e2-ac9e-11ed-0870-11472ae171a2
d["C -ffast-math"] = minimum(c_fastmath_bench.times) / 1e6  # in milliseconds

# ╔═╡ 79f578ec-ac9e-11ed-27af-911cbbc8c13c
md"""# 3. Python's built in `sum` 
"""

# ╔═╡ 79f578ec-ac9e-11ed-1058-2f0a3526cd74
md"""The `PyCall` package provides a Julia interface to Python:
"""

# ╔═╡ 56cc934e-de8c-47a7-874e-095160de8c81
Pkg.build("PyCall")

# ╔═╡ 79f57900-ac9e-11ed-00ae-75fff94ba3cb
# get the Python built-in "sum" function:
pysum = pybuiltin("sum")

# ╔═╡ 79f5790a-ac9e-11ed-09f9-ef9847688566
pysum(a)

# ╔═╡ 79f57914-ac9e-11ed-3c24-1f4b1392c4ac
pysum(a) ≈ sum(a)

# ╔═╡ 79f5791e-ac9e-11ed-0db8-e9c026e36cff
py_list_bench = @benchmark $pysum($a)

# ╔═╡ b653c4f9-b47c-45ae-864f-da8937b2f560
d["Python built-in"] = minimum(py_list_bench.times) / 1e6

# ╔═╡ af662317-677d-4d7e-b23b-157216d51289
d

# ╔═╡ 79f57932-ac9e-11ed-068b-1d7200d742d5
md"""# 4. Python: `numpy` 

## Takes advantage of hardware "SIMD", but only works when it works.

`numpy` is an optimized C library, callable from Python.
It may be installed within Julia as follows:
"""

# ╔═╡ 79f5793c-ac9e-11ed-1af6-1148c1f951da
Conda.add("numpy")

# ╔═╡ da8fd7cc-2d12-4388-bb0f-cfe18d0487f5
numpy_sum = pyimport("numpy")["sum"]

# ╔═╡ 3f526f3a-9e3b-4d55-b1f4-eec5060363e8
py_numpy_bench = @benchmark $numpy_sum($a)

# ╔═╡ 79f57950-ac9e-11ed-3869-d59d42d4c85d
numpy_sum(a)

# ╔═╡ 79f57958-ac9e-11ed-2f1d-c53358dddc77
numpy_sum(a) ≈ sum(a)

# ╔═╡ 10697ab7-955c-4a6a-9de3-89670118e94e
d["Python numpy"] = minimum(py_numpy_bench.times) / 1e6

# ╔═╡ 756c46d8-249b-46cc-b073-f22f9d89450e
d

# ╔═╡ 79f57964-ac9e-11ed-0ad9-1590b3ba55ba
md"""# 5. Python, hand-written 
"""

# ╔═╡ 389e5dd7-10cf-42cc-99fa-df1d2cb8c20b
py"""
def py_sum(A):
    s = 0.0
    for a in A:
        s += a
    return s
"""

# ╔═╡ b2cbabcd-1e41-4536-ba2b-3cb53c16123f
sum_py = py"py_sum"

# ╔═╡ 79f57978-ac9e-11ed-35e0-0b41dba4d403
py_hand = @benchmark $sum_py($a)

# ╔═╡ 79f57982-ac9e-11ed-2fe8-abeea57b9cf4
sum_py(a)

# ╔═╡ 79f5798c-ac9e-11ed-2b83-c9e50918b390
sum_py(a) ≈ sum(a)

# ╔═╡ 6642a2e1-2365-41c7-9054-79e5e2f2840e
d["Python hand-written"] = minimum(py_hand.times) / 1e6

# ╔═╡ f972a9cd-50cb-4d27-aeae-f442c7394cb7
d

# ╔═╡ 79f57996-ac9e-11ed-0016-4390779dab9c
md"""# 6. Julia (built-in) 

## Written directly in Julia, not in C!
"""

# ╔═╡ 79f579a0-ac9e-11ed-2ca2-a5892de9b4e6
@which sum(a)

# ╔═╡ 79f579aa-ac9e-11ed-0028-e1add23a32be
j_bench = @benchmark sum($a)

# ╔═╡ 02f0cd62-bcab-4f7c-a817-785f09be289f
d["Julia built-in"] = minimum(j_bench.times) / 1e6

# ╔═╡ 1e8b8138-29e2-4302-a2e9-1d3e1effa93b
d

# ╔═╡ 79f579b4-ac9e-11ed-2d6c-f98415dfb0e2
md"""# 7. Julia (hand-written) 
"""

# ╔═╡ 79f579be-ac9e-11ed-140f-f9d77b571a39
function mysum(A)   
    s = 0.0 # s = zero(eltype(a))
    for a in A
        s += a
    end
    s
end

# ╔═╡ 79f579ca-ac9e-11ed-156c-9fc8fdf4c5af
j_bench_hand = @benchmark mysum($a)

# ╔═╡ 55e1598e-851e-4964-93f4-dc925a45093f
d["Julia hand-written"] = minimum(j_bench_hand.times) / 1e6

# ╔═╡ 707136df-d438-423e-8e85-e716f3526288
d

# ╔═╡ 79f579dc-ac9e-11ed-26df-1162849b5d88
md"""# 8. Julia (hand-written w. simd) 
"""

# ╔═╡ 79f579e6-ac9e-11ed-0ef5-81cbe515268e
function mysum_simd(A)   
    s = 0.0 # s = zero(eltype(A))
    @simd for a in A
        s += a
    end
    s
end

# ╔═╡ 79f579f0-ac9e-11ed-1341-dd07ad4ea286
j_bench_hand_simd = @benchmark mysum_simd($a)

# ╔═╡ 79f579f0-ac9e-11ed-2c46-2b7a948d6792
mysum_simd(a)

# ╔═╡ 389d8d83-394c-486a-8ef8-779ff8b88083
d["Julia hand-written simd"] = minimum(j_bench_hand_simd.times) / 1e6

# ╔═╡ affa64d7-2fd2-42c6-8bfc-89289459e1fd
d

# ╔═╡ 79f57a04-ac9e-11ed-2f5c-2152519ab5da
md"""# Summary
"""

# ╔═╡ 79f57a0e-ac9e-11ed-2edd-2b61f3f33d46
for (key, value) in sort(collect(d), by=last)
    println(rpad(key, 25, "."), lpad(round(value; digits=1), 6, "."))
end

# ╔═╡ Cell order:
# ╟─79f57766-ac9e-11ed-2c87-1b5db85db252
# ╟─79f57798-ac9e-11ed-1f60-271c801f83f2
# ╟─79f577a2-ac9e-11ed-202a-e7a07e530bee
# ╟─79f577ac-ac9e-11ed-390c-0d5baba2ac7f
# ╠═79f577ca-ac9e-11ed-0db0-0dd95fa58805
# ╠═79f577d4-ac9e-11ed-2761-25e4ed60a3c6
# ╟─79f577de-ac9e-11ed-2c0f-b1b031b438f3
# ╟─79f577e8-ac9e-11ed-1e3c-ed3a1a341feb
# ╠═79f577f0-ac9e-11ed-1d27-e71867bb9664
# ╠═79f577fc-ac9e-11ed-2708-359da61c4c52
# ╠═79f57806-ac9e-11ed-2142-61a66aa1327e
# ╟─79f57810-ac9e-11ed-184e-61e4bfb71943
# ╠═e5bf1ad6-cdee-4f7a-8adf-97eb804c583a
# ╠═062e92f7-0878-4878-8a80-860ed9e1bd43
# ╠═79f5782e-ac9e-11ed-18b4-2d81e939096d
# ╟─79f57838-ac9e-11ed-3d77-05e066a413b4
# ╠═1244aa4e-720d-40f7-8b20-dbf082fc02cf
# ╠═7ca6c8c2-d70e-4afc-965e-3d7658298117
# ╠═9134cfd7-4840-4cd2-8c29-ac7a61501859
# ╠═9b4d8ff0-fb1c-42c0-81b5-2ee5c4e94499
# ╠═4fb36624-1175-4bd9-b5f6-92f66d5a4695
# ╠═79f57856-ac9e-11ed-0006-917010dd0e71
# ╠═79f57860-ac9e-11ed-1a8b-7d621da1acc2
# ╠═79f5786a-ac9e-11ed-1dda-63165d604305
# ╠═79f57874-ac9e-11ed-0f47-39b6c6870034
# ╠═79f57888-ac9e-11ed-34f3-2df7bb175d8b
# ╠═79f57888-ac9e-11ed-1128-997a572b3eab
# ╠═79f57894-ac9e-11ed-2a16-d3662c133a82
# ╠═f5222777-1d9b-46fd-bddb-91c1df128ef9
# ╠═5b7d7af9-8fc5-4b7b-8475-5a84f0060cfd
# ╠═67b4428e-f1dc-43c0-8310-236100177fba
# ╠═da356705-0d4a-4733-9240-d18e7836d68b
# ╠═8fae05c0-34db-4228-8776-7922e28257e3
# ╠═e4d85473-3420-4c2e-8820-b1c975be037b
# ╠═34ceee55-9f01-4e4d-a7ac-e03cb7cff8b7
# ╠═b56624b7-e3cc-41b4-98be-ebdd82020ac3
# ╠═e03bdff1-db8f-4a17-9b0a-9e5f32c54f3b
# ╟─79f578ba-ac9e-11ed-1d5c-7dfb270b807c
# ╠═71db1d60-f5bf-4ae9-a9d1-a511abc41e3d
# ╠═22831692-2c13-4ac9-8614-7fd7cfbb20e6
# ╠═a5ca8dbe-9bda-4c40-9fa3-ef44891f7ec6
# ╠═79f578d8-ac9e-11ed-3ef9-11755cd3e207
# ╠═79f578e2-ac9e-11ed-0870-11472ae171a2
# ╟─79f578ec-ac9e-11ed-27af-911cbbc8c13c
# ╟─79f578ec-ac9e-11ed-1058-2f0a3526cd74
# ╠═c7334536-a047-48e2-ac83-378ef371de5f
# ╠═56cc934e-de8c-47a7-874e-095160de8c81
# ╠═ca47fe8d-9a3a-463f-9f83-076dc956148b
# ╠═79f57900-ac9e-11ed-00ae-75fff94ba3cb
# ╠═79f5790a-ac9e-11ed-09f9-ef9847688566
# ╠═79f57914-ac9e-11ed-3c24-1f4b1392c4ac
# ╠═79f5791e-ac9e-11ed-0db8-e9c026e36cff
# ╠═b653c4f9-b47c-45ae-864f-da8937b2f560
# ╠═af662317-677d-4d7e-b23b-157216d51289
# ╟─79f57932-ac9e-11ed-068b-1d7200d742d5
# ╠═126f1293-c91f-43cb-b8df-d7118f6c1959
# ╠═40cd04dc-6d69-43ea-9dfb-a1b7415c0d0a
# ╠═79f5793c-ac9e-11ed-1af6-1148c1f951da
# ╠═da8fd7cc-2d12-4388-bb0f-cfe18d0487f5
# ╠═3f526f3a-9e3b-4d55-b1f4-eec5060363e8
# ╠═79f57950-ac9e-11ed-3869-d59d42d4c85d
# ╠═79f57958-ac9e-11ed-2f1d-c53358dddc77
# ╠═10697ab7-955c-4a6a-9de3-89670118e94e
# ╠═756c46d8-249b-46cc-b073-f22f9d89450e
# ╟─79f57964-ac9e-11ed-0ad9-1590b3ba55ba
# ╠═389e5dd7-10cf-42cc-99fa-df1d2cb8c20b
# ╠═b2cbabcd-1e41-4536-ba2b-3cb53c16123f
# ╠═79f57978-ac9e-11ed-35e0-0b41dba4d403
# ╠═79f57982-ac9e-11ed-2fe8-abeea57b9cf4
# ╠═79f5798c-ac9e-11ed-2b83-c9e50918b390
# ╠═6642a2e1-2365-41c7-9054-79e5e2f2840e
# ╠═f972a9cd-50cb-4d27-aeae-f442c7394cb7
# ╟─79f57996-ac9e-11ed-0016-4390779dab9c
# ╠═79f579a0-ac9e-11ed-2ca2-a5892de9b4e6
# ╠═79f579aa-ac9e-11ed-0028-e1add23a32be
# ╠═02f0cd62-bcab-4f7c-a817-785f09be289f
# ╠═1e8b8138-29e2-4302-a2e9-1d3e1effa93b
# ╟─79f579b4-ac9e-11ed-2d6c-f98415dfb0e2
# ╠═79f579be-ac9e-11ed-140f-f9d77b571a39
# ╠═79f579ca-ac9e-11ed-156c-9fc8fdf4c5af
# ╠═55e1598e-851e-4964-93f4-dc925a45093f
# ╠═707136df-d438-423e-8e85-e716f3526288
# ╟─79f579dc-ac9e-11ed-26df-1162849b5d88
# ╠═79f579e6-ac9e-11ed-0ef5-81cbe515268e
# ╠═79f579f0-ac9e-11ed-1341-dd07ad4ea286
# ╠═79f579f0-ac9e-11ed-2c46-2b7a948d6792
# ╠═389d8d83-394c-486a-8ef8-779ff8b88083
# ╠═affa64d7-2fd2-42c6-8bfc-89289459e1fd
# ╟─79f57a04-ac9e-11ed-2f5c-2152519ab5da
# ╠═79f57a0e-ac9e-11ed-2edd-2b61f3f33d46
