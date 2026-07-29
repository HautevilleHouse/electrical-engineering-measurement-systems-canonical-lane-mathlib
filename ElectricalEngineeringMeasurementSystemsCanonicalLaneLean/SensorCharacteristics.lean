import canonicalLaneMathlib.AdmissibleClass
import MeasurementSystem

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystems

structure SensorCharacteristics where
  transferFunction : ℝ → ℝ
  sensitivity : ℝ
  offset : ℝ
  nonlinearity : ℝ
  hysteresis : ℝ

structure SensorCharacteristicsEvidence (S : SensorCharacteristics) where
  sensitivityClosed : S.sensitivity > 0
  offsetClosed : True
  nonlinearityClosed : S.nonlinearity ≥ 0
  hysteresisClosed : S.hysteresis ≥ 0

def SensorCharacteristicsClosed (S : SensorCharacteristics) : Prop :=
  S.sensitivity > 0 ∧ S.nonlinearity ≥ 0 ∧ S.hysteresis ≥ 0

theorem sensor_characteristics_closed_from_evidence (S : SensorCharacteristics) (E : SensorCharacteristicsEvidence S) : SensorCharacteristicsClosed S := by
  exact And.intro E.sensitivityClosed (And.intro E.nonlinearityClosed E.hysteresisClosed)

end ElectricalEngineeringMeasurementSystems
end HautevilleHouse