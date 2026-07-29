import canonicalLaneMathlib.AdmissibleClass
import MeasurementSystem
import SensorCharacteristics

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystems

structure Calibration where
  referenceStandard : ℝ
  measuredValue : ℝ
  correction : ℝ
  uncertaintyAfterCal : ℝ

structure CalibrationEvidence (C : Calibration) where
  correctionCalculated : C.correction = C.referenceStandard - C.measuredValue
  uncertaintyReduced : C.uncertaintyAfterCal < (0.1 : ℝ)

def CalibrationClosed (C : Calibration) : Prop :=
  C.correction = C.referenceStandard - C.measuredValue ∧ C.uncertaintyAfterCal < 0.1

theorem calibration_closed_from_evidence (C : Calibration) (E : CalibrationEvidence C) : CalibrationClosed C := by
  exact And.intro E.correctionCalculated E.uncertaintyReduced

end ElectricalEngineeringMeasurementSystems
end HautevilleHouse