import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure SeparationProcessAdmittedObject where
  streamComponent : Type
  thermodynamicState : Type
  equilibriumCondition : Prop
  separationFeasible : Prop
  conclusion : separationFeasible

def SeparationProcessWitnessClosed (O : SeparationProcessAdmittedObject) : Prop :=
  O.separationFeasible

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse