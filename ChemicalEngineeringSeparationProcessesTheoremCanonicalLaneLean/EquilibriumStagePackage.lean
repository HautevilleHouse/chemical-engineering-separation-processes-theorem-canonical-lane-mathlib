import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure EquilibriumStagePackage where
  vaporLiquidEquilibrium : Prop
  stageEfficiency : Prop
  operatingLine : Prop
  numberOfStages : Prop
  refluxRatio : Prop

structure EquilibriumStageEvidence (E : EquilibriumStagePackage) where
  vaporLiquidEquilibriumClosed : E.vaporLiquidEquilibrium
  stageEfficiencyClosed : E.stageEfficiency
  operatingLineClosed : E.operatingLine
  numberOfStagesClosed : E.numberOfStages
  refluxRatioClosed : E.refluxRatio

def EquilibriumStageClosed (E : EquilibriumStagePackage) : Prop :=
  E.vaporLiquidEquilibrium ∧ E.stageEfficiency ∧ E.operatingLine ∧
  E.numberOfStages ∧ E.refluxRatio

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse
