import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystems

structure MeasurementSystem where
  measurementRange : ℝ × ℝ
  resolution : ℝ
  accuracy : ℝ
  precision : ℝ
  bandwidth : ℝ

defaultMeasurementSystem : MeasurementSystem :=
  { measurementRange := (0.0, 10.0),
    resolution := 0.01,
    accuracy := 0.05,
    precision := 0.02,
    bandwidth := 100.0 }

end ElectricalEngineeringMeasurementSystems
end HautevilleHouse