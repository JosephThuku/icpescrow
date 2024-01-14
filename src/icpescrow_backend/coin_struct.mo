// coin_structs.mo

// Struct for representing a coin listing
type CoinListing = {
  seller : Principal;
  amount : Nat;
  price : Nat;  // You might want to use a different type depending on your needs
  status : Text;  // You can use an enumeration type for status
};

// Struct for representing a user
type User = {
  walletAddress : Principal;
};

// Struct for representing a transaction
type Transaction = {
  details : Text;
  timestamp : Time;  // Assuming Time is a predefined type
};

// Struct for representing an escrow balance
type EscrowBalance = {
  user : Principal;
  amount : Nat;
};
