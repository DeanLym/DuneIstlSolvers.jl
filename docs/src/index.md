# DuneIstlSolvers.jl

A Julia wrapper for using BCSR matrices, iterative solvers and preconditioners from the [ISTL (v2.7.0)](https://dune-project.org/modules/dune-istl/) (iterative solver template library) module of [DUNE (v2.7.0)](https://dune-project.org/) (the Distributed and Unified Numerics Environment). Documentation of `DUNE (v2.7.0)` is available [here](https://dune-project.org/doxygen/2.7.0/);

## Installation
`DuneIstlSolvers.jl` is unregistered for now. In addition, the dependent `JLL` package [`libduneistlsolver_jll.jl`](https://github.com/DeanLym/libduneistlsolver_jll.jl) is also unregistered.

Therefore, to install, we need to first manually add `libduneistlsolver_jll.jl`:

```julia
] add https://github.com/DeanLym/libduneistlsolver_jll.jl.git
```

Next, install `DuneIstlSolvers.jl` with

```julia
] add https://github.com/DeanLym/DuneIstlSolver.git
```

## Usage
```@example usage
using DuneIstlSolvers
## create a solver for 3x3 BCSR matrix with block size 2
n = 3
solver = DuneIstlSolver{Float64, Int32(2)}(n)
print_matrix(solver)
```

```@example usage
## add non-zero blocks to the BCSR matrix
row_size = Int32.([1, 1, 1])
nnz = sum(row_size)
BI = Int32.([1, 2, 3]) # one-based indexing
BJ = copy(BI)
construct_matrix(solver, nnz, row_size, BI, BJ)
print_matrix(solver)
```

```@example usage
## Add value to the BCSR matrix
V1 = [1.0, 2.0, 3.0]
add_value_matrix(solver, nnz, BI, BJ, 1, 1, V1)
add_value_matrix(solver, nnz, BI, BJ, 2, 2, V1)
print_matrix(solver)
```

```@example usage
## Add value to the RHS vector
V2 = [2.0, 4.0, 6.0]
add_value_rhs(solver, n, BI, 1, V2)
add_value_rhs(solver, n, BI, 2, V2)
print_rhs(solver)
```

```@example usage
## Get default settings for the iterative solver
println("Solver type: ", get_solver_type(solver))
println("Target reduction: ", get_target_reduction(solver))
println("Maximum iterations:", get_max_iter(solver))
```

```@example usage
## Get default settings for the preconditioner
println("Preconditioner type: ", get_preconditioner_type(solver))
println("Preconditioner relax: ", get_preconditioner_relax(solver))
println("ILU order: ", get_ilu_n(solver))
```

```@example usage
## Solve the linear equation
set_verbose(solver, 2)
solve(solver)
```

```@example usage
## Get solution
x = zeros(Float64, 2*n)
get_solution(solver, x)
x
```

```@example usage
## Get statistics
println("Number of iterations: ", get_iterations(solver))
println("Solver converged: ", get_converged(solver))
println("Final relative reduction: ", get_reduction(solver))
println("Time elapsed: ", get_elapsed(solver), "s")
```

## Instantiated matrices, solvers and preconditioners

For now, only a few matrices, solvers and preconditioners are supported. More will be added in future releases.

### Matrices
At the time being, BCRS matrices with 1) square block of size `1-4`, 2) element type of `float` and `double` are supported.

Dune Type    | Julia Usage
:---:   | :---:
`Dune::BCRSMatrix<Dune::FieldMatrix<double,1,1>>` | `DuneIstlSolver{Float64, Int32(1)}`
`Dune::BCRSMatrix<Dune::FieldMatrix<double,2,2>>` | `DuneIstlSolver{Float64, Int32(2)}`
`Dune::BCRSMatrix<Dune::FieldMatrix<double,3,3>>` | `DuneIstlSolver{Float64, Int32(3)}`
`Dune::BCRSMatrix<Dune::FieldMatrix<double,4,4>>` | `DuneIstlSolver{Float64, Int32(4)}`
`Dune::BCRSMatrix<Dune::FieldMatrix<float,1,1>>` | `DuneIstlSolver{Float32, Int32(1)}`
`Dune::BCRSMatrix<Dune::FieldMatrix<float,2,2>>` | `DuneIstlSolver{Float32, Int32(2)}`
`Dune::BCRSMatrix<Dune::FieldMatrix<float,3,3>>` | `DuneIstlSolver{Float32, Int32(3)}`
`Dune::BCRSMatrix<Dune::FieldMatrix<float,4,4>>` | `DuneIstlSolver{Float32, Int32(4)}`


### Solvers
At the time being, only the `BiCGSTAB` and `GMRes` solvers are supported.

Dune Type | Julia Usage
:---: | :---: 
`Dune::BiCGSTABSolver` | `set_solver_type(solver, "BiCGSTAB")` 
`Dune::RestartedGMResSolver` |`set_solver_type(solver, "RestartedGMRes")` 

### Preconditioners
At the time being, only the incomplete LU preconditioner is supported.

Dune Type    | Julia Usage
:---:   | :---: 
`Dune::SeqILU` | `set_preconditioner_type(solver, "ILU")` 


## Supported platforms
`DuneIstlSolvers.jl` can be used on platforms that are supported by [`libduneistlsolver_jll.jl`](https://github.com/DeanLym/libduneistlsolver_jll.jl).

