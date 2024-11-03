module IndividualDisplacements

using MeshArrays, CyclicArrays, OrdinaryDiffEq, DataFrames, Random

include("API.jl")
include("compute.jl")
include("data_wrangling.jl")
include("toy_models.jl")
include("Downloads.jl")

DiffEqBase.solve!(I::Individuals,args...)=∫!(I::Individuals,args...)
DataFrames.groupby(I::Individuals,args...) = groupby(I.🔴,args...)
DataFrames.DataFrame(I::Individuals) = I.🔴

export Individuals, ∫!, solve!, DataFrame, groupby
export FlowFields, convert_to_FlowFields
export uvwArrays, uvArrays, uvwMeshArrays, uvMeshArrays
export dxdt!, dxy_dt_CyclicArray, dxy_dt_replay
export postprocess_MeshArray, add_lonlat!, postprocess_xy, interp_to_xy
export nearest_to_xy, randn_lonlat, interp_to_lonlat
export gcdist, stproj, stproj_inv

export random_flow_field, vortex_flow_field

__init__() = begin
    datadeps.__init__datadeps()
end

#flt_example_path = datadeps.getdata("flt_example")
#flt_example_download() = datadeps.getdata("flt_example")

abstract type AbstractIndividualDisplacementsDiagnostic <: Any end

Base.@kwdef struct InDiPlot <: AbstractIndividualDisplacementsDiagnostic
    path :: String = tempdir()
    name :: String = "unknown"
    options :: NamedTuple = NamedTuple()
    data :: NamedTuple = NamedTuple()
end

export InDiPlot

end # module
