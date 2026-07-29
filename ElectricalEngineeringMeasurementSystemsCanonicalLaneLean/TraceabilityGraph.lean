import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure TraceabilityGraph where
  nodes : List String
  edges : List (String × String)
  acyclic : Prop
  traceableToSI : Prop

structure TraceabilityGraphEvidence (T : TraceabilityGraph) where
  acyclicClosed : T.acyclic
  traceableToSIClosed : T.traceableToSI

def TraceabilityGraphClosed (T : TraceabilityGraph) : Prop :=
  T.acyclic ∧ T.traceableToSI

theorem traceability_graph_closed_from_evidence (T : TraceabilityGraph) (E : TraceabilityGraphEvidence T) :
    TraceabilityGraphClosed T := by
  exact And.intro E.acyclicClosed E.traceableToSIClosed

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse