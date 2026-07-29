import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.MeasurementSystem

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure TraceabilityChainPackage (M : MeasurementSystemPackage) where
  chainLength : Prop
  nationalStandardLink : Prop
  uncertaintyProgression : Prop
  calibrationHierarchy : Prop

structure TraceabilityChainEvidence {M : MeasurementSystemPackage} (T : TraceabilityChainPackage M) where
  chainLengthClosed : T.chainLength
  nationalStandardLinkClosed : T.nationalStandardLink
  uncertaintyProgressionClosed : T.uncertaintyProgression
  calibrationHierarchyClosed : T.calibrationHierarchy

def TraceabilityChainClosed {M : MeasurementSystemPackage} (T : TraceabilityChainPackage M) : Prop :=
  T.chainLength ∧ T.nationalStandardLink ∧ T.uncertaintyProgression ∧ T.calibrationHierarchy

theorem traceability_chain_closed_from_evidence {M : MeasurementSystemPackage} (T : TraceabilityChainPackage M)
    (E : TraceabilityChainEvidence T) : TraceabilityChainClosed T := by
  exact And.intro E.chainLengthClosed (And.intro E.nationalStandardLinkClosed
    (And.intro E.uncertaintyProgressionClosed E.calibrationHierarchyClosed))

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse