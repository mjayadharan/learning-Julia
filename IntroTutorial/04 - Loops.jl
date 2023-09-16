### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ 79e8ba12-ac9e-11ed-1b62-b3d448fe3fa8
md"""# Loops

Topics:
1. `while` loops
2. `for` loops

## while loops

The syntax for a `while` is

```julia
while *condition*
    *loop body*
end
```

For example, we could use `while` to count or to iterate over an array.
"""

# ╔═╡ dc45316a-58da-4acd-9fc5-e05bad0b1dcc
x = 0

# ╔═╡ 868d6fc2-9b9c-4d66-92f0-eee60f5f1953
while x < 10
    x += 1
    println(x)
end

# ╔═╡ 225d8e0f-c1f4-4578-99c1-3e2f2225ca2e
myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

# ╔═╡ 8305bf8b-a736-4db1-9ad1-0c6b8e175023
i = 1

# ╔═╡ d92e5eec-e3da-4b79-b544-e07691ade039
while i <= length(myfriends)
    friend = myfriends[i]
    println("Hi $friend, it's great to see you!")
    i += 1
end

# ╔═╡ 79e8ba62-ac9e-11ed-1980-5956b9f8df78
md"""## for loops

The syntax for a `for` loop is

```julia
for *var* in *loop iterable*
    *loop body*
end
```

We could use a for loop to generate the same results as either of the examples above:
"""

# ╔═╡ 79e8ba76-ac9e-11ed-2c7a-1f0044f0b195
for n in 1:10
    println(n)
end

# ╔═╡ 33c0f45a-3e39-459d-9b71-c2bc344a76e2
for friend in myfriends
    println("Hi $friend, it's great to see you!")
end

# ╔═╡ 79e8ba8a-ac9e-11ed-37fb-51265e8e869f
md"""Now let's use `for` loops to create some addition tables, where the value of every entry is the sum of its row and column indices.

Note that we iterate over this array via column-major loops in order to get the best performance. More information about fast indexing of multidimensional arrays inside nested loops can be found at https://docs.julialang.org/en/v1/manual/performance-tips/#Access-arrays-in-memory-order,-along-columns-1

First, we initialize an array with zeros.
"""

# ╔═╡ 5ac56042-669f-4133-997c-57cc40bc4b47
m, n = 5, 5

# ╔═╡ a410116a-b8d7-4a1b-861d-7723438152d4
A = fill(0, (m, n))

# ╔═╡ 24179099-e858-479d-9085-ffe31a8cdc28
for j in 1:n
    for i in 1:m
        A[i, j] = i + j
    end
end

# ╔═╡ 76e32e6e-dbf6-4f66-bd72-3fa96d42fdb2
A

# ╔═╡ 79e8babc-ac9e-11ed-0972-c1336a888226
md"""Here's some syntactic sugar for the same nested `for` loop
"""

# ╔═╡ 79e8bac6-ac9e-11ed-3f1f-d9e32e6216f7
B = fill(0, (m, n))

# ╔═╡ b0e32437-1275-432a-aab1-a0f338108d57
for j in 1:n, i in 1:m
    B[i, j] = i + j
end

# ╔═╡ 391e0efd-576e-4690-a45f-a96c086d4cdf
B

# ╔═╡ 79e8bae4-ac9e-11ed-2a15-1f835678708e
md"""The more "Julia" way to create this addition table would have been with an *array comprehension*.
"""

# ╔═╡ 79e8baf0-ac9e-11ed-0cb0-994efed0d348
C = [i + j for i in 1:m, j in 1:n]

# ╔═╡ 79e8baf8-ac9e-11ed-0494-f3ba608c3d48
md"""### Exercises

#### 4.1 
Loop over integers between 1 and 100 and print their squares.
"""

# ╔═╡ 79e8bb0c-ac9e-11ed-39ea-9dce8ee1139a


# ╔═╡ 79e8bb16-ac9e-11ed-1dad-b1b96a3fb807
md"""#### 4.2 
Add to the code above a bit to create a dictionary, `squares` that holds integers and their squares as key, value pairs such that

```julia
squares[10] == 100
```
"""

# ╔═╡ 79e8bb34-ac9e-11ed-3f5c-a7b1d62d98a5


# ╔═╡ 87af2433-b229-40e0-8aba-0b69f6633495
@assert squares[10] == 100

# ╔═╡ 5870b51b-45c7-423b-a401-224419e21154
@assert squares[11] == 121

# ╔═╡ 79e8bb48-ac9e-11ed-1c57-276ad704e41a
md"""#### 4.3 
Use an array comprehension to create an an array `squares_arr` that stores the squares for all integers between 1 and 100.
"""

# ╔═╡ 79e8bb54-ac9e-11ed-30f5-8f2c19e56f9e


# ╔═╡ e0cdf3fd-7012-4302-8dc7-591bdd809802
@assert length(squares_arr) == 100

# ╔═╡ 0e1e5c56-4144-45de-9e63-f3c53c1517e8
@assert sum(squares_arr) == 338350

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
# ╟─79e8ba12-ac9e-11ed-1b62-b3d448fe3fa8
# ╠═dc45316a-58da-4acd-9fc5-e05bad0b1dcc
# ╠═868d6fc2-9b9c-4d66-92f0-eee60f5f1953
# ╠═225d8e0f-c1f4-4578-99c1-3e2f2225ca2e
# ╠═8305bf8b-a736-4db1-9ad1-0c6b8e175023
# ╠═d92e5eec-e3da-4b79-b544-e07691ade039
# ╟─79e8ba62-ac9e-11ed-1980-5956b9f8df78
# ╠═79e8ba76-ac9e-11ed-2c7a-1f0044f0b195
# ╠═33c0f45a-3e39-459d-9b71-c2bc344a76e2
# ╟─79e8ba8a-ac9e-11ed-37fb-51265e8e869f
# ╠═5ac56042-669f-4133-997c-57cc40bc4b47
# ╠═a410116a-b8d7-4a1b-861d-7723438152d4
# ╠═24179099-e858-479d-9085-ffe31a8cdc28
# ╠═76e32e6e-dbf6-4f66-bd72-3fa96d42fdb2
# ╟─79e8babc-ac9e-11ed-0972-c1336a888226
# ╠═79e8bac6-ac9e-11ed-3f1f-d9e32e6216f7
# ╠═b0e32437-1275-432a-aab1-a0f338108d57
# ╠═391e0efd-576e-4690-a45f-a96c086d4cdf
# ╟─79e8bae4-ac9e-11ed-2a15-1f835678708e
# ╠═79e8baf0-ac9e-11ed-0cb0-994efed0d348
# ╟─79e8baf8-ac9e-11ed-0494-f3ba608c3d48
# ╠═79e8bb0c-ac9e-11ed-39ea-9dce8ee1139a
# ╟─79e8bb16-ac9e-11ed-1dad-b1b96a3fb807
# ╠═79e8bb34-ac9e-11ed-3f5c-a7b1d62d98a5
# ╠═87af2433-b229-40e0-8aba-0b69f6633495
# ╠═5870b51b-45c7-423b-a401-224419e21154
# ╟─79e8bb48-ac9e-11ed-1c57-276ad704e41a
# ╠═79e8bb54-ac9e-11ed-30f5-8f2c19e56f9e
# ╠═e0cdf3fd-7012-4302-8dc7-591bdd809802
# ╠═0e1e5c56-4144-45de-9e63-f3c53c1517e8
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
