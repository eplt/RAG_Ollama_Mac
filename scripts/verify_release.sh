#!/bin/bash
# Verify that all release artifacts are in place for v0.1.0

VERSION="0.1.0"
TAG="v${VERSION}"
ERRORS=0

echo "🔍 Verifying v${VERSION} release artifacts..."
echo ""

# Check if we're in the repository root
if [ ! -d .git ]; then
    echo "❌ Error: Not in a git repository root"
    exit 1
fi

# Function to check file exists and is not empty
check_file() {
    local file=$1
    local description=$2
    
    if [ ! -f "$file" ]; then
        echo "❌ Missing: $file ($description)"
        ERRORS=$((ERRORS + 1))
        return 1
    elif [ ! -s "$file" ]; then
        echo "⚠️  Warning: $file exists but is empty"
        ERRORS=$((ERRORS + 1))
        return 1
    else
        echo "✅ Found: $file"
        return 0
    fi
}

# Function to check if content exists in file
check_content() {
    local file=$1
    local pattern=$2
    local description=$3
    
    if grep -q "$pattern" "$file" 2>/dev/null; then
        echo "✅ Verified: $description in $file"
        return 0
    else
        echo "❌ Missing: $description in $file"
        ERRORS=$((ERRORS + 1))
        return 1
    fi
}

echo "📄 Checking release documentation..."
check_file "README.md" "Main documentation"
check_file "CHANGELOG.md" "Version history"
check_file "RELEASE_NOTES.md" "Release notes"
check_file "CONTRIBUTING.md" "Contribution guidelines"
check_file "LICENSE" "License file"
check_file ".gitignore" "Git ignore rules"

echo ""
echo "🐍 Checking source code..."
check_file "src/__version__.py" "Version file"
check_file "src/UI.py" "Main UI file"
check_file "src/load_docs.py" "Document loader"
check_file "src/rag_query.py" "RAG query handler"
check_file "src/embedding.py" "Embedding module"
check_file "src/requirements.txt" "Python dependencies"

echo ""
echo "📝 Checking version consistency..."
if [ -f "src/__version__.py" ]; then
    VERSION_IN_FILE=$(grep "__version__" src/__version__.py | grep -oP '"\K[^"]+')
    if [ "$VERSION_IN_FILE" = "$VERSION" ]; then
        echo "✅ Version in src/__version__.py matches: $VERSION_IN_FILE"
    else
        echo "❌ Version mismatch! src/__version__.py has $VERSION_IN_FILE, expected $VERSION"
        ERRORS=$((ERRORS + 1))
    fi
fi

echo ""
echo "🔗 Checking version references..."
check_content "README.md" "$VERSION" "Version in README"
check_content "CHANGELOG.md" "$VERSION" "Version in CHANGELOG"
check_content "RELEASE_NOTES.md" "$VERSION" "Version in RELEASE_NOTES"
check_content "src/UI.py" "__version__" "Version import in UI"

echo ""
echo "📦 Checking directory structure..."
if [ -d "data" ]; then
    echo "✅ Found: data/ directory"
    if [ -f "data/.gitkeep" ]; then
        echo "✅ Found: data/.gitkeep"
    fi
else
    echo "❌ Missing: data/ directory"
    ERRORS=$((ERRORS + 1))
fi

if [ -d "src" ]; then
    echo "✅ Found: src/ directory"
else
    echo "❌ Missing: src/ directory"
    ERRORS=$((ERRORS + 1))
fi

echo ""
echo "🏷️  Checking Git tag..."
if git rev-parse "$TAG" >/dev/null 2>&1; then
    echo "✅ Tag $TAG exists"
    TAG_COMMIT=$(git rev-parse "$TAG")
    echo "   Tag points to commit: $TAG_COMMIT"
else
    echo "⚠️  Tag $TAG does not exist yet (needs to be created)"
fi

echo ""
echo "🌐 Checking GitHub release..."
if command -v gh &> /dev/null; then
    if gh release view "$TAG" &> /dev/null; then
        echo "✅ GitHub release $TAG exists"
    else
        echo "⚠️  GitHub release $TAG does not exist yet (needs to be created)"
    fi
else
    echo "ℹ️  GitHub CLI not installed, skipping release check"
fi

echo ""
echo "=" | tr '=' '=' | head -c 60
echo ""

if [ $ERRORS -eq 0 ]; then
    echo "✅ All checks passed! Release artifacts are ready."
    echo ""
    echo "Next steps:"
    echo "1. Run: ./scripts/create_release_tag.sh (if tag not created)"
    echo "2. Create GitHub release using RELEASE_NOTES.md"
    echo "3. Verify release at: https://github.com/eplt/RAG_Ollama_Mac/releases"
    exit 0
else
    echo "❌ Found $ERRORS error(s). Please fix before releasing."
    exit 1
fi
