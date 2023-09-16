### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ 5e657587-8e3b-4368-adfd-33ad2ba1b661
md"""
# Strings

Topics:
1. How to get a string
2. String interpolation
3. String concatenation
"""

# ╔═╡ 88d9e0c4-26c1-4624-99ce-07bbf4f6eefd
md"""
## How to get a string

Enclose your characters in " " or \""" \"""!
"""

# ╔═╡ 0dd7c2b0-e115-4884-a494-6b0abc65637b
s1 = "I am a string."

# ╔═╡ 9e62f6f5-180f-4d0e-8298-473c79e51a4e
s2 = """
I am also a string. 
"""

# ╔═╡ 8b23e302-53c5-4b1c-88cd-717d31e81411
md"""
There are a couple functional differences between strings enclosed in single and triple quotes. <br>
One difference is that, in the latter case, you can use quotation marks within your string.
"""

# ╔═╡ a9110bed-e001-4ca5-b41f-669e300874ca
"Here, we get an "error" because it's ambiguous where this string ends "

# ╔═╡ e0afa773-695f-4539-b5b8-ccc1e059d2e4
"""Look, Mom, no "errors"!!! """

# ╔═╡ 0e6e6381-6db7-45d5-9127-6737f50cac9e
md"""
Note that ' ' define a character, but NOT a string!
"""

# ╔═╡ 7d437bcd-ed8b-4dbc-96c5-6ad5ceeb7299
typeof('a')

# ╔═╡ f938eecd-a5a3-48aa-a0cb-cf0fe5f7a978
'We will get an error here'

# ╔═╡ 8a7a1e04-e36a-4a47-95fe-9175abcbdf23
md"""
## String interpolation

We can use the $ sign to insert existing variables into a string and to evaluate expressions within a string.

Below is an example that contains some highly sensitive personal information.
"""

# ╔═╡ 840ab8fd-248c-48cf-9cfd-e8924d191316
name = "Jane"

# ╔═╡ 7b85c2fd-45fc-4ec6-9a23-c9f8ca00c4ad
num_fingers = 10

# ╔═╡ 505b732f-ab69-4c60-bc47-a785b2d0b34e
num_toes = 10

# ╔═╡ b28792c4-feeb-4641-898c-f792028d2b34
println("Hello, my name is $name.")

# ╔═╡ a194fa27-674d-4f21-9dfd-23acd5b1bdc8
println("I have $num_fingers fingers and $num_toes toes.")

# ╔═╡ 08b6daf3-b0b3-4e95-bb82-e610b68080df
 println("That is $(num_fingers + num_toes) digits in all!!")

# ╔═╡ 87f393e3-684f-4af4-ab81-a29d54288cfe
md"""
## String concatenation

Below are three ways we can concatenate strings!

The first way is to use the `string()` function.

`string()` converts non-string inputs to strings.
"""

# ╔═╡ 86fbedea-de50-4b35-915e-46e6bcc8b796
s3 = "How many cats ";

# ╔═╡ f2be8206-c00e-40a5-a424-ea48c2dba7de
s4 = "is too many cats?";

# ╔═╡ 0293f7a6-758a-494f-8b90-978baac78877
😺 = 10

# ╔═╡ cdceb9f9-d56f-4cc1-a9c3-0c37332c0e17
string(s3, s4)

# ╔═╡ 9afdc964-b4f5-4f81-97bb-a8130298501b
string("I don't know, but ", 😺, " is too few.")

# ╔═╡ 2268eef8-95ce-44ba-a155-5a81c419f5ad
md"""
We can also use `*` for concatenation!
"""

# ╔═╡ f5833b6b-00f3-4ba6-84d2-22a313161cba
s3*s4

# ╔═╡ e3242e59-99a7-45f3-b582-4b4114d00cbe
md"""
### Exercises

#### 2.1 
Create a string that says "hi" 1000 times, first with `repeat` and then with the exponentiation operator, which can call `*` under the hood. Assign it the variable `hi` below.
"""

# ╔═╡ 201f6750-d0e7-457b-bc6e-d9a3cbdffa47


# ╔═╡ d29e4c2c-44ba-4cfe-b29d-286da02f16d0
@assert hi == "hihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihi"

# ╔═╡ 7db39a88-7fd4-4cf1-b9da-378dfaf3a566
md"""
#### 2.2 
Declare two variables

```julia
a = 3
b = 4
```
and use them to create two strings:
```julia
"3 + 4"
"7" 
```
and store the results in `c` and `d` respectively
"""

# ╔═╡ 06f9792a-3366-411d-9ccb-c2781e182ec5


# ╔═╡ 2a83b312-faf5-4905-8fa3-972e5f3d082e
@assert c == "3 + 4"

# ╔═╡ 064fb1b4-0e84-4780-90a9-4494e91158c2
@assert d == "7"

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
# ╟─5e657587-8e3b-4368-adfd-33ad2ba1b661
# ╟─88d9e0c4-26c1-4624-99ce-07bbf4f6eefd
# ╠═0dd7c2b0-e115-4884-a494-6b0abc65637b
# ╠═9e62f6f5-180f-4d0e-8298-473c79e51a4e
# ╟─8b23e302-53c5-4b1c-88cd-717d31e81411
# ╠═a9110bed-e001-4ca5-b41f-669e300874ca
# ╠═e0afa773-695f-4539-b5b8-ccc1e059d2e4
# ╟─0e6e6381-6db7-45d5-9127-6737f50cac9e
# ╠═7d437bcd-ed8b-4dbc-96c5-6ad5ceeb7299
# ╠═f938eecd-a5a3-48aa-a0cb-cf0fe5f7a978
# ╟─8a7a1e04-e36a-4a47-95fe-9175abcbdf23
# ╠═840ab8fd-248c-48cf-9cfd-e8924d191316
# ╠═7b85c2fd-45fc-4ec6-9a23-c9f8ca00c4ad
# ╠═505b732f-ab69-4c60-bc47-a785b2d0b34e
# ╠═b28792c4-feeb-4641-898c-f792028d2b34
# ╠═a194fa27-674d-4f21-9dfd-23acd5b1bdc8
# ╠═08b6daf3-b0b3-4e95-bb82-e610b68080df
# ╟─87f393e3-684f-4af4-ab81-a29d54288cfe
# ╠═86fbedea-de50-4b35-915e-46e6bcc8b796
# ╠═f2be8206-c00e-40a5-a424-ea48c2dba7de
# ╠═0293f7a6-758a-494f-8b90-978baac78877
# ╠═cdceb9f9-d56f-4cc1-a9c3-0c37332c0e17
# ╠═9afdc964-b4f5-4f81-97bb-a8130298501b
# ╟─2268eef8-95ce-44ba-a155-5a81c419f5ad
# ╠═f5833b6b-00f3-4ba6-84d2-22a313161cba
# ╟─e3242e59-99a7-45f3-b582-4b4114d00cbe
# ╠═201f6750-d0e7-457b-bc6e-d9a3cbdffa47
# ╠═d29e4c2c-44ba-4cfe-b29d-286da02f16d0
# ╟─7db39a88-7fd4-4cf1-b9da-378dfaf3a566
# ╠═06f9792a-3366-411d-9ccb-c2781e182ec5
# ╠═2a83b312-faf5-4905-8fa3-972e5f3d082e
# ╠═064fb1b4-0e84-4780-90a9-4494e91158c2
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
