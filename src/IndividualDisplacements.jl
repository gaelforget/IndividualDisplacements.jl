module IndividualDisplacements

using MeshArrays, OrdinaryDiffEq, StatsBase, DataFrames, Random
using NetCDF, Dates, CFTime, CSV, UnPack, CyclicArrays, MITgcmTools

include("compute.jl")
include("read.jl")
include("update_locations.jl")
include("data_wrangling.jl")
include("API.jl")

export Individuals, ∫!, set_up_𝑃, update_𝑃!, reset_lonlat!
export dxy_dt!, dxy_dt, dxyz_dt, dxy_dt_CyclicArray, dxy_dt_replay
export postprocess_lonlat, add_lonlat!, postprocess_xy
export initialize_gridded, initialize_lonlat, randn_lonlat
export read_flt, read_mds, read_drifters, read_uvetc

end # module
