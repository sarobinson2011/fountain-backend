
1. Bottle Registration (Company Action)

Flow:

    The company assigns an RFID tag to a bottle.
    The company scans the authenticity documents, generates a hash, and stores it in the Registry Contract.
    The Transaction Contract calls the NFT Contract to mint an NFT representing the bottle.

Contract Interactions:

    Company → Registry Contract → Registers bottle (storeBottleData)
    Transaction Contract → NFT Contract → Mints an NFT (mint)


2. Customer Purchase (Ownership Assignment)

Flow:

    A customer purchases a bottle.
    The Transaction Contract verifies that the bottle is available.
    The NFT Contract transfers the ownership of the bottle’s NFT to the buyer.

Contract Interactions:

    Customer → Transaction Contract → Calls purchaseBottle(bottleId, buyerAddress).
    Transaction Contract → Registry Contract → Verifies authenticity (getBottleData).
    Transaction Contract → NFT Contract → Transfers NFT to the buyer (safeTransferFrom).


3. Ownership Transfer (Company-Controlled Process)

Flow:

    A customer requests a transfer to another user.
    The company approves the transfer through the Transaction Contract.
    The NFT Contract updates the NFT ownership.

Contract Interactions:

    Customer → Transaction Contract → Calls requestOwnershipTransfer(newOwner).
    Company → Transaction Contract → Approves transfer (approveTransfer).
    Transaction Contract → NFT Contract → Calls safeTransferFrom(currentOwner, newOwner).


4. Redemption (Customer Requests Physical Bottle)

Flow:

    A customer requests to redeem their bottle.
    The company confirms the request.
    The Transaction Contract burns the NFT or marks it as claimed.
    The physical bottle is shipped to the customer.

Contract Interactions:

    Customer → Transaction Contract → Calls redeemBottle(bottleId).
    Transaction Contract → NFT Contract → Calls burn(tokenId) OR marks it as claimed.
    Company ships the physical bottle to the customer.



5. Summary of How Contracts Interact

Action	                Registry Contract	        NFT Contract	                Transaction Contract
-Bottle Registration    -Stores authenticity hash	-Mints NFT	                    -Calls NFT contract to mint
-Customer Purchase	    -Verifies authenticity	    -Transfers NFT to buyer	        -Handles purchase logic
-Ownership Transfer	    -Verifies bottle exists	    -Transfers NFT to new owner	    -Handles approval & transfer
-Redemption	            -Verifies authenticity	    -Burns NFT / Marks as claimed	-Handles redemption process

