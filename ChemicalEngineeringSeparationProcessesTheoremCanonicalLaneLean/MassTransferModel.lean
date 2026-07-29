import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean.SeparationProcessPackage

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure MassTransferModel {P : SeparationProcessPackage} where
  diffusionCoefficient : Type
  massTransferCoefficient : Type
  concentrationProfile : Prop
  fluxEquation : Prop
  filmThickness : Prop

structure MassTransferEvidence {P : SeparationProcessPackage}
    (M : MassTransferModel P) where
  concentrationProfileClosed : M.concentrationProfile
  fluxEquationClosed : M.fluxEquation
  filmThicknessClosed : M.filmThickness

def MassTransferClosed {P : SeparationProcessPackage}
    (M : MassTransferModel P) : Prop :=
  M.concentrationProfile ∧ M.fluxEquation ∧ M.filmThickness

theorem mass_transfer_closed_from_evidence {P : SeparationProcessPackage}
    (M : MassTransferModel P) (E : MassTransferEvidence M) :
    MassTransferClosed M := by
  exact And.intro E.concentrationProfileClosed
    (And.intro E.fluxEquationClosed E.filmThicknessClosed)

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse