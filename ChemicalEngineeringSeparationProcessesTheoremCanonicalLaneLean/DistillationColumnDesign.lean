import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean.EquilibriumStageModel

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure DistillationColumnDesign {P : SeparationProcessPackage}
    {M : EquilibriumStageModel P} where
  numberOfStages : Nat
  feedStageLocation : Nat
  refluxRatio : Prop
  operatingLines : Prop
  productSpecifications : Prop

structure DistillationColumnEvidence {P : SeparationProcessPackage}
    {M : EquilibriumStageModel P} (D : DistillationColumnDesign M) where
  refluxRatioClosed : D.refluxRatio
  operatingLinesClosed : D.operatingLines
  productSpecificationsClosed : D.productSpecifications

def DistillationColumnClosed {P : SeparationProcessPackage}
    {M : EquilibriumStageModel P} (D : DistillationColumnDesign M) : Prop :=
  D.refluxRatio ∧ D.operatingLines ∧ D.productSpecifications

theorem distillation_column_closed_from_evidence {P : SeparationProcessPackage}
    {M : EquilibriumStageModel P} (D : DistillationColumnDesign M)
    (E : DistillationColumnEvidence D) : DistillationColumnClosed D := by
  exact And.intro E.refluxRatioClosed
    (And.intro E.operatingLinesClosed E.productSpecificationsClosed)

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse