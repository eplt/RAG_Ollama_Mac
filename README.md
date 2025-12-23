# 🧠 Local RAG Chatbot with Ollama on Mac

[![Version](https://img.shields.io/badge/version-0.1.0-blue.svg)](https://github.com/eplt/RAG_Ollama_Mac/releases/tag/v0.1.0)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.7+](https://img.shields.io/badge/python-3.7+-blue.svg)](https://www.python.org/downloads/)

> Lightweight, private, and customizable retrieval-augmented chatbot running entirely on your Mac.

Based on the excellent work by [pruthvirajcyn](https://github.com/pruthvirajcyn/RAG_Ollama_Deepseek_Streamlit) and his [Medium article](https://medium.com/@pruthvirajc/implementing-a-local-rag-chat-bot-with-ollama-streamlit-and-deepseek-r1-a-practical-guide-46b1903f011f).

---

## ⚙️ About This Project

This is my personal implementation of a local RAG (Retrieval-Augmented Generation) chatbot using:

- [Ollama](https://ollama.com/) for running open-source LLMs and embedding models locally.
- [Streamlit](https://streamlit.io/) for a clean and interactive chat UI.
- [ChromaDB](https://www.trychroma.com/) for storing and querying vector embeddings.

As of **2025-07-17**, I'm using:

- 🔍 Embedding model: `nomic-embed-text-v2-moe`
- 🧠 LLM: `gemma3n`

---

## 💡 Why Run a RAG Locally?

- **🔒 Privacy**: No data is sent to the cloud. Upload and query your documents entirely offline.
- **💸 Cost-effective**: No API tokens or cloud GPU costs. You only pay electricity.
- **📚 Better than summarizing**: With long PDFs or multiple documents, even summaries may not contain the context you need. A RAG chatbot can drill deeper and provide contextual answers.

> ✅ Recommended: At least **16GB of RAM** on your Mac. Preferably 24GB+ for smoother experience.

---

## 🛠️ 1. Installation

### 1. Clone the Repository

```bash
git clone https://github.com/eplt/RAG_Ollama_Mac.git
cd RAG_Ollama_Mac
```

### 2. Create a Virtual Environment

```bash
python3 -m venv venv
source venv/bin/activate
```

### 3. Install Dependencies

```bash
pip install -r ./src/requirements.txt
```

---

## 🚀 2. Usage

### 1. Start Ollama and Pull the Models

```bash
ollama serve
ollama pull gemma3n
ollama pull toshk0/nomic-embed-text-v2-moe:Q6_K
```

### 2. Load Documents

Place your `.pdf` files in the `data/` directory.

```bash
python ./src/load_docs.py
```

To reset and reload the vector database:

```bash
python ./src/load_docs.py --reset
```

### 3. Launch the Chatbot Interface

```bash
streamlit run ./src/UI.py
```

### 4. Start Chatting

Ask questions and the chatbot will respond using relevant context retrieved from your documents.

---

## 🧩 3. Customization

- **✏️ Modify Prompts**  
  Update prompt templates in `UI.py` to guide the chatbot’s tone or behavior.

- **🔄 Try Different Models**  
  Ollama supports various LLMs and embedding models. Run `ollama list` to see what’s available or try pulling new ones.

- **⚙️ Tune Retrieval Parameters**  
  Adjust chunk size, overlaps, or top-K retrieval values in `load_docs.py` for improved performance.

- **🚀 Extend the Interface**  
  Add features like file upload, chat history, user authentication, or export options using Streamlit’s powerful features.

---

## 🧯 4. Troubleshooting

- **Ollama not running?**  
  Make sure `ollama serve` is active in a terminal tab.

- **Missing models?**  
  Run `ollama list` to verify models are downloaded correctly.

- **Dependency issues?**  
  Double-check your Python version (3.7+) and re-create the virtual environment.

- **Streamlit errors?**  
  Ensure you're running the app from the correct path and activate your virtual environment.

---

## 📦 Release Information

**Current Version: v0.1.0** (2025-12-23)

This is the initial public release of RAG_Ollama_Mac. See [CHANGELOG.md](CHANGELOG.md) for detailed release notes.

### What's Included
- ✅ Complete RAG chatbot implementation
- ✅ PDF document processing and embedding
- ✅ Streamlit chat interface
- ✅ ChromaDB vector storage
- ✅ Local Ollama model integration
- ✅ Full documentation and setup guide

---

## 📌 Notes & Future Plans

- Planning to support non-PDF formats (Markdown, .txt, maybe HTML).
- Will experiment with additional LLMs like `phi-3`, `mistral`, and `llama3`.
- Might integrate chat history persistence and better document management.

---

## 👋 Final Thoughts

Local RAG is now more accessible than ever. With powerful small models and tools like Ollama, anyone can build a private, intelligent assistant — no cloud needed.

If you found this useful or have ideas to improve it, feel free to open a PR or drop a star ⭐️

---

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on how to contribute to this project.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

Based on the excellent work by [pruthvirajcyn](https://github.com/pruthvirajcyn/RAG_Ollama_Deepseek_Streamlit) and his [Medium article](https://medium.com/@pruthvirajc/implementing-a-local-rag-chat-bot-with-ollama-streamlit-and-deepseek-r1-a-practical-guide-46b1903f011f).
