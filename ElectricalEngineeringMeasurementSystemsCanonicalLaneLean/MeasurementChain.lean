import HautevilleHouse.ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.MeasurementSystem

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure MeasurementChain (M : MeasurementSystem) where
  componentA : Type
  componentB : Type
  transferFunction : Prop
  impedanceMatching : Prop
  cascadedNoiseFigure : Prop
  chainGain : Prop

structure MeasurementChainEvidence {M : MeasurementSystem} (C : MeasurementChain M) where
  transferFunctionClosed : C.transferFunction
  impedanceMatchingClosed : C.impedanceMatching
  cascadedNoiseFigureClosed : C.cascadedNoiseFigure
  chainGainClosed : C.chainGain

def MeasurementChainClosed {M : MeasurementSystem} (C : MeasurementChain M) : Prop :=
  C.transferFunction ∧ C.impedanceMatching ∧ C.cascadedNoiseFigure ∧ C.chainGain

theorem measurement_chain_closed_from_evidence {M : MeasurementSystem} (C : MeasurementChain M) (E : MeasurementChainEvidence C) : MeasurementChainClosed C :=
  And.intro E.transferFunctionClosed (And.intro E.impedanceMatchingClosed (And.intro E.cascadedNoiseFigureClosed E.chainGainClosed))

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse
