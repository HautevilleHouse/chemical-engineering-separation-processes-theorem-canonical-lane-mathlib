import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure MassTransferPDESystem where
  diffusivity : ℝ → ℝ → ℝ
  concentrationField : ℝ × ℝ → ℝ × ℝ → ℝ
  boundaryCondition : ℝ × ℝ → Prop
  initialCondition : ℝ → ℝ
  convectionTerm : ℝ × ℝ → ℝ × ℝ → ℝ
  reactionTerm : ℝ → ℝ → ℝ

def MassTransferPDEClosed (M : MassTransferPDESystem) : Prop :=
  (∀ x t, M.diffusivity x t > 0) ∧
  (∀ x t, M.convectionTerm x t = 0 → M.reactionTerm x t = 0) ∧
  M.boundaryCondition (0,0) ∧ M.boundaryCondition (1,1)

structure MassTransferPDEEvidence (M : MassTransferPDESystem) where
  diffusivityPositive : ∀ x t, M.diffusivity x t > 0
  convectionReactionConsistent : ∀ x t, M.convectionTerm x t = 0 → M.reactionTerm x t = 0
  boundaryClosure : M.boundaryCondition (0,0) ∧ M.boundaryCondition (1,1)

theorem mass_transfer_pde_closed_from_evidence (M : MassTransferPDESystem)
    (E : MassTransferPDEEvidence M) : MassTransferPDEClosed M := by
  exact And.intro E.diffusivityPositive (And.intro E.convectionReactionConsistent E.boundaryClosure)

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse