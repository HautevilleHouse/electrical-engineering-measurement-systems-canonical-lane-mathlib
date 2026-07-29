import HautevilleHouse.ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.MeasurementGateLemmas

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

def ConstrainedMeasurementClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_measurement_endgame (A : AdmissibleClass) : ConstrainedMeasurementClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse