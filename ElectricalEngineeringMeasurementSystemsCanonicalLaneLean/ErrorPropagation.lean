import HautevilleHouse.ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.CalibrationPackage

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure ErrorPropagation {M : MeasurementSystem} {C : MeasurementChain M} {P : CalibrationPackage C} where
  systematicError : Prop
  randomError : Prop
  errorCombinationRule : Prop
  sensitivityCoefficients : Prop
  expandedUncertainty : Prop

structure ErrorPropagationEvidence {M : MeasurementSystem} {C : MeasurementChain M} {P : CalibrationPackage C} (E : ErrorPropagation P) where
  systematicErrorClosed : E.systematicError
  randomErrorClosed : E.randomError
  errorCombinationRuleClosed : E.errorCombinationRule
  sensitivityCoefficientsClosed : E.sensitivityCoefficients
  expandedUncertaintyClosed : E.expandedUncertainty

def ErrorPropagationClosed {M : MeasurementSystem} {C : MeasurementChain M} {P : CalibrationPackage C} (E : ErrorPropagation P) : Prop :=
  E.systematicError ∧ E.randomError ∧ E.errorCombinationRule ∧ E.sensitivityCoefficients ∧ E.expandedUncertainty

theorem error_propagation_closed_from_evidence {M : MeasurementSystem} {C : MeasurementChain M} {P : CalibrationPackage C} (E : ErrorPropagation P) (Ev : ErrorPropagationEvidence E) : ErrorPropagationClosed E :=
  And.intro Ev.systematicErrorClosed (And.intro Ev.randomErrorClosed (And.intro Ev.errorCombinationRuleClosed (And.intro Ev.sensitivityCoefficientsClosed Ev.expandedUncertaintyClosed)))

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse
