import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure MeasurementProcedure where
  operator : Type
  equipment : Type
  environmentalConditions : Type
  repeatability : Prop
  reproducibility : Prop
  robustness : Prop

structure MeasurementProcedureEvidence (P : MeasurementProcedure) where
  repeatabilityClosed : P.repeatability
  reproducibilityClosed : P.reproducibility
  robustnessClosed : P.robustness

def MeasurementProcedureClosed (P : MeasurementProcedure) : Prop :=
  P.repeatability ∧ P.reproducibility ∧ P.robustness

theorem measurement_procedure_closed_from_evidence (P : MeasurementProcedure) (E : MeasurementProcedureEvidence P) :
    MeasurementProcedureClosed P := by
  exact And.intro E.repeatabilityClosed (And.intro E.reproducibilityClosed E.robustnessClosed)

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse