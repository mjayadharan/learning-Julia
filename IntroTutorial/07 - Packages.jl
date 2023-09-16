### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ b1665153-f647-430a-88bb-99002243992f
using Pkg

# ╔═╡ ccf51fd5-1c9d-45da-8326-8f7aba500735
Pkg.add("Example")

# ╔═╡ 79ee6b04-ac9e-11ed-0a0f-2bce13e1f594
Pkg.add("Colors")

# ╔═╡ 79ee6aca-ac9e-11ed-2ebc-25bf0143d6fb
using Example

# ╔═╡ 79ee6b10-ac9e-11ed-168e-f3a05fa4ed59
using Colors

# ╔═╡ 79ee6a84-ac9e-11ed-0d63-21e0f8dc7920
md"""# Packages

Julia has over 8000 registered packages, making packages a huge part of the Julia ecosystem.

Even so, the package ecosystem still has some growing to do. Notably, we have first class function calls  to other languages, providing excellent foreign function interfaces. We can easily call into python or R, for example, with `PyCall` or `Rcall`.

This means that you don't have to wait until the Julia ecosystem is fully mature, and that moving to Julia doesn't mean you have to give up your favorite package/library from another language! 

To see all available packages, check out

https://julialang.org/packages/

For now, let's learn how to use a package.
"""

# ╔═╡ 79ee6aa0-ac9e-11ed-35a5-cdf8e5cf4836
md"""The first time you use a package on a given Julia installation, you need to use the package manager to explicitly add it:
"""

# ╔═╡ 79ee6ac0-ac9e-11ed-1bf3-bdad8114fa42
md"""Every time you use Julia (start a new session at the REPL, or open a notebook for the first time, for example), you load the package with the `using` keyword
"""

# ╔═╡ 79ee6ae8-ac9e-11ed-27ef-d5cec13bdcc6
md"""In the source code of `Example.jl` at
https://github.com/JuliaLang/Example.jl/blob/master/src/Example.jl
we see the following function declared

```
hello(who::String) = "Hello, $who"
```

Having loaded `Example`, we should now be able to call `hello`
"""

# ╔═╡ 79ee6af2-ac9e-11ed-3fd7-39f50a76cb61
hello("it's me. I was wondering if after all these years you'd like to meet.")

# ╔═╡ 79ee6afc-ac9e-11ed-35ad-093936f8c8e2
md"""Now let's play with the Colors package
"""

# ╔═╡ 79ee6b1a-ac9e-11ed-39d3-dd3a718b7db9
md"""Let's create a palette of 100 different colors
"""

# ╔═╡ 79ee6b24-ac9e-11ed-1b0e-ab570541ea2a
palette = distinguishable_colors(100)

# ╔═╡ 79ee6b2e-ac9e-11ed-330f-7fd0343ae8c6
md"""and then we can create a randomly checkered matrix using the `rand` command
"""

# ╔═╡ 79ee6b38-ac9e-11ed-2b58-53b4e7d8508e
rand(palette, 3, 3)

# ╔═╡ 79ee6b42-ac9e-11ed-3478-1988c856c708
md"""In the next notebook, we'll use a new package to plot datasets.
"""

# ╔═╡ 79ee6b4c-ac9e-11ed-2100-2f9cfcdb3b4d
md"""### Exercises

#### 7.1 
Load the Primes package (source code at https://github.com/JuliaMath/Primes.jl ).
"""

# ╔═╡ 79ee6b56-ac9e-11ed-049c-01add4ce1260


# ╔═╡ 79ee6b60-ac9e-11ed-208b-0f420bb184c9
@assert @isdefined Primes

# ╔═╡ 79ee6b6a-ac9e-11ed-3784-d7c71e496cdf
md"""#### 7.2 
Verify that you can now use the function `primes` to grab all prime numbers under 1,000,000 and store it in variable `primes_list`
"""

# ╔═╡ 79ee6b6a-ac9e-11ed-2cc9-d787ea5d0787


# ╔═╡ 79ee6b76-ac9e-11ed-0fce-3bd9f477ab53
@assert primes_list == primes(1000000)

# ╔═╡ Cell order:
# ╟─79ee6a84-ac9e-11ed-0d63-21e0f8dc7920
# ╟─79ee6aa0-ac9e-11ed-35a5-cdf8e5cf4836
# ╠═b1665153-f647-430a-88bb-99002243992f
# ╠═ccf51fd5-1c9d-45da-8326-8f7aba500735
# ╟─79ee6ac0-ac9e-11ed-1bf3-bdad8114fa42
# ╠═79ee6aca-ac9e-11ed-2ebc-25bf0143d6fb
# ╟─79ee6ae8-ac9e-11ed-27ef-d5cec13bdcc6
# ╠═79ee6af2-ac9e-11ed-3fd7-39f50a76cb61
# ╟─79ee6afc-ac9e-11ed-35ad-093936f8c8e2
# ╠═79ee6b04-ac9e-11ed-0a0f-2bce13e1f594
# ╠═79ee6b10-ac9e-11ed-168e-f3a05fa4ed59
# ╟─79ee6b1a-ac9e-11ed-39d3-dd3a718b7db9
# ╠═79ee6b24-ac9e-11ed-1b0e-ab570541ea2a
# ╟─79ee6b2e-ac9e-11ed-330f-7fd0343ae8c6
# ╠═79ee6b38-ac9e-11ed-2b58-53b4e7d8508e
# ╟─79ee6b42-ac9e-11ed-3478-1988c856c708
# ╟─79ee6b4c-ac9e-11ed-2100-2f9cfcdb3b4d
# ╠═79ee6b56-ac9e-11ed-049c-01add4ce1260
# ╠═79ee6b60-ac9e-11ed-208b-0f420bb184c9
# ╟─79ee6b6a-ac9e-11ed-3784-d7c71e496cdf
# ╠═79ee6b6a-ac9e-11ed-2cc9-d787ea5d0787
# ╠═79ee6b76-ac9e-11ed-0fce-3bd9f477ab53
