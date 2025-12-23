# Release Notes - v0.1.0

## 🎉 Initial Public Release

This is the first official release of **RAG_Ollama_Mac** - a lightweight, private, and customizable retrieval-augmented chatbot running entirely on your Mac.

## ✨ Features

### Core Functionality
- **🤖 Local RAG Implementation**: Complete retrieval-augmented generation system using Ollama
- **📄 PDF Processing**: Load and process multiple PDF documents from the data directory
- **💬 Interactive Chat**: Clean and intuitive Streamlit-based chat interface
- **🔍 Smart Retrieval**: ChromaDB-powered vector storage for efficient document retrieval
- **🔒 Privacy First**: All processing happens locally - no cloud API calls

### Technical Details
- **Embedding Model**: `nomic-embed-text-v2-moe` for high-quality document embeddings
- **LLM**: `gemma3n` for intelligent, context-aware responses
- **Vector Database**: ChromaDB for persistent vector storage
- **UI Framework**: Streamlit for interactive web interface

## 📋 What's Included

- ✅ Complete source code for RAG chatbot
- ✅ Document loading and processing utilities
- ✅ Configurable text chunking (800 chars with 80 char overlap)
- ✅ Vector database management with reset functionality
- ✅ Interactive chat interface with message history
- ✅ Comprehensive documentation and setup guide
- ✅ MIT License

## 🛠️ Installation

```bash
# Clone the repository
git clone https://github.com/eplt/RAG_Ollama_Mac.git
cd RAG_Ollama_Mac

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r ./src/requirements.txt
```

## 🚀 Quick Start

1. Start Ollama and pull required models:
   ```bash
   ollama serve
   ollama pull gemma3n
   ollama pull toshk0/nomic-embed-text-v2-moe:Q6_K
   ```

2. Load your documents:
   ```bash
   python ./src/load_docs.py
   ```

3. Launch the chatbot:
   ```bash
   streamlit run ./src/UI.py
   ```

## 💻 System Requirements

- **Operating System**: macOS (optimized for Mac, but works on other platforms)
- **Python**: 3.7 or higher
- **RAM**: At least 16GB recommended (24GB+ for optimal performance)
- **Ollama**: Latest version with required models installed

## 📦 Dependencies

Key dependencies included in this release:
- langchain (0.3.26)
- langchain-ollama (0.3.5)
- langchain-chroma (0.2.4)
- chromadb (1.0.15)
- streamlit (1.41.1)
- ollama (0.5.1)

See `src/requirements.txt` for complete list.

## 🎯 Use Cases

- **Research**: Query academic papers and research documents
- **Documentation**: Get instant answers from technical documentation
- **Books**: Ask questions about long-form content
- **Privacy-Sensitive Work**: Process confidential documents locally

## 🔮 Future Plans

- Support for additional file formats (Markdown, .txt, HTML)
- Multiple LLM model support (phi-3, mistral, llama3)
- Chat history persistence
- Enhanced document management
- User authentication options

## 🙏 Acknowledgments

This project is based on the excellent work by [pruthvirajcyn](https://github.com/pruthvirajcyn/RAG_Ollama_Deepseek_Streamlit).

## 📄 License

Released under the MIT License. See [LICENSE](LICENSE) for details.

## 🐛 Known Issues

None reported for this initial release.

## 📝 Changelog

For detailed changes, see [CHANGELOG.md](CHANGELOG.md).

---

**Full Changelog**: https://github.com/eplt/RAG_Ollama_Mac/commits/v0.1.0
