module IndividualDisplacements

greet() = print("Get ready for IndividualDisplacements!")

using MeshArrays, OrdinaryDiffEq, StatsBase, DataFrames, Random

include("compute.jl")
include("read.jl")
include("examples.jl")
include("update_locations.jl")
include("data_wrangling.jl")

export VelComp!, VelComp, VelCopy, ReadDisplacements
export initialize_locations, read_uv_etc, postprocess_ODESolution


#include("plot_pyplot.jl")
#include("plot_makie.jl")
#export PlotBasic, PlotMapProj, PlotMakie

end # module
