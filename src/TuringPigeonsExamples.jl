module TuringPigeonsExamples

using Pigeons, DynamicPPL

provide_target(::Val{:unid_model}) = Pigeons.toy_turing_target(2)

end 