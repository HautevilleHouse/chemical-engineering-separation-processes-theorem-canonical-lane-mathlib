import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure SeparationAdmissibleClass where
  object : SeparationAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def separationBridgeClosed (A : SeparationAdmissibleClass) : Prop :=
  A.object.separationObjectiveSatisfied

def separationGateClosed (A : SeparationAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem separation_bridge_from_admissible_class (A : SeparationAdmissibleClass) :
    separationBridgeClosed A := by
  exact A.object.separationObjectiveSatisfiedTerm

theorem separation_gate_from_admissible_class (A : SeparationAdmissibleClass) :
    separationGateClosed A := by
  exact A.gateWitness

def ConstrainedSeparationClosure (A : SeparationAdmissibleClass) : Prop :=
  separationBridgeClosed A ∧ separationGateClosed A

theorem constrained_separation_endgame (A : SeparationAdmissibleClass) :
    ConstrainedSeparationClosure A := by
  exact And.intro (separation_bridge_from_admissible_class A) (separation_gate_from_admissible_class A)

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse