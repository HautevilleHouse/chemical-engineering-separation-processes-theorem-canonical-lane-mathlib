import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure McCabeThielePackage {F : SeparationAdmissibleObject} where
  operatingLine : Prop
  qLine : Prop
  equilibriumCurve : Prop
  numberOfStagesDerived : Prop
  feedStageLocationDerived : Prop
  mccabeThieleEvidence : Prop

structure McCabeThieleEvidence {F : SeparationAdmissibleObject} (M : McCabeThielePackage F) where
  operatingLineClosed : M.operatingLine
  qLineClosed : M.qLine
  equilibriumCurveClosed : M.equilibriumCurve
  numberOfStagesDerivedClosed : M.numberOfStagesDerived
  feedStageLocationDerivedClosed : M.feedStageLocationDerived
  mccabeThieleEvidenceClosed : M.mccabeThieleEvidence

def McCabeThieleClosed {F : SeparationAdmissibleObject} (M : McCabeThielePackage F) : Prop :=
  M.operatingLine ∧ M.qLine ∧ M.equilibriumCurve ∧ M.numberOfStagesDerived ∧ M.feedStageLocationDerived ∧ M.mccabeThieleEvidence

theorem mccabe_thiele_closed_from_evidence {F : SeparationAdmissibleObject} (M : McCabeThielePackage F)
    (Ev : McCabeThieleEvidence M) : McCabeThieleClosed M := by
  exact And.intro Ev.operatingLineClosed
    (And.intro Ev.qLineClosed
      (And.intro Ev.equilibriumCurveClosed
        (And.intro Ev.numberOfStagesDerivedClosed
          (And.intro Ev.feedStageLocationDerivedClosed Ev.mccabeThieleEvidenceClosed))))

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse