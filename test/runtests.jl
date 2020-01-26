using Test, JuMP, NLPModels, NLPModelsJuMP, LinearAlgebra,
      SparseArrays, Printf

nlpmodels_path = joinpath(dirname(pathof(NLPModels)), "..", "test")
nlpmodels_problems_path = joinpath(nlpmodels_path, "problems")

for problem in [:brownden, :hs5, :hs6, :hs10, :hs11, :hs14, :hs30, :hs43, :mgh07, :mgh35]
  include(joinpath("problems", "$problem.jl"))
  if isfile(joinpath(nlpmodels_problems_path, "$problem.jl"))
    include(joinpath(nlpmodels_problems_path, "$problem.jl"))
  end
end

include("test_mpb.jl")
include("consistency.jl")
include("nls_consistency.jl")
include("test_mathprognlsmodel.jl")
include("test_view_subarray.jl")
