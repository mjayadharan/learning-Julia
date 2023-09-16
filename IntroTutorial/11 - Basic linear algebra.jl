### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ 79e436fe-ac9e-11ed-2fde-19d43fd14f06
md"""# Basic linear algebra in Julia
Author: Andreas Noack Jensen (MIT & JuliaComputing) (https://twitter.com/anoackjensen?lang=en)
(with edits from Jane Herriman)
"""

# ╔═╡ 79e43724-ac9e-11ed-17aa-db4300f49827
md"""First let's define a random matrix
"""

# ╔═╡ 79e4373a-ac9e-11ed-35f1-6d7813161838
A = rand(1:4,3,3)

# ╔═╡ 79e43744-ac9e-11ed-18ee-4d690ad64122
md"""Define a vector of ones
"""

# ╔═╡ 79e43756-ac9e-11ed-0123-2bb3727f71cd
x = fill(1.0, (3,)) # = fill(1.0, 3)

# ╔═╡ 79e43762-ac9e-11ed-1b1b-372b2dee492b
md"""Notice that $A$ has type Array{Int64,2} but $x$ has type Array{Float64,1}. Julia defines the aliases Vector{Type}=Array{Type,1} and Matrix{Type}=Array{Type,2}. 

Many of the basic operations are the same as in other languages
#### Multiplication
"""

# ╔═╡ 79e4376c-ac9e-11ed-0e58-2b6f5236455d
b = A*x

# ╔═╡ 79e43780-ac9e-11ed-2cee-298b56f6c39c
md"""#### Transposition
As in other languages `A'` is the conjugate transpose, or adjoint
"""

# ╔═╡ 79e43788-ac9e-11ed-2bda-975bd18173fe
A'

# ╔═╡ 79e43788-ac9e-11ed-1c0e-09fb1e392c54
md"""and we can get the transpose with
"""

# ╔═╡ 79e4379e-ac9e-11ed-1046-f5b5d51311b0
transpose(A)

# ╔═╡ 79e437a8-ac9e-11ed-0a67-51da1545a0ef
md"""#### Transposed multiplication
Julia allows us to write this without *
"""

# ╔═╡ 79e437bc-ac9e-11ed-16b1-9f74e21831ba
A'A

# ╔═╡ 79e437c6-ac9e-11ed-234e-47a24fa8c5f8
md"""#### Solving linear systems 
The problem $Ax=b$ for ***square*** $A$ is solved by the \ function.
"""

# ╔═╡ 79e437c6-ac9e-11ed-3b89-b38c769ff04b
A\b

# ╔═╡ 79e437e4-ac9e-11ed-2650-57a078f56b36
md"""`A\b` gives us the *least squares solution* if we have an overdetermined linear system (a "tall" matrix)
"""

# ╔═╡ 79e437e4-ac9e-11ed-06c6-3f7e61605e23
Atall = rand(3, 2)

# ╔═╡ 79e437fa-ac9e-11ed-3a98-9d0d7a25f548
Atall\b

# ╔═╡ 79e43802-ac9e-11ed-372b-85dbbe66c1c2
md"""and the *minimum norm least squares solution* if we have a rank-deficient least squares problem
"""

# ╔═╡ 3d933395-4ecf-4cb8-b1d0-abbed35977f7
v = rand(3)

# ╔═╡ 22751975-e3bc-4e6c-b996-267da0c385fa
rankdef = hcat(v, v)

# ╔═╡ 79e43816-ac9e-11ed-0747-69a823448e9f
rankdef\b

# ╔═╡ 79e43820-ac9e-11ed-32ac-37d0fbf4bd6d
md"""Julia also gives us the minimum norm solution when we have an underdetermined solution (a "short" matrix)
"""

# ╔═╡ 68d9cc73-52de-456c-b3f0-717dc53ee6e4
bshort = rand(2)

# ╔═╡ ea0a5806-1928-4f21-9a0d-570e1814a732
Ashort = rand(2, 3)

# ╔═╡ 79e4383e-ac9e-11ed-34c9-210203faef03
Ashort\bshort

# ╔═╡ 79e43848-ac9e-11ed-1aa5-496ea7eb7009
md"""# The LinearAlgebra library

While much of linear algebra is available in Julia by default (as shown above), there's a standard library named `LinearAlgebra` that brings in many more relevant names and functions. In particular, it provides factorizations and some structured matrix types.  As with all packages, you can bring these additional features into your session with a `using LinearAlgebra`.
"""

# ╔═╡ 79e4385e-ac9e-11ed-33f4-018bfb4f0a33
md"""### Exercises

#### 10.1 
Take the inner product (or "dot" product) of a vector `v` with itself and assign it to variable `dot_v`.


"""

# ╔═╡ 79e43866-ac9e-11ed-1c87-c58787128850
a = [1,2,3]

# ╔═╡ 79e43870-ac9e-11ed-13b5-4dbc108700f6


# ╔═╡ 79e43884-ac9e-11ed-1cd6-dfff7241c763
@assert dot_a == 14

# ╔═╡ 79e4388c-ac9e-11ed-247b-e708136bd3c7
md"""#### 10.2 
Take the outer product of a vector v with itself and assign it to variable `outer_v`
"""

# ╔═╡ 79e438a2-ac9e-11ed-2466-d7de0030d496


# ╔═╡ 79e438ac-ac9e-11ed-0005-5bcb9885bc95
@assert outer_a == [1 2 3
                    2 4 6
                    3 6 9]

# ╔═╡ 79e438b6-ac9e-11ed-2603-e389ab552819
md"""#### 10.3 
Use [LinearAlgebra.cross](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/#LinearAlgebra.cross) to compute the cross product of a vector v with itself and assign it to variable `cross_v`
"""

# ╔═╡ 79e438be-ac9e-11ed-1acc-6520ce30aeb3


# ╔═╡ 79e438ca-ac9e-11ed-1f01-2103c6eefc54
@assert cross_a == [0, 0, 0]

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.3"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╟─79e436fe-ac9e-11ed-2fde-19d43fd14f06
# ╟─79e43724-ac9e-11ed-17aa-db4300f49827
# ╠═79e4373a-ac9e-11ed-35f1-6d7813161838
# ╟─79e43744-ac9e-11ed-18ee-4d690ad64122
# ╠═79e43756-ac9e-11ed-0123-2bb3727f71cd
# ╟─79e43762-ac9e-11ed-1b1b-372b2dee492b
# ╠═79e4376c-ac9e-11ed-0e58-2b6f5236455d
# ╟─79e43780-ac9e-11ed-2cee-298b56f6c39c
# ╠═79e43788-ac9e-11ed-2bda-975bd18173fe
# ╟─79e43788-ac9e-11ed-1c0e-09fb1e392c54
# ╠═79e4379e-ac9e-11ed-1046-f5b5d51311b0
# ╟─79e437a8-ac9e-11ed-0a67-51da1545a0ef
# ╠═79e437bc-ac9e-11ed-16b1-9f74e21831ba
# ╟─79e437c6-ac9e-11ed-234e-47a24fa8c5f8
# ╠═79e437c6-ac9e-11ed-3b89-b38c769ff04b
# ╟─79e437e4-ac9e-11ed-2650-57a078f56b36
# ╠═79e437e4-ac9e-11ed-06c6-3f7e61605e23
# ╠═79e437fa-ac9e-11ed-3a98-9d0d7a25f548
# ╟─79e43802-ac9e-11ed-372b-85dbbe66c1c2
# ╠═3d933395-4ecf-4cb8-b1d0-abbed35977f7
# ╠═22751975-e3bc-4e6c-b996-267da0c385fa
# ╠═79e43816-ac9e-11ed-0747-69a823448e9f
# ╟─79e43820-ac9e-11ed-32ac-37d0fbf4bd6d
# ╠═68d9cc73-52de-456c-b3f0-717dc53ee6e4
# ╠═ea0a5806-1928-4f21-9a0d-570e1814a732
# ╠═79e4383e-ac9e-11ed-34c9-210203faef03
# ╟─79e43848-ac9e-11ed-1aa5-496ea7eb7009
# ╟─79e4385e-ac9e-11ed-33f4-018bfb4f0a33
# ╠═79e43866-ac9e-11ed-1c87-c58787128850
# ╠═79e43870-ac9e-11ed-13b5-4dbc108700f6
# ╠═79e43884-ac9e-11ed-1cd6-dfff7241c763
# ╟─79e4388c-ac9e-11ed-247b-e708136bd3c7
# ╠═79e438a2-ac9e-11ed-2466-d7de0030d496
# ╠═79e438ac-ac9e-11ed-0005-5bcb9885bc95
# ╟─79e438b6-ac9e-11ed-2603-e389ab552819
# ╠═79e438be-ac9e-11ed-1acc-6520ce30aeb3
# ╠═79e438ca-ac9e-11ed-1f01-2103c6eefc54
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
