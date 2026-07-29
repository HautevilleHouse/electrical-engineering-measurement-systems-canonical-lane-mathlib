import ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.MeasurementStandards

/-!
# Instrument Calibration Package
-/

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure InstrumentCalibrationPackage {S : MeasurementStandardsPackage} where
  instrumentUnderTest : Type u
  calibrationProcedure : Prop
  adjustmentMechanism : Prop
  verificationTest : Prop
  calibrationInterval : Prop

structure InstrumentCalibrationEvidence {S : MeasurementStandardsPackage} (C : InstrumentCalibrationPackage S) where
  calibrationProcedureClosed : C.calibrationProcedure
  adjustmentMechanismClosed : C.adjustmentMechanism
  verificationTestClosed : C.verificationTest
  calibrationIntervalClosed : C.calibrationInterval

def InstrumentCalibrationClosed {S : MeasurementStandardsPackage} (C : InstrumentCalibrationPackage S) : Prop :=
  C.calibrationProcedure ∧ C.adjustmentMechanism ∧ C.verificationTest ∧ C.calibrationInterval

theorem instrument_calibration_closed_from_evidence {S : MeasurementStandardsPackage} (C : InstrumentCalibrationPackage S) (E : InstrumentCalibrationEvidence C) : InstrumentCalibrationClosed C := by
  exact And.intro E.calibrationProcedureClosed
    (And.intro E.adjustmentMechanismClosed
      (And.intro E.verificationTestClosed E.calibrationIntervalClosed))

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse