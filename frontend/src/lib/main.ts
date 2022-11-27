import { ethers } from 'ethers'
import * as ethereum from './ethereum'
import { contracts } from '@/contracts.json'
import type { Main } from '$/Main'
import type { Destroyer } from '$/Destroyer'
import type { Battleship } from '$/Battleship'
import type { Destroyer1 } from '$/Destroyer1'
import type { Battleship1 } from '$/Battleship1'
export type { Main } from '$/Main'

export const correctChain = () => {
  return 31337
}

export const init = async (details: ethereum.Details) => {
  const { provider, signer } = details
  const network = await provider.getNetwork()
  if (correctChain() !== network.chainId) {
    console.error('Please switch to HardHat')
    return null
  }
  const { address, abi } = contracts.Main
  const contract = new ethers.Contract(address, abi, provider)
  const deployed = await contract.deployed()
  if (!deployed) return null
  const contract_ = signer ? contract.connect(signer) : contract
  return contract_ as any as Main
}

export const myShipDestroyer = () => contracts.Destroyer.address
export const myShipBattleship = () => contracts.Battleship.address
export const myShipDestroyer1 = () => contracts.Destroyer1.address
export const myShipBattleship1 = () => contracts.Battleship1.address
