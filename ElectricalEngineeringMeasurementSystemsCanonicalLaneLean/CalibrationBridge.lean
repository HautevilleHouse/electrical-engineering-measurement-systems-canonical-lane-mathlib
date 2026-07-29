import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.MeasurementStandards

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure CalibrationProcedurePackage (P : MeasurementStandardsPackage) where
  calibrationMethod : Prop
  errorCorrectionModel : Prop
  calibrationCertificate : Prop
  uncertaintyReductionFactor : Prop

structure CalibrationProcedureEvidence {P : MeasurementStandardsPackage}
    (C : CalibrationProcedurePackage P) where
  calibrationMethodClosed : C.calibrationMethod
  errorCorrectionModelClosed : C.errorCorrectionModel
  calibrationCertificateClosed : C.calibrationCertificate
  uncertaintyReductionFactorClosed : C.uncertaintyReductionFactor

def CalibrationProcedureClosed {P : MeasurementStandardsPackage}
    (C : CalibrationProcedurePackage P) : Prop :=
  C.calibrationMethod ∧ C.errorCorrectionModel ∧ C.calibrationCertificate ∧ C.uncertaintyReductionFactor

theorem calibration_procedure_closed_from_evidence {P : MeasurementStandardsPackage}
    (C : CalibrationProcedurePackage P) (E : CalibrationProcedureEvidence C) :
    CalibrationProcedureClosed C := by
  exact And.intro E.calibrationMethodClosed
    (And.intro E.errorCorrectionModelClosed
      (And.intro E.calibrationCertificateClosed E.uncertaintyReductionFactorClosed))

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse