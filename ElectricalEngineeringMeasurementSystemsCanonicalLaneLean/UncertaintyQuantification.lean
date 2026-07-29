import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.MeasurementSystem

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure UncertaintyQuantificationPackage (M : MeasurementSystemPackage) where
  errorModel : Prop
  propagationLaw : Prop
  confidenceInterval : Prop
  coverageFactor : Prop

structure UncertaintyEvidence {M : MeasurementSystemPackage} (U : UncertaintyQuantificationPackage M) where
  errorModelClosed : U.errorModel
  propagationLawClosed : U.propagationLaw
  confidenceIntervalClosed : U.confidenceInterval
  coverageFactorClosed : U.coverageFactor

def UncertaintyQuantificationClosed {M : MeasurementSystemPackage} (U : UncertaintyQuantificationPackage M) : Prop :=
  U.errorModel ∧ U.propagationLaw ∧ U.confidenceInterval ∧ U.coverageFactor

theorem uncertainty_quantification_closed_from_evidence {M : MeasurementSystemPackage}
    (U : UncertaintyQuantificationPackage M) (E : UncertaintyEvidence U) :
    UncertaintyQuantificationClosed U := by
  exact And.intro E.errorModelClosed (And.intro E.propagationLawClosed
    (And.intro E.confidenceIntervalClosed E.coverageFactorClosed))

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse