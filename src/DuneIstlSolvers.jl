module DuneIstlSolvers

using CxxWrap
using duneistl_julia_jll
@wrapmodule duneistl_julia_jll.libduneistl

function __init__()
    @initcxx
end

include("documentation.jl")

export DuneIstlSolver

export print_matrix, print_rhs, 
       construct_matrix, 
       add_value_matrix, add_value_rhs, add_value_x,
       get_value_matrix, get_value_rhs, get_value_x,
       reset_matrix, reset_rhs, reset_x,
       set_solver_type, set_target_reduction, set_max_iter, set_gmres_restart, 
       set_preconditioner_type, set_preconditioner_relax, set_ilu_n, set_ilu_resort, 
       get_solver_type, get_target_reduction, get_max_iter, get_gmres_restart, 
       get_preconditioner_type, get_preconditioner_relax, get_ilu_n, get_ilu_resort, 
       solve, set_verbose, get_verbose, 
       get_solution, get_iterations, get_converged, get_reduction, get_conv_rate, get_elapsed

end
