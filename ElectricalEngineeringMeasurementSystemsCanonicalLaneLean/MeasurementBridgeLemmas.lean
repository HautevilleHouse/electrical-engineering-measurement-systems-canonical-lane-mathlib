import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.MeasurementAdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.accuracySpec ∧ A.object.precisionSpec

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse