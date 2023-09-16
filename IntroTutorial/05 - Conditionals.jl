### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ 79e9e1f8-ac9e-11ed-19d9-677a4ba03722
md"""# Conditionals

#### with the `if` keyword
In Julia, the syntax

```julia
if *condition 1*
    *option 1*
elseif *condition 2*
    *option 2*
else
    *option 3*
end
```

allows us to conditionally evaluate one of our options.
<br><br>
For example, we might want to implement the FizzBuzz test: given a number, N, print "Fizz" if N is divisible by 3, "Buzz" if N is divisible by 5, and "FizzBuzz" if N is divisible by 3 and 5. Otherwise just print the number itself! Enter your choice for `N` here:
"""

# ╔═╡ 79e9e20e-ac9e-11ed-0cd3-d91c54144509
N = 5

# ╔═╡ 79e9e220-ac9e-11ed-12c1-bfd6cc368c17
if (N % 3 == 0) && (N % 5 == 0) # `&&` means "AND"; % computes the remainder after division
    println("FizzBuzz")
elseif N % 3 == 0
    println("Fizz")
elseif N % 5 == 0
    println("Buzz")
else
    println(N)
end

# ╔═╡ 79e9e23c-ac9e-11ed-3ba5-db072427906e
md"""#### with ternary operators

For this last block, we could instead use the ternary operator with the syntax

```julia
a ? b : c
```

which equates to 

```julia
if a
    b
else
    c
end
```
"""

# ╔═╡ 79e9e248-ac9e-11ed-0eec-f557c60dd8ab
md"""Now let's say we want to return the larger of two numbers. Give `x` and `y` values here:
"""

# ╔═╡ c3fb2d91-6653-4b2a-8760-af7bfc06a156
x = 10

# ╔═╡ 42e90bd9-0c93-4ac5-a564-5d760bcfa0c3
y = 30

# ╔═╡ 79e9e266-ac9e-11ed-16b3-7b6518e6aa3c
md"""Using the `if` and `else` keywords, we might write:
"""

# ╔═╡ 79e9e26e-ac9e-11ed-1ee1-913fcf49a4bb
if x > y
    x
else
    y
end

# ╔═╡ 79e9e284-ac9e-11ed-183c-57a2949b788c
md"""and as a ternary operator, the conditional looks like this:
"""

# ╔═╡ 79e9e298-ac9e-11ed-24a9-f1cd73ee3c27
(x > y) ? x : y

# ╔═╡ 79e9e2ac-ac9e-11ed-0f63-f3a079e4274c
md"""#### with short-circuit evaluation

We've already seen expressions with the syntax
```julia
a && b
```
to return true if both `a` and `b` are true. Of course, if `a` is false, Julia doesn't even need to know the value of `b` in order to determine that the overall result will be false. So Julia doesn't even need to check what `b` is; it can just "short-circuit" and immediately return `false`.  The second argument `b` might be a more complicated expression like a function call with a side-effect, in which case it won't even be called:
"""

# ╔═╡ 79e9e2b6-ac9e-11ed-30c7-8d23018cd169
false && (println("hi"); true)

# ╔═╡ 79e9e2c0-ac9e-11ed-00cd-4d1e4cbcbd3f
true && (println("hi"); true)

# ╔═╡ 79e9e2d4-ac9e-11ed-14f3-4fa4980ba5f3
md"""On the other hand, if `a` is true, Julia knows it can just return the value of `b` as the overall expression. This means that `b` doesn't necessarily need evaluate to `true` or `false`!  `b` could even be an error:
"""

# ╔═╡ 79e9e2de-ac9e-11ed-2b3c-01ad4c97c996
(x > 0) && error("x cannot be greater than 0")

# ╔═╡ 79e9e2e8-ac9e-11ed-1a2b-1b8eb81f5fef
md"""Similarly, check out the `||` operator, which also uses short-circuit evaluation to perform the "or" operation.
"""

# ╔═╡ 79e9e306-ac9e-11ed-00d1-999f85a2cf60
true || println("hi")

# ╔═╡ 79e9e312-ac9e-11ed-0234-b905763fe9f1
md"""and
"""

# ╔═╡ 79e9e31a-ac9e-11ed-2d06-579ebbb78375
false || println("hi")

# ╔═╡ 79e9e32e-ac9e-11ed-0820-45497fdb8505
md"""### Exercises

#### 5.1 
Write a conditional statement that prints a number if the number is even and the string "odd" if the number is odd.
"""

# ╔═╡ 79e9e32e-ac9e-11ed-1169-2f79e0864ac2


# ╔═╡ 79e9e344-ac9e-11ed-09c2-7ff2b9fd779d
md"""#### 5.2 
Rewrite the code from 5.1 using a ternary operator.
"""

# ╔═╡ 79e9e356-ac9e-11ed-2b43-8b859cadace0


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
# ╟─79e9e1f8-ac9e-11ed-19d9-677a4ba03722
# ╠═79e9e20e-ac9e-11ed-0cd3-d91c54144509
# ╠═79e9e220-ac9e-11ed-12c1-bfd6cc368c17
# ╟─79e9e23c-ac9e-11ed-3ba5-db072427906e
# ╟─79e9e248-ac9e-11ed-0eec-f557c60dd8ab
# ╠═c3fb2d91-6653-4b2a-8760-af7bfc06a156
# ╠═42e90bd9-0c93-4ac5-a564-5d760bcfa0c3
# ╟─79e9e266-ac9e-11ed-16b3-7b6518e6aa3c
# ╠═79e9e26e-ac9e-11ed-1ee1-913fcf49a4bb
# ╟─79e9e284-ac9e-11ed-183c-57a2949b788c
# ╠═79e9e298-ac9e-11ed-24a9-f1cd73ee3c27
# ╟─79e9e2ac-ac9e-11ed-0f63-f3a079e4274c
# ╠═79e9e2b6-ac9e-11ed-30c7-8d23018cd169
# ╠═79e9e2c0-ac9e-11ed-00cd-4d1e4cbcbd3f
# ╟─79e9e2d4-ac9e-11ed-14f3-4fa4980ba5f3
# ╠═79e9e2de-ac9e-11ed-2b3c-01ad4c97c996
# ╟─79e9e2e8-ac9e-11ed-1a2b-1b8eb81f5fef
# ╠═79e9e306-ac9e-11ed-00d1-999f85a2cf60
# ╟─79e9e312-ac9e-11ed-0234-b905763fe9f1
# ╠═79e9e31a-ac9e-11ed-2d06-579ebbb78375
# ╟─79e9e32e-ac9e-11ed-0820-45497fdb8505
# ╠═79e9e32e-ac9e-11ed-1169-2f79e0864ac2
# ╟─79e9e344-ac9e-11ed-09c2-7ff2b9fd779d
# ╠═79e9e356-ac9e-11ed-2b43-8b859cadace0
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
