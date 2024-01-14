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

  public func createWallet(coin_symbol: Text): async Wallet {
  var wallet_address = await generateWalletAddress();
  var newWallet = {
    wallet_address = wallet_address;
    coin_symbol = coin_symbol;
    balance = 0;
  };
  return newWallet;
  };

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
    seller: User;
    buyer: User;
    icpAmount: Nat;
    usdtAmount: Nat;
    escrowWallet: Wallet; // Dedicated wallet for the escrow
    status: Text;
  };

  type Nat = Prim.Types.Nat;
  type Text = Prim.Types.Text;

  public func generateWalletAddress(): async Text {
    var wallet_address = "Xhjbvewjbjdwkbjkwdbdw";
    return wallet_address;
  };

  public func createWallet(coin_symbol: Text): async Wallet {
    var wallet_address = await generateWalletAddress();
    var newWallet = {
      wallet_address = wallet_address;
      coin_symbol = coin_symbol;
      balance = 0;
    };
    return newWallet;
  };

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

  // Escrow node method for selling ICP coins
  public func sellICPCoins(seller: User, icpAmount: Nat, usdtAmount: Nat): async Escrow {
    assert seller.wallet.balance >= icpAmount : "Insufficient ICP coins for selling";

    var escrowId = Random.nextInt().toString();
    
    // Create a new wallet for the escrow
    var escrowWallet = await createWallet("ICP");

    var escrow = {
      id = escrowId;
      seller = seller;
      buyer = { id = ""; wallet = { wallet_address = ""; coin_symbol = ""; balance = 0 } };
      icpAmount = icpAmount;
      usdtAmount = usdtAmount;
      escrowWallet = escrowWallet;
      status = "pending";
    };

    // Transfer ICP coins to escrow
    var (sellerNewWallet, _) = await sendCoin(seller, escrow, icpAmount);
    escrow.seller.wallet = sellerNewWallet;

    return escrow;
  };

  // Escrow node method for buying ICP coins
  public func buyICPCoins(buyer: User, escrow: Escrow): async Escrow {
    assert buyer.wallet.balance >= escrow.usdtAmount : "Insufficient USDT for buying";

    // Transfer USDT to escrow
    var (_, escrowNewWallet) = await sendCoin(buyer, escrow.seller, escrow.usdtAmount);
    escrow.buyer = buyer;
    escrow.status = "completed";
    escrow.escrowWallet = escrowNewWallet;

    return escrow;
  };

};

};
