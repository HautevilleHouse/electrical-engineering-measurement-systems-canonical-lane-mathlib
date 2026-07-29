import ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.AdmissibleClass

/-!
# Measurement Standards Package
-/

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure MeasurementStandardsPackage where
  referenceStandard : Type u
  calibrationChain : Prop
  uncertaintyBudget : Prop
  environmentalControl : Prop
  maintenanceInterval : Prop

structure MeasurementStandardsEvidence (S : MeasurementStandardsPackage) where
  calibrationChainClosed : S.calibrationChain
  uncertaintyBudgetClosed : S.uncertaintyBudget
  environmentalControlClosed : S.environmentalControl
  maintenanceIntervalClosed : S.maintenanceInterval

def MeasurementStandardsClosed (S : MeasurementStandardsPackage) : Prop :=
  S.calibrationChain ∧ S.uncertaintyBudget ∧ S.environmentalControl ∧ S.maintenanceInterval

theorem measurement_standards_closed_from_evidence (S : MeasurementStandardsPackage) (E : MeasurementStandardsEvidence S) : MeasurementStandardsClosed S := by
  exact And.intro E.calibrationChainClosed
    (And.intro E.uncertaintyBudgetClosed
      (And.intro E.environmentalControlClosed E.maintenanceIntervalClosed))

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse