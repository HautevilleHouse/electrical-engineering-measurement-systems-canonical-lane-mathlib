import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure UncertaintyBudget where
  sourceTerms : List (String × Prop)
  combinedUncertainty : Prop
  coverageFactor : Prop
  expandedUncertainty : Prop

structure UncertaintyBudgetEvidence (U : UncertaintyBudget) where
  combinedUncertaintyClosed : U.combinedUncertainty
  coverageFactorClosed : U.coverageFactor
  expandedUncertaintyClosed : U.expandedUncertainty

def UncertaintyBudgetClosed (U : UncertaintyBudget) : Prop :=
  U.combinedUncertainty ∧ U.coverageFactor ∧ U.expandedUncertainty

theorem uncertainty_budget_closed_from_evidence (U : UncertaintyBudget) (E : UncertaintyBudgetEvidence U) :
    UncertaintyBudgetClosed U := by
  exact And.intro E.combinedUncertaintyClosed (And.intro E.coverageFactorClosed E.expandedUncertaintyClosed)

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse