import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure AdsorptionIsotherm where
  isothermType : String  -- Langmuir, Freundlich, BET
  parameters : List ℝ
  equilibriumLoading : ℝ → ℝ
  temperature : ℝ

def LangmuirIsotherm (p : ℝ) (qmax : ℝ) (b : ℝ) : ℝ := qmax * b * p / (1 + b * p)

def FreundlichIsotherm (p : ℝ) (k : ℝ) (n : ℝ) : ℝ := k * p ^ (1/n)

structure AdsorptionEvidence (A : AdsorptionIsotherm) where
  parametersValid : A.parameters.length = 2 → (A.parameters[0] > 0) ∧ (A.parameters[1] > 0)
  loadingPositive : ∀ p > 0, A.equilibriumLoading p > 0
  temperatureRange : A.temperature > 273.15 ∧ A.temperature < 373.15

def AdsorptionClosed (A : AdsorptionIsotherm) : Prop :=
  (∀ p > 0, A.equilibriumLoading p > 0) ∧ A.temperature > 273.15 ∧ A.temperature < 373.15

theorem adsorption_closed_from_evidence (A : AdsorptionIsotherm)
    (E : AdsorptionEvidence A) : AdsorptionClosed A := by
  exact And.intro E.loadingPositive (And.intro E.temperatureRange.1 E.temperatureRange.2)

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse