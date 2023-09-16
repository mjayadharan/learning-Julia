### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ 531b44cb-9f74-473a-8dce-d30e07fe9e32
md"""

!!! tip "Note"
	This notebook has a:
		
	- Static HTML format for quick viewing
	- A runnable format obtained by clicking on the upper right
	It may take a while to launch, but the wait will be worth it!	
"""

# ╔═╡ 388e4c21-c877-471a-b51f-213a66f6a194
md"""
# Getting started

Topics:
1.  How to print
2. How to assign variables
3. How to comment
4. Syntax for basic math
"""

# ╔═╡ d830b7b9-e545-45ea-b61c-0e1bcc55c758
md"""
## How to print

In Julia we usually use `println()` to print
"""

# ╔═╡ 258a58b3-c739-45b6-b1ec-b162e3fbc630
println("I'm excited to learn Julia!", 42)

# ╔═╡ 15b23199-34b5-4874-bcfc-9d0fa592b28c
md"""
## How to assign variables

All we need is a variable name, value, and an equal's sign!
Julia will figure out types for us.
"""

# ╔═╡ 73e22e43-19cb-4285-b001-d124fc82bec3
my_answer = 42

# ╔═╡ 339b6b16-af96-438d-a220-13e75d5178c2
typeof(my_answer)

# ╔═╡ 3a538eb6-55e7-4fa4-8158-cba328aa2849
my_pi = 3.14159

# ╔═╡ 3d6c362a-2485-49a7-948d-05550de71a2d
typeof(my_pi)

# ╔═╡ 61805e50-3946-4831-a21d-3cdd6ab56df1
md"""
To type a smiley cat, use tab completion to select the emoji name and then tab again
"""

# ╔═╡ d6624994-726e-4c2c-b172-ef227a381ab0
# \:smi + <tab> --> select with down arrow + <enter> ---> <tab> + <enter> to complete

# ╔═╡ 4c5fbd3a-d8c2-4214-be6e-53d829c39c63
md"""
After assigning a value to a variable, we can reassign a value of a different type to that variable without any issue.
"""

# ╔═╡ 4f11bd90-683a-4ec7-b1c2-638bf9940044
typeof(😺)

# ╔═╡ 66256d79-70a3-4912-9679-629cb147737c
typeof(😺)

# ╔═╡ 69d70e07-0b31-40bd-8f35-6b0ed1de139b
md"""
Note: Julia allows us to write super generic code, and 😺 is an example of this. 

This allows us to write code like
"""

# ╔═╡ 3677fcc1-6f8e-4148-bfd4-2ed5d28b5acc
😀 = 0

# ╔═╡ 0f8a16d3-6bc4-41e4-a101-254ce8f640e2
😞 = -1

# ╔═╡ b773c536-f64a-458a-a11e-4fbfd96ea947
😺 + 😞 == 😀

# ╔═╡ 29bc4f4e-34df-4f8e-b4fb-dd2cada51025
md"""
## How to comment
"""

# ╔═╡ 7f1a6e77-7177-4984-a0af-8db27fba8271
# You can leave comments on a single line using the pound/hash key

# ╔═╡ a3cff051-9b02-48d0-9a08-d39033464134
#=

For multi-line comments, 
use the '#= =#' sequence.

=#

# ╔═╡ d1e5d776-fb2d-4f11-ad2b-d351df965a26
md"""
## Syntax for basic math
"""

# ╔═╡ 1a58cc4a-fa5f-44b8-809e-6a128a3f408e
sum = 3 + 7

# ╔═╡ 81d5e681-37c8-44d5-acfb-3ba50e2fe426
difference = 10 - 3

# ╔═╡ 33888bdd-9a50-4cd1-8436-0b44b1cda2a6
product = 20 * 5

# ╔═╡ 109588f2-0760-4132-a845-85569a593ae2
quotient = 100 / 10

# ╔═╡ 64cc06b5-6095-4eaf-8864-7b50bedc9d89
power = 10 ^ 2 

# ╔═╡ eedb1055-d52f-4ae7-b9da-261aa27e98a3
modulus = 101 % 2

# ╔═╡ 31b9224f-d8df-4baf-879f-9046fd10cc52
md"""
### Exercises

#### 1.1 
Look up docs for the `convert` function.
"""

# ╔═╡ 65bd1991-a8e8-4bcf-9ddf-23bf1e5b25f5
?convert

# ╔═╡ f3454fda-48bc-4c98-b742-45e2e4287008
md"""
#### 1.2 
Assign `365` to a variable named `days`. Convert `days` to a float and assign it to variable `days_float`
"""

# ╔═╡ 3e78abad-c592-4f26-893b-d8f3239ae447
days = 365

# ╔═╡ 2cdf7382-2891-42d5-b786-ab4b27a0c209
days_float = convert(Float32, days)

# ╔═╡ 684d1373-686b-4378-953d-6932b504c281
@assert days == 365

# ╔═╡ 2cc93006-9451-40d2-bd97-30280990d2b3
@assert days_float == 365.0

# ╔═╡ 4bdb07b6-0a4a-466b-9562-340b7dbab99c
parse(Int64, "1")

# ╔═╡ d737ee16-5f9c-47e1-853e-e2fe640f5212
md"""
#### 1.3 
See what happens when you execute

```julia
convert(Int64, "1")
```
and

```julia
parse(Int64, "1")
```
"""

# ╔═╡ d0ab759e-b648-41a4-ab80-6813328ef7ef
println("test")

# ╔═╡ 5e64a968-7ca2-4ae6-9db7-b7588e421bc4
😺 = 1

# ╔═╡ 4d0d39b3-8bf8-4791-9d37-5d8b1dedb34c
# ╠═╡ disabled = true
#=╠═╡
😺 = "smiley cat!"
  ╠═╡ =#

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
# ╟─531b44cb-9f74-473a-8dce-d30e07fe9e32
# ╟─388e4c21-c877-471a-b51f-213a66f6a194
# ╟─d830b7b9-e545-45ea-b61c-0e1bcc55c758
# ╠═258a58b3-c739-45b6-b1ec-b162e3fbc630
# ╟─15b23199-34b5-4874-bcfc-9d0fa592b28c
# ╠═73e22e43-19cb-4285-b001-d124fc82bec3
# ╠═339b6b16-af96-438d-a220-13e75d5178c2
# ╠═3a538eb6-55e7-4fa4-8158-cba328aa2849
# ╠═3d6c362a-2485-49a7-948d-05550de71a2d
# ╠═4d0d39b3-8bf8-4791-9d37-5d8b1dedb34c
# ╠═4f11bd90-683a-4ec7-b1c2-638bf9940044
# ╟─61805e50-3946-4831-a21d-3cdd6ab56df1
# ╠═d6624994-726e-4c2c-b172-ef227a381ab0
# ╟─4c5fbd3a-d8c2-4214-be6e-53d829c39c63
# ╠═5e64a968-7ca2-4ae6-9db7-b7588e421bc4
# ╠═66256d79-70a3-4912-9679-629cb147737c
# ╟─69d70e07-0b31-40bd-8f35-6b0ed1de139b
# ╠═3677fcc1-6f8e-4148-bfd4-2ed5d28b5acc
# ╠═0f8a16d3-6bc4-41e4-a101-254ce8f640e2
# ╠═b773c536-f64a-458a-a11e-4fbfd96ea947
# ╟─29bc4f4e-34df-4f8e-b4fb-dd2cada51025
# ╠═7f1a6e77-7177-4984-a0af-8db27fba8271
# ╠═a3cff051-9b02-48d0-9a08-d39033464134
# ╟─d1e5d776-fb2d-4f11-ad2b-d351df965a26
# ╠═1a58cc4a-fa5f-44b8-809e-6a128a3f408e
# ╠═81d5e681-37c8-44d5-acfb-3ba50e2fe426
# ╠═33888bdd-9a50-4cd1-8436-0b44b1cda2a6
# ╠═109588f2-0760-4132-a845-85569a593ae2
# ╠═64cc06b5-6095-4eaf-8864-7b50bedc9d89
# ╠═eedb1055-d52f-4ae7-b9da-261aa27e98a3
# ╟─31b9224f-d8df-4baf-879f-9046fd10cc52
# ╠═65bd1991-a8e8-4bcf-9ddf-23bf1e5b25f5
# ╟─f3454fda-48bc-4c98-b742-45e2e4287008
# ╠═3e78abad-c592-4f26-893b-d8f3239ae447
# ╠═2cdf7382-2891-42d5-b786-ab4b27a0c209
# ╠═684d1373-686b-4378-953d-6932b504c281
# ╠═2cc93006-9451-40d2-bd97-30280990d2b3
# ╠═4bdb07b6-0a4a-466b-9562-340b7dbab99c
# ╟─d737ee16-5f9c-47e1-853e-e2fe640f5212
# ╠═d0ab759e-b648-41a4-ab80-6813328ef7ef
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
