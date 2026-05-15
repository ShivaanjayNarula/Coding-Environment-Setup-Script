# Environment Setup - For MacOS

This project provides an automated script to transform a fresh macOS installation into a high-performance, AI-integrated development environment[cite: 2]. It supports a modern tech stack (C++, Java, Python, Node.js, Go) and installs essential AI tools like Cursor, Claude, and Ollama[cite: 2].

## What's Included

### Programming Languages & Runtimes
* **C++:** GCC (GNU Compiler Collection)[cite: 2]
* **Java:** OpenJDK[cite: 2]
* **Node.js:** Latest LTS version including **TypeScript** and **Express.js** support[cite: 2]
* **Go:** Full Go runtime and workspace setup[cite: 2]
* **Python:** Anaconda distribution for data science and environment management[cite: 2]

### Databases & Infrastructure
* **MySQL:** Locally managed service[cite: 2]
* **Docker Desktop:** Containerization platform[cite: 2]

### IDEs & Editors
* **Cursor:** AI-first code editor[cite: 2]
* **JetBrains Suite:** IntelliJ IDEA, PyCharm, WebStorm[cite: 2]
* **VS Code:** Standard extensible editor[cite: 2]

### AI Tools
* **Claude Code:** Anthropic's terminal-based coding agent[cite: 2]
* **Ollama:** Local LLM runner (pre-configured with Llama3)[cite: 2]
* **Ghostty:** Ultra-fast, GPU-accelerated terminal[cite: 2]

---

## Usage Instructions

### 1. Download the script
Save the `setup.sh` file to your Mac[cite: 2].

### 2. Make it executable
```bash
chmod +x setup.sh
```[cite: 2]

### 3. Run the setup
```bash
./setup.sh
```[cite: 2]

### 4. Post-Installation
1. **Refresh your shell:** Run `source ~/.zshrc`[cite: 2]
2. **Open Docker:** Launch Docker Desktop to finish initialization[cite: 2].
3. **Secure MySQL:** Run `mysql_secure_installation`[cite: 2].
