import HautevilleHouse.ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.MeasurementStandards

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

structure SensorFusion {M : MeasurementSystem} {C : MeasurementChain M} {P : CalibrationPackage C} {E : ErrorPropagation P} {S : MeasurementStandards E} where
  sensorModel : Prop
  fusionAlgorithm : Prop
  timeAlignment : Prop
  redundancyManagement : Prop
  outputQuality : Prop

structure SensorFusionEvidence {M : MeasurementSystem} {C : MeasurementChain M} {P : CalibrationPackage C} {E : ErrorPropagation P} {S : MeasurementStandards E} (F : SensorFusion S) where
  sensorModelClosed : F.sensorModel
  fusionAlgorithmClosed : F.fusionAlgorithm
  timeAlignmentClosed : F.timeAlignment
  redundancyManagementClosed : F.redundancyManagement
  outputQualityClosed : F.outputQuality

def SensorFusionClosed {M : MeasurementSystem} {C : MeasurementChain M} {P : CalibrationPackage C} {E : ErrorPropagation P} {S : MeasurementStandards E} (F : SensorFusion S) : Prop :=
  F.sensorModel ∧ F.fusionAlgorithm ∧ F.timeAlignment ∧ F.redundancyManagement ∧ F.outputQuality

theorem sensor_fusion_closed_from_evidence {M : MeasurementSystem} {C : MeasurementChain M} {P : CalibrationPackage C} {E : ErrorPropagation P} {S : MeasurementStandards E} (F : SensorFusion S) (Ev : SensorFusionEvidence F) : SensorFusionClosed F :=
  And.intro Ev.sensorModelClosed (And.intro Ev.fusionAlgorithmClosed (And.intro Ev.timeAlignmentClosed (And.intro Ev.redundancyManagementClosed Ev.outputQualityClosed)))

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse
