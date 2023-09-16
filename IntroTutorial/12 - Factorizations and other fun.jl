### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ b2a90a9c-c053-49f5-9c53-184ec94d2d02
using LinearAlgebra

# ╔═╡ 79e5adac-ac9e-11ed-3dde-4527317b3f18
md"""# Factorizations and other fun
Based on work by Andreas Noack

## Outline
 - Factorizations
 - Special matrix structures
 - Generic linear algebra
"""

# ╔═╡ 79e5add6-ac9e-11ed-22d3-3f03997f77b4
md"""Before we get started, let's set up a linear system and use `LinearAlgebra` to bring in the factorizations and special matrix structures.
"""

# ╔═╡ 6aaf45e9-4cb3-4fa2-8f58-e53477c5ca34
#=╠═╡
x = fill(1, (3,))
  ╠═╡ =#

# ╔═╡ 79e5ae08-ac9e-11ed-3aec-6de20645af5a
md"""## Factorizations

#### LU factorizations
In Julia we can perform an LU factorization
```julia
PA = LU
``` 
where `P` is a permutation matrix, `L` is lower triangular unit diagonal and `U` is upper triangular, using `lufact`.

Julia allows computing the LU factorization and defines a composite factorization type for storing it.
"""

# ╔═╡ 79e5ae26-ac9e-11ed-2525-e9c62ee8a312
md"""The different parts of the factorization can be extracted by accessing their special properties
"""

# ╔═╡ 79e5ae58-ac9e-11ed-14d2-c17022f16c91
md"""Julia can dispatch methods on factorization objects.

For example, we can solve the linear system using either the original matrix or the factorization object.
"""

# ╔═╡ 79e5ae8a-ac9e-11ed-230f-f722f6f9af14
md"""Similarly, we can calculate the determinant of `A` using either `A` or the factorization object
"""

# ╔═╡ 79e5ae9e-ac9e-11ed-1b36-d594eeb0547e
md"""#### QR factorizations

In Julia we can perform a QR factorization
```
A=QR
``` 

where `Q` is unitary/orthogonal and `R` is upper triangular, using `qrfact`. 
"""

# ╔═╡ 79e5aebc-ac9e-11ed-0f12-fb277eab3bb2
md"""Similarly to the LU factorization, the matrices `Q` and `R` can be extracted from the QR factorization object via
"""

# ╔═╡ 79e5aeda-ac9e-11ed-2611-574da8997840
md"""#### Eigendecompositions
"""

# ╔═╡ 79e5aeee-ac9e-11ed-1f64-059a7ebdbee1
md"""The results from eigendecompositions, singular value decompositions, Hessenberg factorizations, and Schur decompositions are all stored in `Factorization` types.

The eigendecomposition can be computed
"""

# ╔═╡ 79e5af02-ac9e-11ed-276a-75715c708a60
md"""The values and the vectors can be extracted from the Eigen type by special indexing
"""

# ╔═╡ 79e5af34-ac9e-11ed-2e81-d59dba5d76a1
md"""Once again, when the factorization is stored in a type, we can dispatch on it and write specialized methods that exploit the properties of the factorization, e.g. that $A^{-1}=(V\Lambda V^{-1})^{-1}=V\Lambda^{-1}V^{-1}$.
"""

# ╔═╡ 79e5af3e-ac9e-11ed-35ec-49949d7873a8
md"""## Special matrix structures
Matrix structure is very important in linear algebra. To see *how* important it is, let's work with a larger linear system
"""

# ╔═╡ 0eb3c617-d6ef-40d9-9fe1-7de8f5865f20
#=╠═╡
B = randn(1000,1000);
  ╠═╡ =#

# ╔═╡ 79e5af5c-ac9e-11ed-3904-d10fc0b7e974
md"""Julia can often infer special matrix structure
"""

# ╔═╡ 348f6849-2c20-4bb5-9c76-996d11a274f2
#=╠═╡
Bsym = B + B'
  ╠═╡ =#

# ╔═╡ 47b3dd60-cde4-4e99-9a45-98585e694f6e
issymmetric(Bsym)

# ╔═╡ 79e5af7a-ac9e-11ed-0cd4-0339eb4e1ef0
md"""but sometimes floating point error might get in the way.
"""

# ╔═╡ 79e5af98-ac9e-11ed-18f2-31ac934e51e2
md"""Luckily we can declare structure explicitly with, for example, `Diagonal`, `Triangular`, `Symmetric`, `Hermitian`, `Tridiagonal` and `SymTridiagonal`.
"""

# ╔═╡ 79e5afb6-ac9e-11ed-1fd9-a909103751e2
md"""Let's compare how long it takes Julia to compute the eigenvalues of `Asym`, `Asym_noisy`, and `Asym_explicit`
"""

# ╔═╡ 79e5afea-ac9e-11ed-3271-136bfb5a3a94
md"""In this example, using `Symmetric()` on `Asym_noisy` made our calculations about `5x` more efficient :)
"""

# ╔═╡ 79e5b006-ac9e-11ed-1b89-290a0478986d
md"""#### A big problem
Using the `Tridiagonal` and `SymTridiagonal` types to store tridiagonal matrices makes it possible to work with potentially very large tridiagonal problems. The following problem would not be possible to solve on a laptop if the matrix had to be stored as a (dense) `Matrix` type.
"""

# ╔═╡ 79e5ae10-ac9e-11ed-2eb2-bdcb1208fb34
Alu = lu(A)

# ╔═╡ 79e5ae1c-ac9e-11ed-079e-f39418c50a48
typeof(Alu)

# ╔═╡ 79e5ae30-ac9e-11ed-3dba-eb8a8adf3cb3
Alu.P

# ╔═╡ 79e5ae44-ac9e-11ed-02f6-15532239df6e
Alu.L

# ╔═╡ 79e5ae4e-ac9e-11ed-19db-11023b343b4f
Alu.U

# ╔═╡ 79e5ae94-ac9e-11ed-228d-534a1660f9e1
det(A) ≈ det(Alu)

# ╔═╡ 79e5aea8-ac9e-11ed-1568-7711bfdb7641
Aqr = qr(A)

# ╔═╡ 79e5aebc-ac9e-11ed-2aa6-59f285a00863
Aqr.Q

# ╔═╡ 79e5aed0-ac9e-11ed-1ae3-a575a7520e56
Aqr.R

# ╔═╡ b6affbb6-c531-4583-aac0-9460f00eafd6
Asym = A + A'

# ╔═╡ b9419140-9633-4808-8fdc-2b24e1d3ddf2
AsymEig = eigen(Asym)

# ╔═╡ 79e5af14-ac9e-11ed-1723-9dfff14c4996
AsymEig.values

# ╔═╡ 79e5af20-ac9e-11ed-0b9f-c320cc8b41b8
AsymEig.vectors

# ╔═╡ 79e5af34-ac9e-11ed-1b34-1f5f8fe143e1
inv(AsymEig)*Asym

# ╔═╡ abd8bf50-a0f3-453c-b8a5-359ec49ff857
Asym_noisy = copy(Asym)

# ╔═╡ 48e23902-c530-4951-9bfb-deb3d3d942a7
Asym_noisy[1,2] += 5eps()

# ╔═╡ 79e5af8e-ac9e-11ed-1a7a-cd9ff56fd5bd
issymmetric(Asym_noisy)

# ╔═╡ 79e5afac-ac9e-11ed-3156-ef96d3d65291
Asym_explicit = Symmetric(Asym_noisy);

# ╔═╡ 79e5afde-ac9e-11ed-2194-89ea1564165c
@time eigvals(Asym_explicit);

# ╔═╡ 79e5afd4-ac9e-11ed-2f11-c984b9ce6e66
@time eigvals(Asym_noisy);

# ╔═╡ 79e5afc0-ac9e-11ed-09c3-c75062ee4c1f
@time eigvals(Asym);

# ╔═╡ c46cb2ec-6b1a-46bb-a022-d8fd0b610145
@time eigmax(A)

# ╔═╡ 79e5b024-ac9e-11ed-2341-9d2fe5710237
md"""## Generic linear algebra
The usual way of adding support for numerical linear algebra is by wrapping BLAS and LAPACK subroutines. For matrices with elements of `Float32`, `Float64`, `Complex{Float32}` or `Complex{Float64}` this is also what Julia does.

However, Julia also supports generic linear algebra, allowing you to, for example, work with matrices and vectors of rational numbers.
"""

# ╔═╡ 79e5b02e-ac9e-11ed-0aae-4370b7e0c91f
md"""#### Rational numbers
Julia has rational numbers built in. To construct a rational number, use double forward slashes:
"""

# ╔═╡ 79e5b038-ac9e-11ed-10bc-cdbc2160fae9
1//2

# ╔═╡ 79e5b04a-ac9e-11ed-0610-cb0cd1a0a137
md"""#### Example: Rational linear system of equations
The following example shows how linear system of equations with rational elements can be solved without promoting to floating point element types. Overflow can easily become a problem when working with rational numbers so we use `BigInt`s.
"""

# ╔═╡ 79e5b056-ac9e-11ed-358d-770d174257c6
Arational = Matrix{Rational{BigInt}}(rand(1:10, 3, 3))/10

# ╔═╡ e76ad8cd-c85e-4f9f-b624-15390b919afe
v = fill(1, 3)

# ╔═╡ 79e5ae6c-ac9e-11ed-1749-bb470754f65d
#=╠═╡
A\b
  ╠═╡ =#

# ╔═╡ 79e5ae76-ac9e-11ed-13f9-9d8c44d2068a
#=╠═╡
Alu\b
  ╠═╡ =#

# ╔═╡ 79e5b074-ac9e-11ed-0d40-3faff7904341
#=╠═╡
Arational\b
  ╠═╡ =#

# ╔═╡ 79e5b074-ac9e-11ed-1ddd-cb256118cfe2
lu(Arational)

# ╔═╡ 79e5b092-ac9e-11ed-0497-a90b243897e6
md"""### Exercises

#### 11.1
What are the eigenvalues of matrix A?

```
A =
[
 140   97   74  168  131
  97  106   89  131   36
  74   89  152  144   71
 168  131  144   54  142
 131   36   71  142   36
]
```
and assign it a variable `A_eigv`
"""

# ╔═╡ 79e5b09c-ac9e-11ed-10fa-cf813733f442
# ╠═╡ disabled = true
#=╠═╡
using LinearAlgebra
  ╠═╡ =#

# ╔═╡ 79e5b0a6-ac9e-11ed-2778-b7adb396420e


# ╔═╡ 79e5b0ae-ac9e-11ed-03d5-1d47c8df0cb4
@assert A_eigv ==  [-128.49322764802145, -55.887784553056875, 42.7521672793189, 87.16111477514521, 542.4677301466143]

# ╔═╡ 79e5b0ba-ac9e-11ed-1572-15cc83becb24
md"""#### 11.2 
Create a `Diagonal` matrix from the eigenvalues of `A`.
"""

# ╔═╡ 79e5b0ce-ac9e-11ed-1da6-075e6bd0004f


# ╔═╡ 79e5b0d8-ac9e-11ed-0167-c7d08b6d2882
@assert A_diag ==  [-128.493    0.0      0.0      0.0       0.0;
    0.0    -55.8878   0.0      0.0       0.0;
    0.0      0.0     42.7522   0.0       0.0;
    0.0      0.0      0.0     87.1611    0.0;
    0.0 0.0      0.0      0.0     542.468]

# ╔═╡ 79e5b0e2-ac9e-11ed-1ccd-e734ac23d258
md"""#### 11.3 
Create a `LowerTriangular` matrix from `A` and store it in `A_lowertri`
"""

# ╔═╡ 79e5b0ec-ac9e-11ed-3176-99c6ac32702d


# ╔═╡ 79e5b0f6-ac9e-11ed-0bb3-799e7f75b8eb
@assert A_lowertri ==  [140    0    0    0   0;
  97  106    0    0   0;
  74   89  152    0   0;
 168  131  144   54   0;
 131   36   71  142  36]

# ╔═╡ 6ea8df51-0e8b-48e3-a60c-8856f8d94d4a
# ╠═╡ disabled = true
#=╠═╡
n = 1_000_000;
  ╠═╡ =#

# ╔═╡ f199ebee-c58e-4a9e-9c13-b19e9fa6d48e
#=╠═╡
b = Arational*v
  ╠═╡ =#

# ╔═╡ a3af8cbe-883a-4413-99e8-67e60c80f0fb
# ╠═╡ disabled = true
#=╠═╡
A = SymTridiagonal(randn(n), randn(n-1));
  ╠═╡ =#

# ╔═╡ 3df2e1b0-35a5-4d48-8a5f-6daaca2797f5
# ╠═╡ disabled = true
#=╠═╡
b = A * x
  ╠═╡ =#

# ╔═╡ b9f856c5-d510-47d5-91bc-1d77b6c02313
#=╠═╡
n = 1000
  ╠═╡ =#

# ╔═╡ 49ada5f1-b413-4c89-be3e-efdb3232229e
#=╠═╡
A = rand(3, 3)
  ╠═╡ =#

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.3"
manifest_format = "2.0"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
"""

# ╔═╡ Cell order:
# ╟─79e5adac-ac9e-11ed-3dde-4527317b3f18
# ╟─79e5add6-ac9e-11ed-22d3-3f03997f77b4
# ╠═b2a90a9c-c053-49f5-9c53-184ec94d2d02
# ╠═49ada5f1-b413-4c89-be3e-efdb3232229e
# ╠═6aaf45e9-4cb3-4fa2-8f58-e53477c5ca34
# ╠═3df2e1b0-35a5-4d48-8a5f-6daaca2797f5
# ╟─79e5ae08-ac9e-11ed-3aec-6de20645af5a
# ╠═79e5ae10-ac9e-11ed-2eb2-bdcb1208fb34
# ╠═79e5ae1c-ac9e-11ed-079e-f39418c50a48
# ╟─79e5ae26-ac9e-11ed-2525-e9c62ee8a312
# ╠═79e5ae30-ac9e-11ed-3dba-eb8a8adf3cb3
# ╠═79e5ae44-ac9e-11ed-02f6-15532239df6e
# ╠═79e5ae4e-ac9e-11ed-19db-11023b343b4f
# ╟─79e5ae58-ac9e-11ed-14d2-c17022f16c91
# ╠═79e5ae6c-ac9e-11ed-1749-bb470754f65d
# ╠═79e5ae76-ac9e-11ed-13f9-9d8c44d2068a
# ╟─79e5ae8a-ac9e-11ed-230f-f722f6f9af14
# ╠═79e5ae94-ac9e-11ed-228d-534a1660f9e1
# ╟─79e5ae9e-ac9e-11ed-1b36-d594eeb0547e
# ╠═79e5aea8-ac9e-11ed-1568-7711bfdb7641
# ╟─79e5aebc-ac9e-11ed-0f12-fb277eab3bb2
# ╠═79e5aebc-ac9e-11ed-2aa6-59f285a00863
# ╠═79e5aed0-ac9e-11ed-1ae3-a575a7520e56
# ╟─79e5aeda-ac9e-11ed-2611-574da8997840
# ╟─79e5aeee-ac9e-11ed-1f64-059a7ebdbee1
# ╠═b6affbb6-c531-4583-aac0-9460f00eafd6
# ╠═b9419140-9633-4808-8fdc-2b24e1d3ddf2
# ╟─79e5af02-ac9e-11ed-276a-75715c708a60
# ╠═79e5af14-ac9e-11ed-1723-9dfff14c4996
# ╠═79e5af20-ac9e-11ed-0b9f-c320cc8b41b8
# ╟─79e5af34-ac9e-11ed-2e81-d59dba5d76a1
# ╠═79e5af34-ac9e-11ed-1b34-1f5f8fe143e1
# ╟─79e5af3e-ac9e-11ed-35ec-49949d7873a8
# ╠═b9f856c5-d510-47d5-91bc-1d77b6c02313
# ╠═0eb3c617-d6ef-40d9-9fe1-7de8f5865f20
# ╟─79e5af5c-ac9e-11ed-3904-d10fc0b7e974
# ╠═348f6849-2c20-4bb5-9c76-996d11a274f2
# ╠═47b3dd60-cde4-4e99-9a45-98585e694f6e
# ╟─79e5af7a-ac9e-11ed-0cd4-0339eb4e1ef0
# ╠═abd8bf50-a0f3-453c-b8a5-359ec49ff857
# ╠═48e23902-c530-4951-9bfb-deb3d3d942a7
# ╠═79e5af8e-ac9e-11ed-1a7a-cd9ff56fd5bd
# ╟─79e5af98-ac9e-11ed-18f2-31ac934e51e2
# ╠═79e5afac-ac9e-11ed-3156-ef96d3d65291
# ╟─79e5afb6-ac9e-11ed-1fd9-a909103751e2
# ╠═79e5afc0-ac9e-11ed-09c3-c75062ee4c1f
# ╠═79e5afd4-ac9e-11ed-2f11-c984b9ce6e66
# ╠═79e5afde-ac9e-11ed-2194-89ea1564165c
# ╟─79e5afea-ac9e-11ed-3271-136bfb5a3a94
# ╟─79e5b006-ac9e-11ed-1b89-290a0478986d
# ╠═6ea8df51-0e8b-48e3-a60c-8856f8d94d4a
# ╠═a3af8cbe-883a-4413-99e8-67e60c80f0fb
# ╠═c46cb2ec-6b1a-46bb-a022-d8fd0b610145
# ╟─79e5b024-ac9e-11ed-2341-9d2fe5710237
# ╟─79e5b02e-ac9e-11ed-0aae-4370b7e0c91f
# ╠═79e5b038-ac9e-11ed-10bc-cdbc2160fae9
# ╟─79e5b04a-ac9e-11ed-0610-cb0cd1a0a137
# ╠═79e5b056-ac9e-11ed-358d-770d174257c6
# ╠═e76ad8cd-c85e-4f9f-b624-15390b919afe
# ╠═f199ebee-c58e-4a9e-9c13-b19e9fa6d48e
# ╠═79e5b074-ac9e-11ed-0d40-3faff7904341
# ╠═79e5b074-ac9e-11ed-1ddd-cb256118cfe2
# ╟─79e5b092-ac9e-11ed-0497-a90b243897e6
# ╠═79e5b09c-ac9e-11ed-10fa-cf813733f442
# ╠═79e5b0a6-ac9e-11ed-2778-b7adb396420e
# ╠═79e5b0ae-ac9e-11ed-03d5-1d47c8df0cb4
# ╟─79e5b0ba-ac9e-11ed-1572-15cc83becb24
# ╠═79e5b0ce-ac9e-11ed-1da6-075e6bd0004f
# ╠═79e5b0d8-ac9e-11ed-0167-c7d08b6d2882
# ╟─79e5b0e2-ac9e-11ed-1ccd-e734ac23d258
# ╠═79e5b0ec-ac9e-11ed-3176-99c6ac32702d
# ╠═79e5b0f6-ac9e-11ed-0bb3-799e7f75b8eb
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
