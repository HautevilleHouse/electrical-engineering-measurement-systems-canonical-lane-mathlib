import ElectricalEngineeringMeasurementSystemsCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ElectricalEngineeringMeasurementSystemsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MeasurementWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ElectricalEngineeringMeasurementSystemsCanonicalLaneLean
end HautevilleHouse