import ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def measurementProjection : Projection MeasurementEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem measurement_projection_idempotent (x : MeasurementEndgameState) :
    measurementProjection.toFun (measurementProjection.toFun x) = measurementProjection.toFun x := by
  exact measurementProjection.idempotent x

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse