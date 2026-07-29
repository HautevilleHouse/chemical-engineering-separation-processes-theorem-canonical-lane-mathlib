import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure MembraneModule where
  membraneType : String
  permeability : ℝ → ℝ
  selectivity : ℝ → ℝ
  pressureDrop : ℝ
  fluxEquation : ℝ → ℝ → ℝ

def RejectionCoefficient (M : MembraneModule) (solute : ℝ) : ℝ :=
  1 - (M.fluxEquation solute M.pressureDrop) / (M.permeability solute)

structure MembraneSeparationEvidence (M : MembraneModule) where
  permeabilityPositive : ∀ solute, solute > 0 → M.permeability solute > 0
  selectivityGreaterThanOne : ∀ solute, M.selectivity solute > 1
  pressureDropPositive : M.pressureDrop > 0
  fluxEquationConsistent : ∀ solute, M.fluxEquation solute M.pressureDrop ≤ M.permeability solute

def MembraneSeparationClosed (M : MembraneModule) : Prop :=
  (∀ solute, solute > 0 → M.permeability solute > 0) ∧
  (∀ solute, M.selectivity solute > 1) ∧
  M.pressureDrop > 0 ∧
  (∀ solute, M.fluxEquation solute M.pressureDrop ≤ M.permeability solute)

theorem membrane_separation_closed_from_evidence (M : MembraneModule)
    (E : MembraneSeparationEvidence M) : MembraneSeparationClosed M := by
  exact And.intro E.permeabilityPositive (And.intro E.selectivityGreaterThanOne
    (And.intro E.pressureDropPositive E.fluxEquationConsistent))

theorem rejection_coefficient_le_one (M : MembraneModule) (solute : ℝ)
    (h : MembraneSeparationClosed M) : RejectionCoefficient M solute ≤ 1 := by
  unfold RejectionCoefficient
  have hflux : M.fluxEquation solute M.pressureDrop ≤ M.permeability solute := h.2.2.2 solute
  nlinarith

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse