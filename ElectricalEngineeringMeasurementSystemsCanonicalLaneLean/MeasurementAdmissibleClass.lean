import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure MeasurementAdmittedObject where
  system : Type u
  measurementFunction : system → ℝ
  accuracySpec : Prop
  precisionSpec : Prop
  conclusion : accuracySpec ∧ precisionSpec

structure AdmissibleClass where
  object : MeasurementAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.accuracySpec ∧ A.object.precisionSpec) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse