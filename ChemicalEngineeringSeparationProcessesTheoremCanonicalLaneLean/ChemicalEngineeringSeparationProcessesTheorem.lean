import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

def ConstrainedSeparationClosure (A : AdmissibleSeparationClass) : Prop :=
  BridgeClosedSeparation A ∧ GateClosedSeparation A

theorem constrained_separation_endgame (A : AdmissibleSeparationClass) :
    ConstrainedSeparationClosure A := by
  exact And.intro (bridge_from_separation_admissible A) (gate_from_separation_admissible A)

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse