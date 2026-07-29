import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean

structure MassTransferPackage where
  diffusionCoefficient : Prop
  massTransferCoefficient : Prop
  interfacialArea : Prop
  drivingForce : Prop
  fluxModel : Prop

structure MassTransferEvidence (M : MassTransferPackage) where
  diffusionCoefficientClosed : M.diffusionCoefficient
  massTransferCoefficientClosed : M.massTransferCoefficient
  interfacialAreaClosed : M.interfacialArea
  drivingForceClosed : M.drivingForce
  fluxModelClosed : M.fluxModel

def MassTransferClosed (M : MassTransferPackage) : Prop :=
  M.diffusionCoefficient ∧ M.massTransferCoefficient ∧ M.interfacialArea ∧
  M.drivingForce ∧ M.fluxModel

end ChemicalEngineeringSeparationProcessesTheoremCanonicalLaneLean
end HautevilleHouse
