# How to Complete the v0.1.0 Release

This guide outlines the steps needed to complete the v0.1.0 release of RAG_Ollama_Mac.

## Current Status

✅ **Completed:**
- All release documentation created (CHANGELOG.md, RELEASE_NOTES.md)
- Version file added (src/__version__.py with version 0.1.0)
- README updated with release information and badges
- LICENSE (MIT) added
- CONTRIBUTING.md guidelines added
- .gitignore configured for Python/ChromaDB projects
- All code and documentation merged to main branch via PR #1

❌ **Remaining Tasks:**

1. **Create Git Tag for v0.1.0**
2. **Publish GitHub Release**
3. **Verify Release Assets**

---

## Step-by-Step Release Process

### 1. Create and Push the Git Tag

The tag should be created on the main branch that contains all the release preparation work from PR #1.

```bash
# Ensure you're on the main branch and up to date
git checkout main
git pull origin main

# Create an annotated tag for v0.1.0
git tag -a v0.1.0 -m "Release version 0.1.0

Initial public release of RAG_Ollama_Mac - a lightweight, private, and customizable retrieval-augmented chatbot running entirely on your Mac.

Key Features:
- Local RAG implementation using Ollama
- PDF document processing and embedding
- ChromaDB vector storage
- Streamlit-based interactive chat interface
- Privacy-focused local execution
- Support for multiple LLM models

See RELEASE_NOTES.md and CHANGELOG.md for detailed information."

# Push the tag to GitHub
git push origin v0.1.0
```

### 2. Create GitHub Release

Once the tag is pushed, create a GitHub Release:

#### Option A: Using GitHub Web Interface

1. Go to https://github.com/eplt/RAG_Ollama_Mac/releases/new
2. Select the tag: `v0.1.0`
3. Set Release title: `v0.1.0 - Initial Public Release`
4. Copy the contents from `RELEASE_NOTES.md` into the release description
5. Check "Set as the latest release"
6. Click "Publish release"

#### Option B: Using GitHub CLI (gh)

```bash
# Create release using the tag and release notes
gh release create v0.1.0 \
  --title "v0.1.0 - Initial Public Release" \
  --notes-file RELEASE_NOTES.md \
  --latest
```

### 3. Verify the Release

After publishing, verify:

1. **GitHub Release Page**: https://github.com/eplt/RAG_Ollama_Mac/releases/tag/v0.1.0
   - Verify release notes are displayed correctly
   - Check that it's marked as "Latest"
   - Ensure the tag points to the correct commit

2. **README Badges**: Visit https://github.com/eplt/RAG_Ollama_Mac
   - Version badge should show v0.1.0
   - License badge should show MIT

3. **Changelog Links**: Verify the link in CHANGELOG.md
   - The link `[0.1.0]: https://github.com/eplt/RAG_Ollama_Mac/releases/tag/v0.1.0` should work

4. **Clone and Test**: Test that users can clone and use the release
   ```bash
   git clone https://github.com/eplt/RAG_Ollama_Mac.git
   cd RAG_Ollama_Mac
   git checkout v0.1.0
   # Verify version
   python3 -c "import sys; sys.path.insert(0, 'src'); from __version__ import __version__; print(__version__)"
   # Should output: 0.1.0
   ```

---

## Post-Release Tasks (Optional)

### Announce the Release

1. **Update Repository Description**: Ensure the GitHub repository description is accurate
2. **Social Media**: Share on relevant platforms if desired
3. **Documentation**: Consider adding a "Releases" or "Versions" section to documentation

### Monitor Initial Feedback

1. Watch for issues reported by early users
2. Be prepared to create a patch release (v0.1.1) if critical bugs are found
3. Document any known issues in the GitHub Issues or README

---

## Rollback Procedure (If Needed)

If you need to rollback or redo the release:

```bash
# Delete the tag locally
git tag -d v0.1.0

# Delete the tag from GitHub
git push origin :refs/tags/v0.1.0

# Delete the GitHub Release via web interface or CLI
gh release delete v0.1.0
```

Then you can make corrections and recreate the release.

---

## Next Release (v0.1.1 or v0.2.0)

For future releases:

1. Update `src/__version__.py` with new version number
2. Add new section to `CHANGELOG.md` with date and changes
3. Update or create new `RELEASE_NOTES.md` for the release
4. Follow the same tagging and release process above

---

## Additional Notes

- **Semantic Versioning**: This project follows [SemVer](https://semver.org/)
  - MAJOR.MINOR.PATCH (e.g., 0.1.0)
  - Increment MAJOR for breaking changes
  - Increment MINOR for new features
  - Increment PATCH for bug fixes

- **Release Artifacts**: No binary artifacts are needed for this release as it's a Python project distributed via Git

- **Documentation**: All release documentation is already in place:
  - `README.md` - Main project documentation
  - `CHANGELOG.md` - Version history in Keep a Changelog format
  - `RELEASE_NOTES.md` - Detailed v0.1.0 release information
  - `CONTRIBUTING.md` - Contribution guidelines
  - `LICENSE` - MIT License text

---

## Questions or Issues?

If you encounter any issues during the release process, refer to:
- [GitHub Docs - Managing Releases](https://docs.github.com/en/repositories/releasing-projects-on-github)
- [GitHub CLI Release Docs](https://cli.github.com/manual/gh_release_create)
