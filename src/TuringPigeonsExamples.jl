module TuringPigeonsExamples

using Pigeons, DynamicPPL

include("turing-galaxy.jl") 
provide_target(::Val{:galaxy}) = TuringLogPotential(GalaxyTuring())

provide_target(::Val{:unid_model}) = Pigeons.toy_turing_target(2)

end 