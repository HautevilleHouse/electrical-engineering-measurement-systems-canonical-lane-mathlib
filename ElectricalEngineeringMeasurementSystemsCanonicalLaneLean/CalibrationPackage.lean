import HautevilleHouse.ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.MeasurementChain

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure CalibrationPackage {M : MeasurementSystem} {C : MeasurementChain M} where
  referenceStandard : Prop
  traceability : Prop
  uncertaintyBudget : Prop
  calibrationInterval : Prop
  adjustmentProcedure : Prop

structure CalibrationEvidence {M : MeasurementSystem} {C : MeasurementChain M} (P : CalibrationPackage C) where
  referenceStandardClosed : P.referenceStandard
  traceabilityClosed : P.traceability
  uncertaintyBudgetClosed : P.uncertaintyBudget
  calibrationIntervalClosed : P.calibrationInterval
  adjustmentProcedureClosed : P.adjustmentProcedure

def CalibrationClosed {M : MeasurementSystem} {C : MeasurementChain M} (P : CalibrationPackage C) : Prop :=
  P.referenceStandard ∧ P.traceability ∧ P.uncertaintyBudget ∧ P.calibrationInterval ∧ P.adjustmentProcedure

theorem calibration_closed_from_evidence {M : MeasurementSystem} {C : MeasurementChain M} (P : CalibrationPackage C) (E : CalibrationEvidence P) : CalibrationClosed P :=
  And.intro E.referenceStandardClosed (And.intro E.traceabilityClosed (And.intro E.uncertaintyBudgetClosed (And.intro E.calibrationIntervalClosed E.adjustmentProcedureClosed)))

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse
