### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ 79eb2356-ac9e-11ed-2a98-9db4611da59e
md"""# Functions

Topics:
1. How to declare a function
2. Duck-typing in Julia
3. Mutating vs. non-mutating functions
4. Some higher order functions
"""

# ╔═╡ 79eb237c-ac9e-11ed-3e67-c34205643854
md"""## How to declare a function
Julia gives us a few different ways to write a function. The first requires the `function` and `end` keywords
"""

# ╔═╡ 79eb2392-ac9e-11ed-2a98-a3eb1be64395
function sayhi(name)
    println("Hi $name, it's great to see you!")
end

# ╔═╡ 79eb23ce-ac9e-11ed-0a63-55274fe404f6
function f(x)
    x^2
end

# ╔═╡ 79eb23d8-ac9e-11ed-2415-3bbeda4a05cc
md"""We can call either of these functions like this:
"""

# ╔═╡ 79eb23e2-ac9e-11ed-26b6-4905fcf6871a
sayhi("C-3PO")

# ╔═╡ 79eb23f6-ac9e-11ed-1eec-c71e3759e248
f(42)

# ╔═╡ 79eb2400-ac9e-11ed-219b-851f805de670
md"""Alternatively, we could have declared either of these functions in a single line
"""

# ╔═╡ 79eb2414-ac9e-11ed-3d5e-3104cb2c632e
sayhi2(name) = println("Hi $name, it's great to see you!")

# ╔═╡ 79eb2428-ac9e-11ed-31b5-d15aadf4721d
f2(x) = x^2

# ╔═╡ 79eb243c-ac9e-11ed-1308-e1fd93991724
sayhi2("R2D2")

# ╔═╡ 79eb2446-ac9e-11ed-2b9a-494ce718b3ed
f2(42)

# ╔═╡ 79eb2452-ac9e-11ed-24f1-0bf250dc40bc
md"""Finally, we could have declared these as "anonymous" functions
"""

# ╔═╡ 79eb245a-ac9e-11ed-1d46-53967384506b
sayhi3 = name -> println("Hi $name, it's great to see you!")

# ╔═╡ 79eb246e-ac9e-11ed-3bdf-43d5f97c8f8e
f3 = x -> x^2

# ╔═╡ 79eb248c-ac9e-11ed-1575-bde4a5912afe
sayhi3("Chewbacca")

# ╔═╡ 79eb24a0-ac9e-11ed-3616-9b0802dba745
f3(42)

# ╔═╡ 79eb24aa-ac9e-11ed-280e-3d78df27718d
md"""## Duck-typing in Julia
*"If it quacks like a duck, it's a duck."*

Julia functions will just work on whatever inputs make sense.

For example, `sayhi` works on the name of this minor tv character, written as an integer...
"""

# ╔═╡ 79eb24b2-ac9e-11ed-131b-096efa9273b3
sayhi(55595472)

# ╔═╡ 79eb24c8-ac9e-11ed-21a1-913d8744b80f
md"""And `f` will work on a matrix. 
"""

# ╔═╡ dffd7ef9-a513-4e16-b240-517f5cb0c7c0
rand_mat = rand(3, 3)

# ╔═╡ 0af81943-e6ac-43a6-9b76-4b8e95b3fa1c
rand_mat

# ╔═╡ 79eb24e4-ac9e-11ed-356d-ff93aad37196
f(rand_mat)

# ╔═╡ 79eb24fa-ac9e-11ed-05d6-e1972a20080e
md"""`f` will also work on a string like "hi" because `*` is defined for string inputs as string concatenation.
"""

# ╔═╡ 79eb2504-ac9e-11ed-0924-71fb907d824f
f("hi")

# ╔═╡ 79eb2516-ac9e-11ed-0a65-ed31c773bcef
md"""On the other hand, `f` will not work on a vector. Unlike `A^2`, which is well-defined, the meaning of `v^2` for a vector, `v`, is not a well-defined algebraic operation. 
"""

# ╔═╡ 79eb2522-ac9e-11ed-13b4-6b15da47f489
W = rand(3)

# ╔═╡ 79eb2536-ac9e-11ed-0a47-9f29427f8ea4
# This won't work
f(W)

# ╔═╡ 79eb254a-ac9e-11ed-07dd-ad0741629b62
md"""## Mutating vs. non-mutating functions

By convention, functions followed by `!` alter their contents and functions lacking `!` do not.

For example, let's look at the difference between `sort` and `sort!`.

"""

# ╔═╡ 79eb255e-ac9e-11ed-32f4-d53a67779d2f
v = [3, 5, 2]

# ╔═╡ 79eb2572-ac9e-11ed-201a-5d617cae7efa
sort(v)

# ╔═╡ 79eb2572-ac9e-11ed-329e-9dd6dc402ed0
v

# ╔═╡ 79eb2588-ac9e-11ed-1107-81cab4724f2f
md"""`sort(v)` returns a sorted array that contains the same elements as `v`, but `v` is left unchanged.

On the other hand, when we run `sort!(v)`, the contents of v are sorted within the array `v`.
"""

# ╔═╡ 79eb259a-ac9e-11ed-3330-0921a4588341
sort!(v)

# ╔═╡ 79eb259a-ac9e-11ed-2eb6-635e5f8e13ee
v

# ╔═╡ 79eb25cc-ac9e-11ed-130c-4dc4685001f7
md"""## Some higher order functions

### map

`map` is a "higher-order" function in Julia that *takes a function* as one of its input arguments. 
`map` then applies that function to every element of the data structure you pass it. For example, executing

```julia
map(f, [1, 2, 3])
```
will give you an output array where the function `f` has been applied to all elements of `[1, 2, 3]`
```julia
[f(1), f(2), f(3)]
```
"""

# ╔═╡ 79eb25d6-ac9e-11ed-3c3d-53c3818b563d
map(f, [1, 2, 3])

# ╔═╡ 79eb25e0-ac9e-11ed-23f4-fb648dd3aecb
md"""Here we've squared all the elements of the vector `[1, 2, 3]`, rather than squaring the vector `[1, 2, 3]`.

To do this, we could have passed to `map` an anonymous function rather than a named function, such as
"""

# ╔═╡ 79eb25f4-ac9e-11ed-3eea-b73e62c0988b
x -> x^3

# ╔═╡ 79eb25fe-ac9e-11ed-27fd-91e8452c4dee
md"""via
"""

# ╔═╡ 79eb2608-ac9e-11ed-2534-43346446dc94
map(x -> x^3, [1, 2, 3])

# ╔═╡ 79eb2612-ac9e-11ed-1129-2d5922115a00
md"""and now we've cubed all the elements of `[1, 2, 3]`!
"""

# ╔═╡ 79eb2630-ac9e-11ed-3509-d5768959da44
md"""### broadcast

`broadcast` is another higher-order function like `map`. `broadcast` is a generalization of `map`, so it can do every thing `map` can do and more. The syntax for calling `broadcast` is the same as for calling `map`
"""

# ╔═╡ 79eb2644-ac9e-11ed-0b65-73327c8870e9
broadcast(f, [1, 2, 3])

# ╔═╡ 79eb264c-ac9e-11ed-1e65-d3711fa65b46
md"""and again, we've applied `f` (squared) to all the elements of `[1, 2, 3]` - this time by "broadcasting" `f`!

Some syntactic sugar for calling `broadcast` is to place a `.` between the name of the function you want to `broadcast` and its input arguments. For example,

```julia
broadcast(f, [1, 2, 3])
```
is the same as
```julia
f.([1, 2, 3])
```
"""

# ╔═╡ 79eb2658-ac9e-11ed-21eb-65afc8af9b31
f.([1, 2, 3])

# ╔═╡ 79eb266c-ac9e-11ed-0b74-fdf1b70f9191
md"""Notice again how different this is from calling 
```julia
f([1, 2, 3])
```
We can square every element of a vector, but we can't square a vector!
"""

# ╔═╡ 79eb2680-ac9e-11ed-3748-cd78420b272a
md"""To drive home the point, let's look at the difference between

```julia
f(A)
```
and
```julia
f.(A)
```
for a matrix `A`:
"""

# ╔═╡ 79eb2694-ac9e-11ed-17e1-7163fed215b1
A = [i + 3*j for j in 0:2, i in 1:3]

# ╔═╡ 79eb269e-ac9e-11ed-2f15-1553016b7654
f(A)

# ╔═╡ 79eb26a8-ac9e-11ed-036a-1f6c90ff9c0b
md"""As before we see that for a matrix, `A`,
```
f(A) = A^2 = A * A
``` 

On the other hand,
"""

# ╔═╡ 79eb26c6-ac9e-11ed-34ab-abf1328bb66b
B = f.(A)

# ╔═╡ 79eb26d0-ac9e-11ed-15ba-c917cb97250e
md"""contains the squares of all the entries of `A`.

This dot syntax for broadcasting allows us to write relatively complex compound elementwise expressions in a way that looks natural/closer to mathematical notation. For example, we can write
"""

# ╔═╡ 79eb26e4-ac9e-11ed-2aeb-918e6e0c1ac3
A .+ 2 .* f.(A) ./ A

# ╔═╡ 79eb26f8-ac9e-11ed-39b6-3bd71411d375
md"""instead of
"""

# ╔═╡ 79eb2702-ac9e-11ed-39a7-0f4c61a7ff95
broadcast(x -> x + 2 * f(x) / x, A)

# ╔═╡ 79eb270c-ac9e-11ed-3852-11705399a5bb
md"""and the two will perform exactly the same.
"""

# ╔═╡ 79eb273e-ac9e-11ed-31d7-23b7afee7fd8
md"""### Exercises

#### 6.1 
Write a function `add_one` that adds 1 to its input.
"""

# ╔═╡ 79eb2750-ac9e-11ed-2e12-538694a1138a


# ╔═╡ 79eb2750-ac9e-11ed-01b6-91aa02378649
@assert add_one(1) == 2

# ╔═╡ 79eb275c-ac9e-11ed-0929-23e760cd940f
@assert add_one(11) == 12

# ╔═╡ 79eb277a-ac9e-11ed-1a75-3d2ef93a1b0b
md"""#### 6.2 
Use `map` or `broadcast` to increment every element of matrix `A` by `1` and assign it to a variable `A1`.
"""

# ╔═╡ 79eb2782-ac9e-11ed-3eae-63a08a1011ea


# ╔═╡ 79eb278e-ac9e-11ed-0fce-8b74b9c53c8f
@assert A1 == [2 3 4; 5 6 7; 8 9 10]

# ╔═╡ 79eb2798-ac9e-11ed-10d9-6d9bb70eba0f
md"""#### 6.3 
Use the broadcast dot syntax to increment every element of matrix `A1` by `1` and store it in variable `A2`
"""

# ╔═╡ 79eb27a2-ac9e-11ed-162f-47c824644c65


# ╔═╡ 79eb27b4-ac9e-11ed-35c6-7324af984e12
@assert A2 == [3 4 5; 6 7 8; 9 10 11]

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
# ╟─79eb2356-ac9e-11ed-2a98-9db4611da59e
# ╟─79eb237c-ac9e-11ed-3e67-c34205643854
# ╠═79eb2392-ac9e-11ed-2a98-a3eb1be64395
# ╠═79eb23ce-ac9e-11ed-0a63-55274fe404f6
# ╟─79eb23d8-ac9e-11ed-2415-3bbeda4a05cc
# ╠═79eb23e2-ac9e-11ed-26b6-4905fcf6871a
# ╠═79eb23f6-ac9e-11ed-1eec-c71e3759e248
# ╟─79eb2400-ac9e-11ed-219b-851f805de670
# ╠═79eb2414-ac9e-11ed-3d5e-3104cb2c632e
# ╠═79eb2428-ac9e-11ed-31b5-d15aadf4721d
# ╠═79eb243c-ac9e-11ed-1308-e1fd93991724
# ╠═79eb2446-ac9e-11ed-2b9a-494ce718b3ed
# ╟─79eb2452-ac9e-11ed-24f1-0bf250dc40bc
# ╠═79eb245a-ac9e-11ed-1d46-53967384506b
# ╠═79eb246e-ac9e-11ed-3bdf-43d5f97c8f8e
# ╠═79eb248c-ac9e-11ed-1575-bde4a5912afe
# ╠═79eb24a0-ac9e-11ed-3616-9b0802dba745
# ╟─79eb24aa-ac9e-11ed-280e-3d78df27718d
# ╠═79eb24b2-ac9e-11ed-131b-096efa9273b3
# ╟─79eb24c8-ac9e-11ed-21a1-913d8744b80f
# ╠═dffd7ef9-a513-4e16-b240-517f5cb0c7c0
# ╠═0af81943-e6ac-43a6-9b76-4b8e95b3fa1c
# ╠═79eb24e4-ac9e-11ed-356d-ff93aad37196
# ╟─79eb24fa-ac9e-11ed-05d6-e1972a20080e
# ╠═79eb2504-ac9e-11ed-0924-71fb907d824f
# ╟─79eb2516-ac9e-11ed-0a65-ed31c773bcef
# ╠═79eb2522-ac9e-11ed-13b4-6b15da47f489
# ╠═79eb2536-ac9e-11ed-0a47-9f29427f8ea4
# ╟─79eb254a-ac9e-11ed-07dd-ad0741629b62
# ╠═79eb255e-ac9e-11ed-32f4-d53a67779d2f
# ╠═79eb2572-ac9e-11ed-201a-5d617cae7efa
# ╠═79eb2572-ac9e-11ed-329e-9dd6dc402ed0
# ╟─79eb2588-ac9e-11ed-1107-81cab4724f2f
# ╠═79eb259a-ac9e-11ed-3330-0921a4588341
# ╠═79eb259a-ac9e-11ed-2eb6-635e5f8e13ee
# ╟─79eb25cc-ac9e-11ed-130c-4dc4685001f7
# ╠═79eb25d6-ac9e-11ed-3c3d-53c3818b563d
# ╟─79eb25e0-ac9e-11ed-23f4-fb648dd3aecb
# ╠═79eb25f4-ac9e-11ed-3eea-b73e62c0988b
# ╟─79eb25fe-ac9e-11ed-27fd-91e8452c4dee
# ╠═79eb2608-ac9e-11ed-2534-43346446dc94
# ╟─79eb2612-ac9e-11ed-1129-2d5922115a00
# ╟─79eb2630-ac9e-11ed-3509-d5768959da44
# ╠═79eb2644-ac9e-11ed-0b65-73327c8870e9
# ╟─79eb264c-ac9e-11ed-1e65-d3711fa65b46
# ╠═79eb2658-ac9e-11ed-21eb-65afc8af9b31
# ╟─79eb266c-ac9e-11ed-0b74-fdf1b70f9191
# ╟─79eb2680-ac9e-11ed-3748-cd78420b272a
# ╠═79eb2694-ac9e-11ed-17e1-7163fed215b1
# ╠═79eb269e-ac9e-11ed-2f15-1553016b7654
# ╟─79eb26a8-ac9e-11ed-036a-1f6c90ff9c0b
# ╠═79eb26c6-ac9e-11ed-34ab-abf1328bb66b
# ╟─79eb26d0-ac9e-11ed-15ba-c917cb97250e
# ╠═79eb26e4-ac9e-11ed-2aeb-918e6e0c1ac3
# ╟─79eb26f8-ac9e-11ed-39b6-3bd71411d375
# ╠═79eb2702-ac9e-11ed-39a7-0f4c61a7ff95
# ╟─79eb270c-ac9e-11ed-3852-11705399a5bb
# ╟─79eb273e-ac9e-11ed-31d7-23b7afee7fd8
# ╠═79eb2750-ac9e-11ed-2e12-538694a1138a
# ╠═79eb2750-ac9e-11ed-01b6-91aa02378649
# ╠═79eb275c-ac9e-11ed-0929-23e760cd940f
# ╟─79eb277a-ac9e-11ed-1a75-3d2ef93a1b0b
# ╠═79eb2782-ac9e-11ed-3eae-63a08a1011ea
# ╠═79eb278e-ac9e-11ed-0fce-8b74b9c53c8f
# ╟─79eb2798-ac9e-11ed-10d9-6d9bb70eba0f
# ╠═79eb27a2-ac9e-11ed-162f-47c824644c65
# ╠═79eb27b4-ac9e-11ed-35c6-7324af984e12
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
