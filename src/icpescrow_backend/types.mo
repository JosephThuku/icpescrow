import Text "mo:base/Text";
import Nat "mo:base/Nat";

module Types {

  //create the user type
  private type User = {
    walletAddress : Text;
    balance : Nat;
    history : [Transaction];
    coinListings : [CoinListing];
  };
  

  //create the EscrowBalance type
  private type EscrowBalance = {
    lockedCoins : Nat;
    releasedCoins : Nat;
  };

  //create the CoinListing type basically a coin
  public type CoinListing = {
    seller : Text;
    amount : Nat;
    price : Nat;
    status : Text;
    escrowBalance : EscrowBalance;
  };

  //create the Transaction type
  public type Transaction = {
    details : Text;
    timestamp : Nat;
  };


  public type wallet = {
    walletAddress : Text;
    coin_symbol : Text;
    balance : Nat;
    
  };
  public type Escrow = {
    seller : Text;
    buyer : Text;
    amount : Nat;
    price : Nat;
    status : Text;
    escrowBalance : EscrowBalance;
  };
};
