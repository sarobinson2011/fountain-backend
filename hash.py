import hashlib

# RFID code (convert to bytes)
rfid_code = "123456789ABCDEF"  
rfid_bytes = rfid_code.encode('utf-8')  # Convert string to bytes

# Read the PDF as binary data
with open("bottle_certificate.pdf", "rb") as file:
    pdf_bytes = file.read()

# Combine PDF data and RFID code
combined_data = pdf_bytes + rfid_bytes  # Concatenation

# Generate SHA-256 hash
combined_hash = hashlib.sha256(combined_data).hexdigest()

print("Combined PDF + RFID Hash:", combined_hash)


# combined hash = 0xd26fe0985dfb6da664b3c62f4ae07e0f307c9f212a10f760f28cdfa5a571d0aa
