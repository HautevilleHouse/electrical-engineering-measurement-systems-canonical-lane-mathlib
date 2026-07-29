import ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MeasurementSystem where
  carrier : Type
  topology : TopologicalSpace carrier

structure MeasurementAdmittedObject where
  system : MeasurementSystem
  calibrated : Prop
  traceable : Prop
  accuracyModel : Type
  uncertaintyModel : Type
  meetsSpecification : Prop
  conclusion : meetsSpecification

structure MeasurementEndgameState where
  object : MeasurementAdmittedObject

def MeasurementWitnessClosed (O : MeasurementAdmittedObject) : Prop :=
  O.meetsSpecification

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse