import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure MassTransferRateModelPackage where
  diffusionCoefficient : Prop
  filmThickness : Prop
  interfacialArea : Prop
  concentrationDrivingForce : Prop
  materialBalanceCoupling : Prop

structure MassTransferRateModelEvidence (M : MassTransferRateModelPackage) where
  diffusionCoefficientClosed : M.diffusionCoefficient
  filmThicknessClosed : M.filmThickness
  interfacialAreaClosed : M.interfacialArea
  concentrationDrivingForceClosed : M.concentrationDrivingForce
  materialBalanceCouplingClosed : M.materialBalanceCoupling

def MassTransferRateModelClosed (M : MassTransferRateModelPackage) : Prop :=
  M.diffusionCoefficient ∧ M.filmThickness ∧
  M.interfacialArea ∧ M.concentrationDrivingForce ∧
  M.materialBalanceCoupling

theorem mass_transfer_rate_model_closed_from_evidence
    (M : MassTransferRateModelPackage) (E : MassTransferRateModelEvidence M) :
    MassTransferRateModelClosed M := by
  exact And.intro E.diffusionCoefficientClosed
    (And.intro E.filmThicknessClosed
      (And.intro E.interfacialAreaClosed
        (And.intro E.concentrationDrivingForceClosed E.materialBalanceCouplingClosed)))

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse