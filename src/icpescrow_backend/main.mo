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

   // Counter for auto-incrementing wallet IDs
  var walletIdCounter = 1;

  // Counter for auto-incrementing escrow IDs
  var escrowIdCounter = 1;

  // Function to generate wallet address
  public func generateWalletAddress(): async Text {
    return "Xhjbvewjbjdwkbjkwdbdw"; // Placeholder, replace with actual logic
  };
    // Function to create a new wallet
  public func createWallet(coin_symbol: Text): async Wallet {
    let wallet_id = walletIdCounter;
    walletIdCounter += 1;

    let wallet_address = await generateWalletAddress();
    let newWallet = {
      wallet_id = wallet_id;
      wallet_address = wallet_address;
      coin_symbol = coin_symbol;
      balance = 0;
    };
    return newWallet;
  };


  // public func createWallet(coin_symbol: Text): async Wallet {
  // var wallet_address = await generateWalletAddress();
  // var newWallet = {
  //   wallet_address = wallet_address;
  //   coin_symbol = coin_symbol;
  //   balance = 0;
  // };
  // return newWallet;
  // };

    public func sendCoin(sender: User, receiver: User, amount: Nat): async (Wallet, Wallet) {
    assert sender.wallet.balance >= amount;
    
    var senderNewBalance = sender.wallet.balance - amount;
    var receiverNewBalance = receiver.wallet.balance + amount;

    var senderNewWallet = {
      wallet_address = sender.wallet.wallet_address;
      coin_symbol = sender.wallet.coin_symbol;
      balance = senderNewBalance;
    };

    var receiverNewWallet = {
      wallet_address = receiver.wallet.wallet_address;
      coin_symbol = receiver.wallet.coin_symbol;
      balance = receiverNewBalance;
    };

    return (senderNewWallet, receiverNewWallet);
  };

};
