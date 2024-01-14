let userIdCounter = 1; // Counter for auto-incrementing user IDs

async function createUser() {
    const userId = `user${userIdCounter++}`; // Auto-incrementing user ID
    await ICPEsrow.createUser({
        id: userId,
        wallet: { wallet_address: '', coin_symbol: '', balance: 0 }
    });
    alert(`User ${userId} created successfully!`);
}

async function sellICPCoins() {
    const sellUserId = document.getElementById('sellUserId').value;
    const icpAmount = parseInt(document.getElementById('icpAmount').value);
    const usdtAmount = parseInt(document.getElementById('usdtAmount').value);

    const escrow = await ICPEsrow.sellICPCoins({
        id: sellUserId,
        wallet: { wallet_address: '', coin_symbol: '', balance: 0 }
    }, icpAmount, usdtAmount);

    alert(`Sell request initiated. Escrow ID: ${escrow.id}`);
}

async function buyICPCoins() {
    const buyUserId = document.getElementById('buyUserId').value;
    const buyEscrowId = document.getElementById('buyEscrowId').value;

    const escrow = await ICPEsrow.buyICPCoins({
        id: buyUserId,
        wallet: { wallet_address: '', coin_symbol: '', balance: 0 }
    }, { id: buyEscrowId, seller: { id: '', wallet: { wallet_address: '', coin_symbol: '', balance: 0 } }, buyer: { id: '', wallet: { wallet_address: '', coin_symbol: '', balance: 0 } }, icpAmount: 0, usdtAmount: 0, escrowWallet: { wallet_address: '', coin_symbol: '', balance: 0 }, status: '' });

    alert(`Buy request completed. Transaction ID: ${escrow.id}`);
}
