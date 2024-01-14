import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import List "mo:base/List";
import Prim "mo:prim";
import Random "mo:base/Random";
import Nat8 "mo:base/Nat8";
import Principal "mo:base/Principal"

actor ICPEsrow {

  type User = {
    id: Text;
    wallet: Wallet;
  };

  type Wallet = {
    wallet_address: Text;
    coin_symbol: Text;
    balance: Nat;
  };

  type Escrow = {
    id: Text;
    buyer: User;
    seller: User;
    amount: Nat;
    status: Text;
    wallet: Wallet;
  };

  type Nat = Prim.Types.Nat;
  type Text = Prim.Types.Text;

  public func generateWalletAddress(): async Text {
    var wallet_address = "Xhjbvewjbjdwkbjkwdbdw";
    return wallet_address;
  };

// function to create a new wallet the wallet address is generated from the generateWalletAddress function
  // public func createWallet(coin_symbol: Text): async Wallet {
  //   var wallet_address = generateWalletAddress();
  //   var newwallet = (wallet_address, coin_symbol, 0);
  //   return newwallet;
  // };

    };
