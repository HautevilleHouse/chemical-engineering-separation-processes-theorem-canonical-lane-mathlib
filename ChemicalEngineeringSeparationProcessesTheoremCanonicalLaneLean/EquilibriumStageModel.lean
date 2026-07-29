import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean.SeparationProcessPackage

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure EquilibriumStageModel {P : SeparationProcessPackage} where
  stageNumber : Nat
  vaporPhaseComposition : Type
  liquidPhaseComposition : Type
  equilibriumRelation : Prop
  operatingLine : Prop
  stageEfficiency : Prop

structure EquilibriumStageEvidence {P : SeparationProcessPackage}
    (M : EquilibriumStageModel P) where
  equilibriumRelationClosed : M.equilibriumRelation
  operatingLineClosed : M.operatingLine
  stageEfficiencyClosed : M.stageEfficiency

def EquilibriumStageClosed {P : SeparationProcessPackage}
    (M : EquilibriumStageModel P) : Prop :=
  M.equilibriumRelation ∧ M.operatingLine ∧ M.stageEfficiency

theorem equilibrium_stage_closed_from_evidence {P : SeparationProcessPackage}
    (M : EquilibriumStageModel P) (E : EquilibriumStageEvidence M) :
    EquilibriumStageClosed M := by
  exact And.intro E.equilibriumRelationClosed
    (And.intro E.operatingLineClosed E.stageEfficiencyClosed)

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse