import ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.SignalAcquisition

/-!
# Measurement Uncertainty Package
-/

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure MeasurementUncertaintyPackage {S : MeasurementStandardsPackage} {C : InstrumentCalibrationPackage S} {A : SignalAcquisitionPackage S C} where
  typeAEvaluation : Prop
  typeBEvaluation : Prop
  correlationModel : Prop
  expandedUncertainty : Prop
  coverageFactor : Prop

structure MeasurementUncertaintyEvidence {S : MeasurementStandardsPackage} {C : InstrumentCalibrationPackage S} {A : SignalAcquisitionPackage S C} (U : MeasurementUncertaintyPackage S C A) where
  typeAEvaluationClosed : U.typeAEvaluation
  typeBEvaluationClosed : U.typeBEvaluation
  correlationModelClosed : U.correlationModel
  expandedUncertaintyClosed : U.expandedUncertainty
  coverageFactorClosed : U.coverageFactor

def MeasurementUncertaintyClosed {S : MeasurementStandardsPackage} {C : InstrumentCalibrationPackage S} {A : SignalAcquisitionPackage S C} (U : MeasurementUncertaintyPackage S C A) : Prop :=
  U.typeAEvaluation ∧ U.typeBEvaluation ∧ U.correlationModel ∧ U.expandedUncertainty ∧ U.coverageFactor

theorem measurement_uncertainty_closed_from_evidence {S : MeasurementStandardsPackage} {C : InstrumentCalibrationPackage S} {A : SignalAcquisitionPackage S C} (U : MeasurementUncertaintyPackage S C A) (E : MeasurementUncertaintyEvidence U) : MeasurementUncertaintyClosed U := by
  exact And.intro E.typeAEvaluationClosed
    (And.intro E.typeBEvaluationClosed
      (And.intro E.correlationModelClosed
        (And.intro E.expandedUncertaintyClosed E.coverageFactorClosed)))

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse