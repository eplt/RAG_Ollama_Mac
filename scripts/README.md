# Release Scripts

This directory contains helper scripts for managing releases of RAG_Ollama_Mac.

## Available Scripts

### `verify_release.sh`

Verifies that all release artifacts are in place and properly configured.

**Usage:**
```bash
./scripts/verify_release.sh
```

**What it checks:**
- Presence of all required documentation files (README, CHANGELOG, LICENSE, etc.)
- Source code files exist and are complete
- Version consistency across all files
- Directory structure is correct
- Git tag status
- GitHub release status (if `gh` CLI is installed)

**Exit codes:**
- `0` - All checks passed
- `1` - One or more checks failed

---

### `create_release_tag.sh`

Interactive script to create and push the v0.1.0 release tag.

**Usage:**
```bash
./scripts/create_release_tag.sh
```

**What it does:**
1. Checks if you're in a git repository
2. Verifies if the tag already exists (offers to recreate if needed)
3. Fetches latest changes from origin
4. Warns if you're not on the main branch
5. Creates an annotated tag with release notes
6. Asks if you want to push the tag to GitHub
7. Provides next steps for creating the GitHub release

**Interactive prompts:**
- Confirms before recreating an existing tag
- Confirms before continuing if not on main branch  
- Asks if you want to push the tag to GitHub

---

## Complete Release Workflow

To complete a release, follow these steps:

### 1. Verify Release Artifacts
```bash
./scripts/verify_release.sh
```

Ensure all checks pass before proceeding.

### 2. Create and Push Tag
```bash
./scripts/create_release_tag.sh
```

Follow the prompts. When asked, choose to push the tag to GitHub.

### 3. Create GitHub Release

**Option A: Web Interface**
1. Go to the URL provided by the script
2. Copy contents from `RELEASE_NOTES.md`
3. Publish the release

**Option B: GitHub CLI**
```bash
gh release create v0.1.0 \
  --title "v0.1.0 - Initial Public Release" \
  --notes-file RELEASE_NOTES.md \
  --latest
```

### 4. Verify Release
- Check the release page on GitHub
- Verify badges in README
- Test cloning the release tag

---

## Troubleshooting

### Tag already exists
If you need to recreate a tag:
```bash
# Delete local tag
git tag -d v0.1.0

# Delete remote tag
git push origin :refs/tags/v0.1.0

# Run create script again
./scripts/create_release_tag.sh
```

### Not on main branch
The scripts work from any branch, but it's recommended to be on main:
```bash
git checkout main
git pull origin main
```

### GitHub CLI not available
If you don't have `gh` CLI installed, you can install it or use the web interface:
- macOS: `brew install gh`
- Other platforms: https://cli.github.com/

---

## For Future Releases

To create a new release (e.g., v0.2.0):

1. Update version in `src/__version__.py`
2. Add new section to `CHANGELOG.md`
3. Update or create new release notes
4. Modify the `VERSION` variable in `create_release_tag.sh`
5. Run the release workflow

---

## Additional Resources

- [Complete Release Guide](../RELEASE_COMPLETION_GUIDE.md)
- [Contributing Guidelines](../CONTRIBUTING.md)
- [Changelog](../CHANGELOG.md)
