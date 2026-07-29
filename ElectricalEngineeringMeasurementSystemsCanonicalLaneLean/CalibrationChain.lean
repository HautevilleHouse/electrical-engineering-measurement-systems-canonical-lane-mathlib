import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure CalibrationChain where
  primaryStandard : MeasurementSystemPackage
  intermediateStandards : List MeasurementSystemPackage
  transferStandard : MeasurementSystemPackage
  chainComplete : Prop
  uncertaintyPropagation : Prop

structure CalibrationChainEvidence (C : CalibrationChain) where
  chainCompleteClosed : C.chainComplete
  uncertaintyPropagationClosed : C.uncertaintyPropagation

def CalibrationChainClosed (C : CalibrationChain) : Prop :=
  C.chainComplete ∧ C.uncertaintyPropagation

theorem calibration_chain_closed_from_evidence (C : CalibrationChain) (E : CalibrationChainEvidence C) :
    CalibrationChainClosed C := by
  exact And.intro E.chainCompleteClosed E.uncertaintyPropagationClosed

def MeasurementWitnessClosed (O : MeasurementAdmittedObject) : Prop :=
  O.calibrationChainClosed

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse