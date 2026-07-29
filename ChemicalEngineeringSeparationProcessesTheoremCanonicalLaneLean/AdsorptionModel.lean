import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean.SeparationProcessPackage

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure AdsorptionModel {P : SeparationProcessPackage} where
  adsorbentMaterial : Type
  isothermType : Prop
  breakthroughCurve : Prop
  massTransferZone : Prop
  columnRegeneration : Prop

structure AdsorptionEvidence {P : SeparationProcessPackage}
    (A : AdsorptionModel P) where
  isothermTypeClosed : A.isothermType
  breakthroughCurveClosed : A.breakthroughCurve
  massTransferZoneClosed : A.massTransferZone
  columnRegenerationClosed : A.columnRegeneration

def AdsorptionClosed {P : SeparationProcessPackage}
    (A : AdsorptionModel P) : Prop :=
  A.isothermType ∧ A.breakthroughCurve ∧ A.massTransferZone ∧ A.columnRegeneration

theorem adsorption_closed_from_evidence {P : SeparationProcessPackage}
    (A : AdsorptionModel P) (E : AdsorptionEvidence A) :
    AdsorptionClosed A := by
  exact And.intro E.isothermTypeClosed
    (And.intro E.breakthroughCurveClosed
      (And.intro E.massTransferZoneClosed E.columnRegenerationClosed))

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse