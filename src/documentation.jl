@doc """
    print_matrix(solver::DuneIstlSolver)

Print the BCRS matrix in `solver`.

# Examples
```jldoctest
julia> using DuneIstlSolvers

julia> solver = DuneIstlSolver{Float64, Int32(2)}(3)

julia> print_matrix(solver);

```
""" print_matrix

@doc """
    print_rhs(solver::DuneIstlSolver)

Print the right-hand-side vector in `solver`.

# Examples
```jldoctest
julia> using DuneIstlSolvers

julia> solver = DuneIstlSolver{Float64, Int32(2)}(3)

julia> print_rhs(solver);

```
""" print_rhs


