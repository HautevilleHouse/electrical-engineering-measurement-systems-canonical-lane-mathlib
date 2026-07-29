import ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure AdmissibleClass where
  object : MeasurementAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MeasurementWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse