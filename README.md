# 🔐 Secure Message Encoder/Decoder
### x86 Assembly Language Project — BSCS-IV Spring 2026

A menu-driven **Text Crypto System** built in x86 Assembly Language that encrypts  
and decrypts messages using three classical cipher methods.

**Developers:** Danish Kumar & Sooraj  
**Course:** Computer Organization & Assembly Language (COAL)  
**Instructor:** Sir Hifazat Ali Shah  
**Batch:** BSCS-IV Section D, 2024

---

## 🚀 Features

| Feature | Description |
|---------|-------------|
| 🔑 XOR Cipher | XORs each character with a fixed key — symmetric encrypt/decrypt |
| 🔤 Caesar Cipher | Shifts characters by +3 (encrypt) / -3 (decrypt) using ADD/SUB |
| 🔄 Rotate Cipher | Rotates bits left (ROL) to encrypt, right (ROR) to decrypt |
| 📋 Menu-Driven UI | Clean text-based interface with Encrypt, Decrypt & Exit options |
| 💾 Reuse Last String | Decrypt can reuse the previously encrypted string without re-typing |

---

## 🛠️ Assembly Concepts Used

- **Procedures** (`CALL`/`RET`) — modular code structure for each cipher
- **Bitwise Operations** — `XOR`, `ROL`, `ROR` for encryption logic
- **String Handling** — byte-by-byte character processing using SI register
- **Loops & Jumps** — `JMP`, `JE`, `JL`, `JGE` for control flow
- **Stack** (`PUSH`/`POP`) — register preservation across procedure calls
- **DOS Interrupts** — `INT 21h` for keyboard input and console output

---

## 📌 How It Works

```
Launch Program
      │
      ▼
 ┌─────────────┐
 │  Main Menu  │
 │  1. Encrypt │
 │  2. Decrypt │
 │  3. Exit    │
 └──────┬──────┘
        │
        ▼
 ┌──────────────────┐
 │   Cipher Menu    │
 │  1. XOR Cipher   │
 │  2. Caesar Cipher│
 │  3. Rotate Cipher│
 │  4. Back         │
 └──────────────────┘
        │
        ▼
  Enter message → Output encrypted/decrypted result
```

---

## 🔒 Cipher Details

### 1. XOR Cipher
- Each character byte is XOR'd with the fixed key `0x05`
- **Symmetric** — same operation encrypts and decrypts
- Example: `'A' (0x41) XOR 0x05 = 0x44 ('D')`

### 2. Caesar Cipher
- Encrypt: `ADD AL, 3` — shifts character forward by 3
- Decrypt: `SUB AL, 3` — shifts character back by 3
- Wraps around the alphabet to stay within bounds

### 3. Rotate Cipher
- Encrypt: `ROL AL, 1` — rotates bits of each character left by 1
- Decrypt: `ROR AL, 1` — rotates bits right by 1
- Works at the bit level for low-level obfuscation

---

## ▶️ How to Run

### Using EMU8086 (Recommended for beginners)
1. Download and install [EMU8086](https://emu8086-microprocessor-emulator.en.softonic.com/)
2. Open `crypto.asm` in EMU8086
3. Click **Compile** then **Run**

### Using DOSBox + MASM
1. Install [DOSBox](https://www.dosbox.com/) and MASM
2. Mount your project folder in DOSBox
3. Run the following commands:
```
masm crypto.asm
link crypto.obj
crypto.exe
```

---

## 📁 Project Structure

```
secure-message-encoder-decoder-asm/
├── crypto.asm            # Main x86 Assembly source code
├── project_report.docx   # Project proposal & documentation
└── README.md             # This file
```

---

## 👥 Contributors

| Name | Role |
|------|------|
| Danish Kumar | Co-developer |
| Sooraj | Co-developer |

---

## 📚 Course Info

This project was submitted as part of the **Computer Organization & Assembly Language (COAL)** course at our university, Spring 2026 semester.

---

> *Built with 💻 and a lot of low-level debugging!*
