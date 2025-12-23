# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2025-12-23

### Added
- Initial release of RAG_Ollama_Mac chatbot
- Local RAG (Retrieval-Augmented Generation) implementation using Ollama
- Support for PDF document loading and processing
- ChromaDB integration for vector storage and retrieval
- Streamlit-based interactive chat interface
- Document embedding using `nomic-embed-text-v2-moe` model
- LLM responses using `gemma3n` model
- Document chunking with configurable parameters
- Batch document loading from `data/` directory
- Reset functionality to reload vector database
- Privacy-focused local execution (no cloud API calls)

### Features
- **Document Loading**: Process multiple PDF files from the data directory
- **Vector Storage**: Efficient document storage and retrieval with ChromaDB
- **Chat Interface**: Clean and intuitive Streamlit UI for conversations
- **Context Retrieval**: Intelligent document context retrieval for accurate responses
- **Local Processing**: All processing happens locally on your Mac
- **Customizable Models**: Easy to switch between different Ollama models

### Requirements
- Python 3.7+
- Ollama with required models installed
- At least 16GB RAM recommended (24GB+ preferred)
- macOS (optimized for Mac, but should work on other platforms)

### Documentation
- Comprehensive README with installation and usage instructions
- Troubleshooting guide
- Customization options documented
- Future roadmap outlined

[0.1.0]: https://github.com/eplt/RAG_Ollama_Mac/releases/tag/v0.1.0
