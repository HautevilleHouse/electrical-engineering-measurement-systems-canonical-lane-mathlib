import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.MeasurementSystem

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure ErrorBoundsPackage (M : MeasurementSystemPackage) where
  systematicError : Prop
  randomError : Prop
  errorCombination : Prop
  maximumPermissibleError : Prop

structure ErrorBoundsEvidence {M : MeasurementSystemPackage} (E : ErrorBoundsPackage M) where
  systematicErrorClosed : E.systematicError
  randomErrorClosed : E.randomError
  errorCombinationClosed : E.errorCombination
  maximumPermissibleErrorClosed : E.maximumPermissibleError

def ErrorBoundsClosed {M : MeasurementSystemPackage} (E : ErrorBoundsPackage M) : Prop :=
  E.systematicError ∧ E.randomError ∧ E.errorCombination ∧ E.maximumPermissibleError

theorem error_bounds_closed_from_evidence {M : MeasurementSystemPackage} (E : ErrorBoundsPackage M)
    (H : ErrorBoundsEvidence E) : ErrorBoundsClosed E := by
  exact And.intro H.systematicErrorClosed (And.intro H.randomErrorClosed
    (And.intro H.errorCombinationClosed H.maximumPermissibleErrorClosed))

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse