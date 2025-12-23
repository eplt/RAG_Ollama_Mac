# Quick Start: Complete v0.1.0 Release

This is a **quick reference** for completing the v0.1.0 release. For detailed documentation, see [RELEASE_COMPLETION_GUIDE.md](RELEASE_COMPLETION_GUIDE.md).

## ✅ What's Already Done

All release preparation work from PR #1 has been merged to main:
- ✅ Version files and code (`src/__version__.py`)
- ✅ Documentation (README, CHANGELOG, RELEASE_NOTES)
- ✅ License and contributing guidelines
- ✅ All source code is ready

## 🚀 What You Need to Do (2-3 Minutes)

### Step 1: Verify Everything is Ready (Optional)
```bash
./scripts/verify_release.sh
```
Should show: "✅ All checks passed! Release artifacts are ready."

### Step 2: Create and Push the Tag
```bash
./scripts/create_release_tag.sh
```
- Follow the prompts
- Answer "Y" when asked to push to GitHub

### Step 3: Create GitHub Release

**Using GitHub CLI (Recommended):**
```bash
gh release create v0.1.0 \
  --title "v0.1.0 - Initial Public Release" \
  --notes-file RELEASE_NOTES.md \
  --latest
```

**Or via Web Interface:**
1. Go to: https://github.com/eplt/RAG_Ollama_Mac/releases/new
2. Tag: `v0.1.0` (should appear as existing after Step 2)
3. Title: `v0.1.0 - Initial Public Release`
4. Description: Copy from `RELEASE_NOTES.md`
5. Check "Set as the latest release"
6. Click "Publish release"

### Step 4: Verify Release
Visit: https://github.com/eplt/RAG_Ollama_Mac/releases/tag/v0.1.0

---

## 🎉 That's It!

After completing these steps, your v0.1.0 release will be live!

---

## 📚 Additional Documentation

- **Detailed Guide**: [RELEASE_COMPLETION_GUIDE.md](RELEASE_COMPLETION_GUIDE.md)
- **Scripts Help**: [scripts/README.md](scripts/README.md)
- **Release Notes**: [RELEASE_NOTES.md](RELEASE_NOTES.md)
- **Changelog**: [CHANGELOG.md](CHANGELOG.md)

---

## ❓ Troubleshooting

**Q: I don't have `gh` CLI installed**  
A: Use the web interface method in Step 3, or install it:
```bash
# macOS
brew install gh

# Other platforms: https://cli.github.com/
```

**Q: The tag already exists**  
A: The `create_release_tag.sh` script will ask if you want to recreate it.

**Q: I want to make changes before releasing**  
A: Make your changes, commit them, and merge to main first. Then run the release process.

---

## 🔄 For Future Releases

1. Update `src/__version__.py` with new version
2. Add section to `CHANGELOG.md`
3. Update release notes
4. Change `VERSION` in `scripts/create_release_tag.sh`
5. Follow these same steps
