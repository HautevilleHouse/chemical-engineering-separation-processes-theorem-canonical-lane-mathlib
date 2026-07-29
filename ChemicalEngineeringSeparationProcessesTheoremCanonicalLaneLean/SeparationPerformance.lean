import canonicalLaneMathlib.AdmissibleClass
.MassBalancePackage
.EquilibriumStageModel

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure SeparationPerformance where
  massBalance : MassBalancePackage
  equilibriumModel : EquilibriumStageModel
  recoveryFraction : ℝ → ℝ
  purityConstraint : Prop
  performanceMetric : Prop

structure SeparationPerformanceEvidence (S : SeparationPerformance) where
  massBalanceClosed : MassBalanceClosed S.massBalance
  equilibriumStageClosed : EquilibriumStageClosed S.equilibriumModel
  recoveryFractionPositive : ∀ x, S.recoveryFraction x ≥ 0
  purityConstraintClosed : S.purityConstraint
  performanceMetricClosed : S.performanceMetric

def SeparationPerformanceClosed (S : SeparationPerformance) : Prop :=
  MassBalanceClosed S.massBalance ∧ EquilibriumStageClosed S.equilibriumModel ∧
  (∀ x, S.recoveryFraction x ≥ 0) ∧ S.purityConstraint ∧ S.performanceMetric

theorem separation_performance_closed_from_evidence (S : SeparationPerformance) (E : SeparationPerformanceEvidence S) :
    SeparationPerformanceClosed S := by
  exact And.intro E.massBalanceClosed
    (And.intro E.equilibriumStageClosed
      (And.intro E.recoveryFractionPositive
        (And.intro E.purityConstraintClosed E.performanceMetricClosed)))

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse
