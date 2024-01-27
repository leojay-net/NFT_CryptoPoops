import NonFungibleToken from 0x06
import CryptoPoops from 0x05

transaction() {

  prepare(acct: AuthAccount) {
    acct.save( <- CryptoPoops.createEmptyCollection(), to: /storage/collection)
    acct.link<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic, CryptoPoops.AuthCollectionPublic}>(/public/collection, target:/storage/collection)
  }

  execute {
    log("NFT collection created successfully!!!")
  }
}