import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure VaporLiquidEquilibriumPackage where
  gasPhaseNonideality : Prop
  liquidPhaseNonideality : Prop
  activityCoefficientModel : Prop
  fugacityCoefficientModel : Prop
  equilibriumRatioComputed : Prop

structure VaporLiquidEquilibriumEvidence (P : VaporLiquidEquilibriumPackage) where
  gasPhaseNonidealityClosed : P.gasPhaseNonideality
  liquidPhaseNonidealityClosed : P.liquidPhaseNonideality
  activityCoefficientModelClosed : P.activityCoefficientModel
  fugacityCoefficientModelClosed : P.fugacityCoefficientModel
  equilibriumRatioComputedClosed : P.equilibriumRatioComputed

def VaporLiquidEquilibriumClosed (P : VaporLiquidEquilibriumPackage) : Prop :=
  P.gasPhaseNonideality ∧ P.liquidPhaseNonideality ∧
  P.activityCoefficientModel ∧ P.fugacityCoefficientModel ∧
  P.equilibriumRatioComputed

theorem vapor_liquid_equilibrium_closed_from_evidence
    (P : VaporLiquidEquilibriumPackage) (E : VaporLiquidEquilibriumEvidence P) :
    VaporLiquidEquilibriumClosed P := by
  exact And.intro E.gasPhaseNonidealityClosed
    (And.intro E.liquidPhaseNonidealityClosed
      (And.intro E.activityCoefficientModelClosed
        (And.intro E.fugacityCoefficientModelClosed E.equilibriumRatioComputedClosed)))

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse