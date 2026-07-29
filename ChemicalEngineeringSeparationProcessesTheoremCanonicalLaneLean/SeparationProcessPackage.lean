import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure SeparationProcessPackage where
  feedStream : Type u
  productStream : Type v
  rejectStream : Type w
  feedComposition : feedStream -> Type
  productComposition : productStream -> Type
  separationRatio : Prop
  massBalanceClosed : Prop
  energyBalanceClosed : Prop

structure SeparationProcessEvidence (P : SeparationProcessPackage) where
  separationRatioClosed : P.separationRatio
  massBalanceClosed : P.massBalanceClosed
  energyBalanceClosed : P.energyBalanceClosed

def SeparationProcessClosed (P : SeparationProcessPackage) : Prop :=
  P.separationRatio ∧ P.massBalanceClosed ∧ P.energyBalanceClosed

theorem separation_process_closed_from_evidence (P : SeparationProcessPackage)
    (E : SeparationProcessEvidence P) : SeparationProcessClosed P := by
  exact And.intro E.separationRatioClosed (And.intro E.massBalanceClosed E.energyBalanceClosed)

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse