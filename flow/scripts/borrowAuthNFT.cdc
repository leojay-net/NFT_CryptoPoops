import NonFungibleToken from 0x06
import CryptoPoops from 0x05


pub fun main(account: Address, id: UInt64): &CryptoPoops.NFT {
  let ref = getAccount(account).getCapability(/public/collection).borrow<&CryptoPoops.Collection{CryptoPoops.AuthCollectionPublic}>()
        ?? panic("collection don't exist")
  return ref.borrowAuthNFT(id: id)
}