### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ d48a88d2-4187-4bee-89e7-fefc2d99a8f1
md"""
# Data structures

Once we start working with many pieces of data at once, it will be convenient for us to store data in structures like arrays or dictionaries (rather than just relying on variables).

Types of data structures covered:
1. Tuples
2. Dictionaries
3. Arrays

As an overview, tuples and arrays are both ordered sequences of elements (so we can index into them). Dictionaries and arrays are both mutable.
We'll explain this more below!
"""

# ╔═╡ 6d139190-22ca-4967-ad7b-379edcb8309f
md"""
## Tuples

We can create a tuple by enclosing an ordered collection of elements in `( )`.

Syntax:
```julia
(item1, item2, ...)
```

"""

# ╔═╡ 1f1d35b6-318f-4325-a608-732b89cf2759
favoriteanimals = ("penguins", "cats", "sugargliders")

# ╔═╡ 514747e0-e03b-41fe-b036-721e3e03ec2c
md"""
We can index into this tuple,
"""

# ╔═╡ f2a43d3c-47b4-4d1a-af6f-33b5b2ee58cd
favoriteanimals[1]

# ╔═╡ d84f7745-9f70-4a4f-88c3-3b46b1415f76
md"""
but since tuples are immutable, we can't update it
"""

# ╔═╡ a5ed4e58-97eb-4602-948a-e9b7fe21ae52
favoriteanimals[1] = "otters"

# ╔═╡ 443cb686-1860-433a-aa86-cc72d915aa5c
md"""
## Now in 1.6: NamedTuples

As you might guess, `NamedTuple`s are just like `Tuple`s except that each element additionally has a name! They have a special syntax using `=` inside a tuple:

```julia
(name1 = item1, name2 = item2, ...)
```
"""

# ╔═╡ ac627a9c-0a94-4a49-ad9c-638cc212b6fa
myfavoriteanimals = (bird = "penguins", mammal = "cats", marsupial = "sugargliders")

# ╔═╡ 80ff14c6-3390-446c-9d57-78d5e214a1a8
md"""
Like regular `Tuples`, `NamedTuples` are ordered, so we can retrieve their elements via indexing:
"""

# ╔═╡ 47dd5749-8e93-4bb1-8a8c-722e6c060667
myfavoriteanimals[1]

# ╔═╡ 63773be0-c409-4fe0-85d9-f5baa12640a7
md"""
They also add the special ability to access values by their name:
"""

# ╔═╡ d9448f6f-5555-4437-939e-dc82fb0a1b6b
myfavoriteanimals.bird

# ╔═╡ 3b376a74-b7b7-4f91-8d76-6c5ff985e13c
md"""
## Dictionaries

If we have sets of data related to one another, we may choose to store that data in a dictionary. We can create a dictionary using the `Dict()` function, which we can initialize as an empty dictionary or one storing key, value pairs.

Syntax:
```julia
Dict(key1 => value1, key2 => value2, ...)
```

A good example is a contacts list, where we associate names with phone numbers.
"""

# ╔═╡ 25ef69d8-defa-43c5-ac04-749e67e4409d
myphonebook = Dict("Jenny" => "867-5309", "Ghostbusters" => "555-2368")

# ╔═╡ 66ace9cc-70b2-4295-9e3c-4965d9c257db
md"""
In this example, each name and number is a "key" and "value" pair. We can grab Jenny's number (a value) using the associated key
"""

# ╔═╡ b09ed031-9de2-4392-a6a6-6d8e708b919e
myphonebook["Jenny"]

# ╔═╡ f3153e36-788f-49f7-b0d4-a6b64a6ee156
md"""
We can add another entry to this dictionary as follows
"""

# ╔═╡ 8584ccc2-abb5-4c89-bed2-d2bc5748098d
myphonebook["Kramer"] = "555-FILK"

# ╔═╡ 88e77051-1d9a-4347-af34-b4547096de72
md"""
Let's check what our phonebook looks like now...
"""

# ╔═╡ 6edea85f-92f9-48db-8f36-a39460b28cb9
myphonebook

# ╔═╡ a932f756-1b62-43ce-9973-fdac7af16b50
md"""
We can delete Kramer from our contact list - and simultaneously grab his number - by using `pop!`
"""

# ╔═╡ 5cbacbc4-544f-4339-996e-09ff8474f640
pop!(myphonebook, "Kramer")

# ╔═╡ 1f77ca2a-c644-4371-9821-286cf9d8077b
myphonebook

# ╔═╡ 20ab688b-d8de-488a-9e4f-3779d47e5668
md"""
Unlike tuples and arrays, dictionaries are not ordered. So, we can't index into them.
"""

# ╔═╡ 32a289ee-85ca-4869-b73d-f89a7d0b27c3
myphonebook[1]

# ╔═╡ 97608e34-7dbc-40b4-b800-4a04251d5a20
md"""
In the example above, `julia` thinks you're trying to access a value associated with the key `1`.
"""

# ╔═╡ 6061f940-085b-4d13-8726-17e7aff9da2c
md"""
## Arrays

Unlike tuples, arrays are mutable. Unlike dictionaries, arrays contain ordered collections. <br>
We can create an array by enclosing this collection in `[ ]`.

Syntax:
```julia
[item1, item2, ...]
```


For example, we might create an array to keep track of my friends
"""

# ╔═╡ f6f75ab9-4faa-46ab-be2e-a449d6a9be6c
myfriends = ["Ted", "Robyn", "Barney", "Lily", "Marshall"]

# ╔═╡ 3de47623-f301-4e02-aa8f-fd6c8529313c
md"""
The `1` in `Array{String,1}` means this is a one dimensional vector.  An `Array{String,2}` would be a 2d matrix, etc.  The `String` is the type of each element.
"""

# ╔═╡ ff677537-a1f3-452a-bae0-892826bd9c1f
md"""
or to store a sequence of numbers
"""

# ╔═╡ 2213ceec-1f19-460a-a5fe-48e482d4fc06
fibonacci = [1, 1, 2, 3, 5, 8, 13]

# ╔═╡ 95e2e570-d992-4d9f-a1f3-9fa9b947f709
mixture = [1, 1, 2, 3, "Ted", "Robyn"]

# ╔═╡ 7fb7b3c0-7738-4a42-808d-8dc9ac387211
md"""
Once we have an array, we can grab individual pieces of data from inside that array by indexing into the array. For example, if we want the third friend listed in `myfriends`, we write
"""

# ╔═╡ 2f4ddd7f-73f0-465a-bc1b-2b8f63c6b4f0
myfriends[3]

# ╔═╡ 9a20bc27-1250-4cf5-a516-528262381f22
md"""
We can use indexing to edit an existing element of an array
"""

# ╔═╡ 3d409b7a-76d5-4cee-b930-c582bbf1a8e9
myfriends[3] = "Baby Bop"

# ╔═╡ c480a6a0-7daf-4875-bc27-3350a5a8a7a0
md"""
Yes, Julia is 1-based indexing, not 0-based like Python.  Wars are fought over lesser issues. I have a friend with the wisdom of Solomon who proposes settling this once and for all with ½ 😃
"""

# ╔═╡ df28deed-2706-4369-bff4-e2adb6e3bc93
md"""
We can also edit the array by using the `push!` and `pop!` functions. `push!` adds an element to the end of an array and `pop!` removes the last element of an array.

We can add another number to our fibonnaci sequence
"""

# ╔═╡ 1b71da81-d84b-4870-9bd7-44f25bbaf5ff
push!(fibonacci, 21)

# ╔═╡ c63f8c72-65bd-4b23-a742-cca297dac025
md"""
and then remove it
"""

# ╔═╡ 71fda91a-3792-46dd-a253-3c4d2745e0ee
pop!(fibonacci)

# ╔═╡ 15205adc-ae99-44eb-9398-e02ea4b4fba5
fibonacci

# ╔═╡ c4b5e7e4-64d9-4a23-b82f-ac63fa5fb428
md"""
So far I've given examples of only 1D arrays of scalars, but arrays can have an arbitrary number of dimensions and can also store other arrays. 
<br><br>
For example, the following are arrays of arrays:
"""

# ╔═╡ 585365b8-237e-4d00-a84b-4ad01a14daab
favorites = [["koobideh", "chocolate", "eggs"],["penguins", "cats", "sugargliders"]]

# ╔═╡ c7f3a446-f462-4f72-8d2f-4856ec3ced48
numbers = [[1, 2, 3], [4, 5], [6, 7, 8, 9]]

# ╔═╡ 78577bdb-3ef3-4d1f-be96-14d39788f10f
md"""
Below are examples of 2D and 3D arrays populated with random values.
"""

# ╔═╡ 4a4d16bf-f17d-4c1e-a6c1-f0d3b2f84f98
rand(4, 3)

# ╔═╡ 0769efac-1b0a-4564-9b88-1175fab50e96
rand(4, 3, 2)

# ╔═╡ 2c52f701-6506-4a28-86e3-35e19414c449
md"""
Be careful when you want to copy arrays!
"""

# ╔═╡ 24589d71-ff88-4992-9a50-6fc94b8c037e
fibonacci

# ╔═╡ 04928525-92fe-4ebc-8ff8-f8408d865367
somenumbers = fibonacci

# ╔═╡ 2d2fcfb9-4fff-451b-9632-f57356f25f4a
somenumbers[1] = 404

# ╔═╡ a5b8e2ad-281e-4e32-ad18-bb3e0aa3c0b2
fibonacci

# ╔═╡ 17ca12d2-294f-4618-b3e4-a80b00846dfc
md"""
Editing `somenumbers` caused `fibonacci` to get updated as well!

In the above example, we didn't actually make a copy of `fibonacci`. We just created a new way to access the entries in the array bound to `fibonacci`.

If we'd like to make a copy of the array bound to `fibonacci`, we can use the `copy` function.
"""

# ╔═╡ 169365c9-e288-4b90-9ea2-17709bb2976b
# First, restore fibonacci
fibonacci[1] = 1

# ╔═╡ 7496f2fa-3607-4b0d-8812-3faa5acc42ab
fibonacci

# ╔═╡ a1ad9d43-d3d9-4d66-9f0d-a829e34e6b05
somemorenumbers = copy(fibonacci)

# ╔═╡ 3a0c11fa-b0ef-4bc0-8749-c5df5e3f796b
somemorenumbers[1] = 404

# ╔═╡ b7163a0a-a01a-4cde-8d16-9c4ab8c3b586
fibonacci

# ╔═╡ c6ba5766-49ed-4751-b900-c29df3c82a42
md"""
In this last example, fibonacci was not updated. Therefore we see that the arrays bound to `somemorenumbers` and `fibonacci` are distinct.
"""

# ╔═╡ 8f939908-d309-4ad8-bddd-46db9919e017
md"""
### Exercises

#### 3.1 
Create an array, `a_ray`, with the following code:

```julia
a_ray = [1, 2, 3]
```

Add the number `4` to the end of this array and then remove it.
"""

# ╔═╡ 959add24-c963-4010-91db-cc000869540c


# ╔═╡ ab924c74-df09-4160-bcdb-08b029147d89
@assert a_ray == [1, 2, 3]

# ╔═╡ c065c109-8136-47b1-a848-8cddfc516b68
md"""
#### 3.2 
Try to add "Emergency" as key to `myphonebook` with the value `string(911)` with the following code
```julia
myphonebook["Emergency"] = 911
```

Why doesn't this work?
"""

# ╔═╡ 6bc6e41b-94f4-4b1f-a60e-b520896ea0da


# ╔═╡ 0193939f-5442-460b-8fb9-a744d8e90601
md"""
#### 3.3 
Create a new dictionary called `flexible_phonebook` that has Jenny's number stored as an integer and Ghostbusters' number stored as a string with the following code

```julia
flexible_phonebook = Dict("Jenny" => 8675309, "Ghostbusters" => "555-2368")
```
"""

# ╔═╡ 303316cf-509b-482e-97d8-5a52a94a17ed


# ╔═╡ 0cd77108-7bd3-4a9e-9af0-01621a5646c0
@assert flexible_phonebook == Dict("Jenny" => 8675309, "Ghostbusters" => "555-2368")

# ╔═╡ 47dc076c-70d2-444d-ba60-33a0cbeaeaee
md"""
#### 3.4 
Add the key "Emergency" with the value `911` (an integer) to `flexible_phonebook`.
"""

# ╔═╡ 3866455f-1f36-424e-aa54-383067e5b353


# ╔═╡ 5192b8e6-e96c-4fdb-bc17-1cadca214b93
@assert haskey(flexible_phonebook, "Emergency")

# ╔═╡ f11b6177-6ba6-4927-bf26-0d94bcf26b9d
@assert flexible_phonebook["Emergency"] == 911

# ╔═╡ 129504c3-4fc3-4e14-9cb6-52ae145f4c75
md"""
#### 3.5 
Why can we add an integer as a value to `flexible_phonebook` but not `myphonebook`? How could we have initialized `myphonebook` so that it would accept integers as values? (hint: try using [Julia's documentation for dictionaries](https://docs.julialang.org/en/v1/base/collections/#Dictionaries))
"""

# ╔═╡ 5b94e5cb-e791-4a56-b0be-52e635455af5


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
# ╟─d48a88d2-4187-4bee-89e7-fefc2d99a8f1
# ╟─6d139190-22ca-4967-ad7b-379edcb8309f
# ╠═1f1d35b6-318f-4325-a608-732b89cf2759
# ╟─514747e0-e03b-41fe-b036-721e3e03ec2c
# ╠═f2a43d3c-47b4-4d1a-af6f-33b5b2ee58cd
# ╟─d84f7745-9f70-4a4f-88c3-3b46b1415f76
# ╠═a5ed4e58-97eb-4602-948a-e9b7fe21ae52
# ╟─443cb686-1860-433a-aa86-cc72d915aa5c
# ╠═ac627a9c-0a94-4a49-ad9c-638cc212b6fa
# ╟─80ff14c6-3390-446c-9d57-78d5e214a1a8
# ╠═47dd5749-8e93-4bb1-8a8c-722e6c060667
# ╟─63773be0-c409-4fe0-85d9-f5baa12640a7
# ╠═d9448f6f-5555-4437-939e-dc82fb0a1b6b
# ╟─3b376a74-b7b7-4f91-8d76-6c5ff985e13c
# ╠═25ef69d8-defa-43c5-ac04-749e67e4409d
# ╟─66ace9cc-70b2-4295-9e3c-4965d9c257db
# ╠═b09ed031-9de2-4392-a6a6-6d8e708b919e
# ╟─f3153e36-788f-49f7-b0d4-a6b64a6ee156
# ╠═8584ccc2-abb5-4c89-bed2-d2bc5748098d
# ╟─88e77051-1d9a-4347-af34-b4547096de72
# ╠═6edea85f-92f9-48db-8f36-a39460b28cb9
# ╟─a932f756-1b62-43ce-9973-fdac7af16b50
# ╠═5cbacbc4-544f-4339-996e-09ff8474f640
# ╠═1f77ca2a-c644-4371-9821-286cf9d8077b
# ╟─20ab688b-d8de-488a-9e4f-3779d47e5668
# ╠═32a289ee-85ca-4869-b73d-f89a7d0b27c3
# ╟─97608e34-7dbc-40b4-b800-4a04251d5a20
# ╟─6061f940-085b-4d13-8726-17e7aff9da2c
# ╠═f6f75ab9-4faa-46ab-be2e-a449d6a9be6c
# ╟─3de47623-f301-4e02-aa8f-fd6c8529313c
# ╟─ff677537-a1f3-452a-bae0-892826bd9c1f
# ╠═2213ceec-1f19-460a-a5fe-48e482d4fc06
# ╠═95e2e570-d992-4d9f-a1f3-9fa9b947f709
# ╟─7fb7b3c0-7738-4a42-808d-8dc9ac387211
# ╠═2f4ddd7f-73f0-465a-bc1b-2b8f63c6b4f0
# ╟─9a20bc27-1250-4cf5-a516-528262381f22
# ╠═3d409b7a-76d5-4cee-b930-c582bbf1a8e9
# ╟─c480a6a0-7daf-4875-bc27-3350a5a8a7a0
# ╟─df28deed-2706-4369-bff4-e2adb6e3bc93
# ╠═1b71da81-d84b-4870-9bd7-44f25bbaf5ff
# ╟─c63f8c72-65bd-4b23-a742-cca297dac025
# ╠═71fda91a-3792-46dd-a253-3c4d2745e0ee
# ╠═15205adc-ae99-44eb-9398-e02ea4b4fba5
# ╟─c4b5e7e4-64d9-4a23-b82f-ac63fa5fb428
# ╠═585365b8-237e-4d00-a84b-4ad01a14daab
# ╠═c7f3a446-f462-4f72-8d2f-4856ec3ced48
# ╟─78577bdb-3ef3-4d1f-be96-14d39788f10f
# ╠═4a4d16bf-f17d-4c1e-a6c1-f0d3b2f84f98
# ╠═0769efac-1b0a-4564-9b88-1175fab50e96
# ╟─2c52f701-6506-4a28-86e3-35e19414c449
# ╠═24589d71-ff88-4992-9a50-6fc94b8c037e
# ╠═04928525-92fe-4ebc-8ff8-f8408d865367
# ╠═2d2fcfb9-4fff-451b-9632-f57356f25f4a
# ╠═a5b8e2ad-281e-4e32-ad18-bb3e0aa3c0b2
# ╟─17ca12d2-294f-4618-b3e4-a80b00846dfc
# ╠═169365c9-e288-4b90-9ea2-17709bb2976b
# ╠═7496f2fa-3607-4b0d-8812-3faa5acc42ab
# ╠═a1ad9d43-d3d9-4d66-9f0d-a829e34e6b05
# ╠═3a0c11fa-b0ef-4bc0-8749-c5df5e3f796b
# ╠═b7163a0a-a01a-4cde-8d16-9c4ab8c3b586
# ╟─c6ba5766-49ed-4751-b900-c29df3c82a42
# ╟─8f939908-d309-4ad8-bddd-46db9919e017
# ╠═959add24-c963-4010-91db-cc000869540c
# ╠═ab924c74-df09-4160-bcdb-08b029147d89
# ╟─c065c109-8136-47b1-a848-8cddfc516b68
# ╠═6bc6e41b-94f4-4b1f-a60e-b520896ea0da
# ╟─0193939f-5442-460b-8fb9-a744d8e90601
# ╠═303316cf-509b-482e-97d8-5a52a94a17ed
# ╠═0cd77108-7bd3-4a9e-9af0-01621a5646c0
# ╟─47dc076c-70d2-444d-ba60-33a0cbeaeaee
# ╠═3866455f-1f36-424e-aa54-383067e5b353
# ╠═5192b8e6-e96c-4fdb-bc17-1cadca214b93
# ╠═f11b6177-6ba6-4927-bf26-0d94bcf26b9d
# ╟─129504c3-4fc3-4e14-9cb6-52ae145f4c75
# ╠═5b94e5cb-e791-4a56-b0be-52e635455af5
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
