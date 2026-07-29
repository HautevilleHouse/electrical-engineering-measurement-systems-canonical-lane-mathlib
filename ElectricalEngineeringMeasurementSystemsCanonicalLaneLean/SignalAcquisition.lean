import ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.InstrumentCalibration

/-!
# Signal Acquisition Package
-/

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure SignalAcquisitionPackage {S : MeasurementStandardsPackage} {C : InstrumentCalibrationPackage S} where
  sensor : Type u
  signalConditioning : Prop
  analogToDigital : Prop
  samplingRate : Prop
  antiAliasingFilter : Prop

structure SignalAcquisitionEvidence {S : MeasurementStandardsPackage} {C : InstrumentCalibrationPackage S} (A : SignalAcquisitionPackage S C) where
  signalConditioningClosed : A.signalConditioning
  analogToDigitalClosed : A.analogToDigital
  samplingRateClosed : A.samplingRate
  antiAliasingFilterClosed : A.antiAliasingFilter

def SignalAcquisitionClosed {S : MeasurementStandardsPackage} {C : InstrumentCalibrationPackage S} (A : SignalAcquisitionPackage S C) : Prop :=
  A.signalConditioning ∧ A.analogToDigital ∧ A.samplingRate ∧ A.antiAliasingFilter

theorem signal_acquisition_closed_from_evidence {S : MeasurementStandardsPackage} {C : InstrumentCalibrationPackage S} (A : SignalAcquisitionPackage S C) (E : SignalAcquisitionEvidence A) : SignalAcquisitionClosed A := by
  exact And.intro E.signalConditioningClosed
    (And.intro E.analogToDigitalClosed
      (And.intro E.samplingRateClosed E.antiAliasingFilterClosed))

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse