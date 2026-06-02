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
|--------|-------------|
| 🔑 XOR Cipher | XORs each character with a fixed key — symmetric encrypt/decrypt |
| 🔤 Caesar Cipher | Shifts characters by +3 (encrypt) / -3 (decrypt) using ADD/SUB |
| 🔄 Rotate Cipher | Rotates bits left (ROL) to encrypt, right (ROR) to decrypt |
| 📋 Menu-Driven UI | Clean text-based interface with Encrypt, Decrypt & Exit options |
| 💾 Reuse Last String | Decrypt can reuse the previously encrypted string |

---

## 🛠️ Assembly Concepts Used

- **Procedures** (`CALL`/`RET`) — modular code structure
- **Bitwise Operations** — `XOR`, `ROL`, `ROR`
- **String Handling** — byte-by-byte character processing
- **Loops & Jumps** — `JMP`, `JE`, `JL`, `JGE` for control flow
- **Stack** (`PUSH`/`POP`) — register preservation across calls
- **DOS Interrupts** — `INT 21h` for I/O

---

## ▶️ How to Run

1. Install **DOSBox** and **MASM** (or use **EMU8086**)
2. Assemble: `masm crypto.asm`
3. Link: `link crypto.obj`
4. Run: `crypto.exe`

---

## 📁 Project Structure
├── crypto.asm          # Main Assembly source code
├── project_report.docx # Project proposal & documentation
└── README.md

---

## 📌 How It Works
Launch Program
│
▼
[Main Menu]
1.Encrypt
2.Decrypt
3.Exit
│
▼ [Cipher Menu]
4.XOR Cipher
5.Caesar Cipher
6.Rotate Cipher
7.Back
