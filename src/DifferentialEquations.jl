__precompile__()

@doc """
###DifferentialEquations

Developed by Chris Rackauckas for the solution of various differential equations, including stochastic differential equations (SDEs),
partial differential equations (PDEs), and stochastic partial differential equations (SPDEs). Included are tools for finite difference
and finite element methods, including functions for mesh generation and plotting.
""" ->
module DifferentialEquations

import PyPlot
using LaTeXStrings
using Plots
using Atom
using IterativeSolvers
import Base: length

"PdeProblem: A high level type which defines PDE problems via its internal functions"
abstract PdeProblem

include("fem/meshTools.jl")
include("fem/assemblyTools.jl")
include("fem/boundaryTools.jl")
include("fem/errorTools.jl")
include("general/pdeTools.jl")
include("general/plotTools.jl")
include("general/problemTools.jl")
include("fem/femSolvers.jl")

#Types
export PdeProblem, HeatProblem, PoissonProblem, FEMSolution, ConvergenceSimulation, FEMmesh

#Example Problems
export  heatProblemExample_moving, heatProblemExample_diffuse, heatProblemExample_pure,
        poissonProblemExample_wave

#Plot Functions
export  solplot_animation, solplot_appxvstrue, solplot_appx, showmesh, convplot,
        convplot_fullΔt, convplot_fullΔx, convplot_fullΔx, convplot_l2vsΔt, convplot_node2vsΔt,
        convplot_maxvsΔt, convplot_h1vsΔx, convplot_l2vsΔx, convplot_node2vsΔx, convplot_maxvsΔx

#General Functions
export conv_ests, appxTrue!, accumarray

#FEM Functions
export  assemblematrix, findboundary, setboundary, findbdtype, getL2error, quadpts, getH1error,
        gradu, gradbasis, fem_solvepoisson, fem_solveheat, quadfbasis, fem_squaremesh, CFLμ, CFLν,
        meshgrid, notime_squaremesh, parabolic_squaremesh

end # module
