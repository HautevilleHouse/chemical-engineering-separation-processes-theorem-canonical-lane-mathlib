import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure SeparationFeed where
  componentCount : Nat
  composition : componentCount -> Float
  flowRate : Float
  temperature : Float
  pressure : Float

definition SeparationObjective (feed : SeparationFeed) (productSpec : SeparationFeed -> Prop) : Prop :=
  productSpec feed

structure SeparationAdmissibleObject where
  feed : SeparationFeed
  separationObjectiveSatisfied : Prop
  separationObjectiveSatisfiedTerm : separationObjectiveSatisfied

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse