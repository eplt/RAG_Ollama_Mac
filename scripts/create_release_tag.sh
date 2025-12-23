#!/bin/bash
# Script to create and push the v0.1.0 release tag
# This script should be run from the repository root

set -e  # Exit on error

VERSION="0.1.0"
TAG="v${VERSION}"

echo "🏷️  Creating release tag ${TAG}..."

# Check if we're in a git repository
if [ ! -d .git ]; then
    echo "❌ Error: Not in a git repository root"
    exit 1
fi

# Check if tag already exists
if git rev-parse "$TAG" >/dev/null 2>&1; then
    echo "⚠️  Warning: Tag ${TAG} already exists"
    read -p "Do you want to delete and recreate it? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "🗑️  Deleting existing tag..."
        git tag -d "$TAG"
        git push origin ":refs/tags/${TAG}" 2>/dev/null || echo "Tag not on remote"
    else
        echo "Aborted."
        exit 0
    fi
fi

# Make sure we're on main and up to date
echo "📥 Fetching latest changes..."
git fetch origin

CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo "⚠️  Warning: You're on branch '${CURRENT_BRANCH}', not 'main'"
    read -p "Do you want to continue anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted. Please checkout main branch first."
        exit 0
    fi
fi

# Create annotated tag
echo "✨ Creating annotated tag ${TAG}..."
git tag -a "$TAG" -m "Release version ${VERSION}

Initial public release of RAG_Ollama_Mac - a lightweight, private, and customizable retrieval-augmented chatbot running entirely on your Mac.

Key Features:
- Local RAG implementation using Ollama
- PDF document processing and embedding
- ChromaDB vector storage
- Streamlit-based interactive chat interface
- Privacy-focused local execution
- Support for multiple LLM models

See RELEASE_NOTES.md and CHANGELOG.md for detailed information."

echo "✅ Tag ${TAG} created successfully"

# Ask to push
read -p "Do you want to push the tag to GitHub? (Y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Nn]$ ]]; then
    echo "Tag created locally but not pushed. Run 'git push origin ${TAG}' to push it later."
else
    echo "📤 Pushing tag to GitHub..."
    git push origin "$TAG"
    echo ""
    echo "✅ Tag pushed successfully!"
    echo ""
    echo "📝 Next steps:"
    echo "   1. Go to: https://github.com/eplt/RAG_Ollama_Mac/releases/new?tag=${TAG}"
    echo "   2. Set title: 'v${VERSION} - Initial Public Release'"
    echo "   3. Copy contents from RELEASE_NOTES.md to the description"
    echo "   4. Mark as 'Latest release'"
    echo "   5. Click 'Publish release'"
    echo ""
    echo "Or use GitHub CLI:"
    echo "   gh release create ${TAG} --title 'v${VERSION} - Initial Public Release' --notes-file RELEASE_NOTES.md --latest"
fi
