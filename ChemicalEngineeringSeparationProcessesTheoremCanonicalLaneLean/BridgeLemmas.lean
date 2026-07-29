import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ChemESepWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse
