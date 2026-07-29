import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure MassBalancePackage where
  feedFlowRate : ℝ
  productFlowRate : ℝ
  recycleFlowRate : ℝ
  componentBalances : Prop
  overallBalance : Prop
  balanceConstraints : Prop

structure MassBalanceEvidence (M : MassBalancePackage) where
  componentBalancesClosed : M.componentBalances
  overallBalanceClosed : M.overallBalance
  balanceConstraintsClosed : M.balanceConstraints

def MassBalanceClosed (M : MassBalancePackage) : Prop :=
  M.componentBalances ∧ M.overallBalance ∧ M.balanceConstraints

theorem mass_balance_closed_from_evidence (M : MassBalancePackage) (E : MassBalanceEvidence M) :
    MassBalanceClosed M := by
  exact And.intro E.componentBalancesClosed (And.intro E.overallBalanceClosed E.balanceConstraintsClosed)

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse
