### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ 79f2926c-ac9e-11ed-213a-0b0186a38e40
md"""# Multiple dispatch
"""

# ╔═╡ 79f29294-ac9e-11ed-3659-718c5815b305
md"""In this notebook we'll explore **multiple dispatch**, which is a key feature of Julia.

Multiple dispatch makes software *generic* and *fast*!

#### Starting with the familiar

To understand multiple dispatch in Julia, let's start with what we've already seen.

We can declare functions in Julia without giving Julia any information about the types of the input arguments that function will receive:
"""

# ╔═╡ 79f292a8-ac9e-11ed-044a-69c1a7783943
f(x) = x.^2

# ╔═╡ 79f292b2-ac9e-11ed-343a-a717a0c99b85
md"""and then Julia will determine on its own which input argument types make sense and which do not:
"""

# ╔═╡ 79f292be-ac9e-11ed-33d3-49ae55682806
f(10)

# ╔═╡ 79f292c6-ac9e-11ed-23ae-e7a2c5ab6eb5
f([1, 2, 3])

# ╔═╡ 79f292da-ac9e-11ed-26c0-753531b43c11
md"""#### Specifying the types of our input arguments

However, we also have the *option* to tell Julia explicitly what types our input arguments are allowed to have.

For example, let's write a function `foo` that only takes strings as inputs.
"""

# ╔═╡ 79f292e4-ac9e-11ed-32c5-1bbebe9036cc
foo(x::String, y::String) = println("My inputs x and y are both strings!")

# ╔═╡ 79f292ec-ac9e-11ed-255f-910079c32322
md"""We see here that in order to restrict the type of `x` and `y` to `String`s, we just follow the input argument name by a double colon and the keyword `String`.

Now we'll see that `foo` works on `String`s and doesn't work on other input argument types.
"""

# ╔═╡ 79f2930c-ac9e-11ed-1416-ed5993a2ec78
md"""To get `foo` to work on integer (`Int`) inputs, let's tack `::Int` onto our input arguments when we declare `foo`.
"""

# ╔═╡ 79f29316-ac9e-11ed-06ff-91d25b792a79
foo(x::Int, y::Int) = println("My inputs x and y are both integers!")

# ╔═╡ 79f2932a-ac9e-11ed-327b-0969c3f5eb8d
md"""Now `foo` works on integers! But look, `foo` also still works when `x` and `y` are strings!
"""

# ╔═╡ eea8e458-0e70-4088-9cfb-b2524734a05e


# ╔═╡ 79f29348-ac9e-11ed-0cce-0bca59b5a541
md"""This is starting to get to the heart of multiple dispatch. When we declared

```julia
foo(x::Int, y::Int) = println("My inputs x and y are both integers!")
```
we didn't overwrite or replace
```julia
foo(x::String, y::String)
```
Instead, we just added an additional ***method*** to the ***generic function*** called `foo`.

A *generic function* is the abstract concept associated with a particular operation.

For example, the generic function `+` represents the concept of addition.

A *method* is a specific implementation of a generic function for *particular argument types*.

For example, `+` has methods that accept floating point numbers, integers, matrices, etc.

We can use the `methods` to see how many methods there are for `foo`.
"""

# ╔═╡ 79f2935c-ac9e-11ed-1be3-0fbc502f130a
md"""Aside: how many methods do you think there are for addition?
"""

# ╔═╡ 79f29366-ac9e-11ed-3a3a-d7fc5a970acc
methods(+)

# ╔═╡ 79f2937a-ac9e-11ed-1135-8bada4c73e6f
md"""So, we now can call `foo` on integers or strings. When you call `foo` on a particular set of arguments, Julia will infer the types of the inputs and dispatch the appropriate method. *This* is multiple dispatch.

Multiple dispatch makes our code generic and fast. Our code can be generic and flexible because we can write code in terms of abstract operations such as addition and multiplication, rather than in terms of specific implementations. At the same time, our code runs quickly because Julia is able to call efficient methods for the relevant types.

To see which method is being dispatched when we call a generic function, we can use the @which macro:
"""

# ╔═╡ 79f29384-ac9e-11ed-1014-25ea67409897
md"""Let's see what happens when we use `@which` with the addition operator!
"""

# ╔═╡ 79f2938e-ac9e-11ed-145c-d3baa15c1665
@which 3.0 + 3.0

# ╔═╡ 79f293a2-ac9e-11ed-3c6f-0b99b3897709
md"""And we can continue to add other methods to our generic function `foo`. Let's add one that takes the *abstract type* `Number`, which includes subtypes such as `Int`, `Float64`, and other objects you would think of as numbers:
"""

# ╔═╡ 79f293a2-ac9e-11ed-2263-f763f63d8cfc
foo(x::Number, y::Number) = println("My inputs x and y are both numbers!")

# ╔═╡ 79f293ac-ac9e-11ed-2591-3d7b1d0d8b3c
md"""This method for `foo` will work on, for example, floating point numbers:
"""

# ╔═╡ 79f293c2-ac9e-11ed-19ec-cbb1f13d19ef
md"""We can also add a fallback, duck-typed method for `foo` that takes inputs of any type:
"""

# ╔═╡ 79f293ca-ac9e-11ed-35ac-392e9f8ed462
foo(x, y) = println("I accept inputs of any type!")

# ╔═╡ 79f292f8-ac9e-11ed-048b-cf1b2c02f652
foo("hello", "hi!")

# ╔═╡ 79f29302-ac9e-11ed-1fae-1788776938a1
foo(3, 4)

# ╔═╡ 79f2931e-ac9e-11ed-37f5-1993ad527d38
foo(3, 4)

# ╔═╡ 79f29334-ac9e-11ed-1eb2-6128ff2a91c4
foo("hello", "hi!")

# ╔═╡ 79f29350-ac9e-11ed-15a9-f5430bdc9353
methods(foo)

# ╔═╡ 79f29384-ac9e-11ed-0ceb-7938c76d94bf
@which foo(3, 4)

# ╔═╡ 79f293b6-ac9e-11ed-17a4-0fd352304cea
foo(3.0, 4.0)

# ╔═╡ 79f293d4-ac9e-11ed-0636-41d1f66255a3
md"""Given the methods we've already written for `foo` so far, this method will be called whenever we pass non-numbers to `foo`:
"""

# ╔═╡ 20cc3c00-e38b-44f5-9af1-a938dd182d4e
v = rand(3)

# ╔═╡ fd8e4fac-5d60-4163-9b6e-33b20e362e54
foo(v, v)

# ╔═╡ 79f293e8-ac9e-11ed-2080-2da180192ccd
md"""### Exercises

#### 9.1

Extend the function `foo`, adding a method that takes only one input argument, which is of type `Bool`, and returns "foo with one boolean!"
"""

# ╔═╡ 79f293f4-ac9e-11ed-2764-a1b9d30b4213


# ╔═╡ 79f293fc-ac9e-11ed-2766-b5c6af4b84e1
md"""#### 9.2

Check that the method being dispatched when you execute 
```julia
foo(true)
```
is the one you wrote.
"""

# ╔═╡ 79f29406-ac9e-11ed-09fa-696af521e808


# ╔═╡ 79f29410-ac9e-11ed-0ec8-6387bcbd25ea
@assert foo(true) == "foo with one boolean!"

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
# ╟─79f2926c-ac9e-11ed-213a-0b0186a38e40
# ╟─79f29294-ac9e-11ed-3659-718c5815b305
# ╠═79f292a8-ac9e-11ed-044a-69c1a7783943
# ╟─79f292b2-ac9e-11ed-343a-a717a0c99b85
# ╠═79f292be-ac9e-11ed-33d3-49ae55682806
# ╠═79f292c6-ac9e-11ed-23ae-e7a2c5ab6eb5
# ╟─79f292da-ac9e-11ed-26c0-753531b43c11
# ╠═79f292e4-ac9e-11ed-32c5-1bbebe9036cc
# ╟─79f292ec-ac9e-11ed-255f-910079c32322
# ╠═79f292f8-ac9e-11ed-048b-cf1b2c02f652
# ╠═79f29302-ac9e-11ed-1fae-1788776938a1
# ╟─79f2930c-ac9e-11ed-1416-ed5993a2ec78
# ╠═79f29316-ac9e-11ed-06ff-91d25b792a79
# ╠═79f2931e-ac9e-11ed-37f5-1993ad527d38
# ╟─79f2932a-ac9e-11ed-327b-0969c3f5eb8d
# ╠═79f29334-ac9e-11ed-1eb2-6128ff2a91c4
# ╠═eea8e458-0e70-4088-9cfb-b2524734a05e
# ╟─79f29348-ac9e-11ed-0cce-0bca59b5a541
# ╠═79f29350-ac9e-11ed-15a9-f5430bdc9353
# ╟─79f2935c-ac9e-11ed-1be3-0fbc502f130a
# ╠═79f29366-ac9e-11ed-3a3a-d7fc5a970acc
# ╟─79f2937a-ac9e-11ed-1135-8bada4c73e6f
# ╠═79f29384-ac9e-11ed-0ceb-7938c76d94bf
# ╟─79f29384-ac9e-11ed-1014-25ea67409897
# ╠═79f2938e-ac9e-11ed-145c-d3baa15c1665
# ╟─79f293a2-ac9e-11ed-3c6f-0b99b3897709
# ╠═79f293a2-ac9e-11ed-2263-f763f63d8cfc
# ╟─79f293ac-ac9e-11ed-2591-3d7b1d0d8b3c
# ╠═79f293b6-ac9e-11ed-17a4-0fd352304cea
# ╟─79f293c2-ac9e-11ed-19ec-cbb1f13d19ef
# ╠═79f293ca-ac9e-11ed-35ac-392e9f8ed462
# ╟─79f293d4-ac9e-11ed-0636-41d1f66255a3
# ╠═20cc3c00-e38b-44f5-9af1-a938dd182d4e
# ╠═fd8e4fac-5d60-4163-9b6e-33b20e362e54
# ╟─79f293e8-ac9e-11ed-2080-2da180192ccd
# ╠═79f293f4-ac9e-11ed-2764-a1b9d30b4213
# ╟─79f293fc-ac9e-11ed-2766-b5c6af4b84e1
# ╠═79f29406-ac9e-11ed-09fa-696af521e808
# ╠═79f29410-ac9e-11ed-0ec8-6387bcbd25ea
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
