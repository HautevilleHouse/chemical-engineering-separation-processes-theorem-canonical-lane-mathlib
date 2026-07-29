import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean.SeparationProcessPackage

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure PinchAnalysisPackage {P : SeparationProcessPackage} where
  compositeCurve : Type
  pinchPoint : Prop
  minimumEnergyDemand : Prop
  heatIntegration : Prop

structure PinchAnalysisEvidence {P : SeparationProcessPackage}
    (A : PinchAnalysisPackage P) where
  pinchPointClosed : A.pinchPoint
  minimumEnergyDemandClosed : A.minimumEnergyDemand
  heatIntegrationClosed : A.heatIntegration

def PinchAnalysisClosed {P : SeparationProcessPackage}
    (A : PinchAnalysisPackage P) : Prop :=
  A.pinchPoint ∧ A.minimumEnergyDemand ∧ A.heatIntegration

theorem pinch_analysis_closed_from_evidence {P : SeparationProcessPackage}
    (A : PinchAnalysisPackage P) (E : PinchAnalysisEvidence A) :
    PinchAnalysisClosed A := by
  exact And.intro E.pinchPointClosed
    (And.intro E.minimumEnergyDemandClosed E.heatIntegrationClosed)

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse