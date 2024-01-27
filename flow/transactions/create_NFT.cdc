import NonFungibleToken from 0x06
import CryptoPoops from 0x05

transaction(recipient: Address) {

  prepare(acct: AuthAccount) {
    let minter = acct.borrow<&CryptoPoops.Minter>(from: /storage/Minter) ?? panic("Minter not mib=nting")
    let ref = getAccount(recipient).getCapability(/public/collection).borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>() 
            ?? panic("Collection don't exist!!!")
    ref.deposit(token: <- minter.createNFT(name: "joseph", favouriteFood: "rice", luckyNumber: 10))
  }

  execute {
    log("NFT deposited successfully!!!")
  }
}