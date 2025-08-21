module TuringPigeonsExamples

using Pigeons, DynamicPPL, LinearAlgebra

include("turing-galaxy.jl") 
provide_target(::Val{:galaxy}) = TuringLogPotential(GalaxyTuring())

provide_target(::Val{:unid_model}) = Pigeons.toy_turing_unid_target()

include("$(dirname(dirname(Base.pathof(Pigeons))))/test/supporting/turing_models.jl")
provide_target(::Val{:flip_mixture}) = TuringLogPotential(flip_mixture())
provide_target(::Val{:flip_model_modified}) = TuringLogPotential(flip_model_modified())

DynamicPPL.@model function model_with_vectors(dim)
    x ~ MvNormal(zeros(dim), I)
    y ~ MvNormal(zeros(dim), I)
end
provide_target(::Val{:iid_normal_10}) = TuringLogPotential(model_with_vectors(10))
provide_target(::Val{:iid_normal_1000}) = TuringLogPotential(model_with_vectors(1000))

end 