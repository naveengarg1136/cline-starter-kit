#!/usr/bin/env bash
# ============================================================================
# setup-new-project.sh
# Cline Starter Kit — New Project Setup Script (Bash)
# ============================================================================
# This script copies the Cline configuration files (.clinerules/, memory-bank/,
# .clineignore, and mcp-settings) into a target directory to bootstrap a new
# Cline-powered project.
#
# Usage:
#   bash setup-new-project.sh [target-directory]
#
# If no target directory is provided, the current working directory (.) is used.
#
# Prerequisites:
#   - Bash 4.0+ (or Git Bash / WSL on Windows)
#   - The script must be run from a copy of the Cline Starter Kit repository
#     (or from the template directory itself).
# ============================================================================

set -euo pipefail  # Exit on error, undefined variable, or pipe failure

# --- Resolve the Starter Kit root directory ---
# The script assumes it lives in the "scripts/" subdirectory of the Starter Kit.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STARTER_KIT_DIR="$(dirname "$SCRIPT_DIR")"

# --- Determine the target directory ---
# Use the first argument if provided; default to the current directory.
if [ "$#" -ge 1 ]; then
    TARGET_DIR="$1"
else
    TARGET_DIR="."
fi

# --- Resolve the target to an absolute path ---
TARGET_DIR="$(cd "$TARGET_DIR" 2>/dev/null && pwd || echo "$TARGET_DIR")"

# --- Validate that the target directory exists or can be created ---
if [ ! -d "$TARGET_DIR" ]; then
    echo ">>> Target directory does not exist. Creating: $TARGET_DIR"
    mkdir -p "$TARGET_DIR" || {
        echo "❌ Error: Failed to create target directory: $TARGET_DIR" >&2
        exit 1
    }
fi

# --- Validate that the source files exist ---
echo ">>> Verifying source files in: $STARTER_KIT_DIR"

check_source() {
    local src_path="$1"
    if [ ! -e "$src_path" ]; then
        echo "❌ Error: Required source not found: $src_path" >&2
        exit 1
    fi
}

check_source "$STARTER_KIT_DIR/.clinerules"
check_source "$STARTER_KIT_DIR/memory-bank"
check_source "$STARTER_KIT_DIR/.clineignore"
check_source "$STARTER_KIT_DIR/mcp-settings/cline_mcp_settings.json"

# --- Copy files to the target directory ---
echo ""
echo ">>> Copying files to: $TARGET_DIR"
echo ""

# Copy .clinerules/ — Cline behavioral rules
echo "  ✓ Copying .clinerules/"
cp -r "$STARTER_KIT_DIR/.clinerules" "$TARGET_DIR/.clinerules"

# Copy memory-bank/ — project context templates
echo "  ✓ Copying memory-bank/"
cp -r "$STARTER_KIT_DIR/memory-bank" "$TARGET_DIR/memory-bank"

# Copy .clineignore — Cline-specific ignore patterns
echo "  ✓ Copying .clineignore"
cp "$STARTER_KIT_DIR/.clineignore" "$TARGET_DIR/.clineignore"

# Copy .gitignore — general ignore patterns
echo "  ✓ Copying .gitignore"
cp "$STARTER_KIT_DIR/.gitignore" "$TARGET_DIR/.gitignore"

# Copy MCP settings — model context protocol server configuration
echo "  ✓ Copying mcp-settings/cline_mcp_settings.json → mcp_settings.json"
cp "$STARTER_KIT_DIR/mcp-settings/cline_mcp_settings.json" "$TARGET_DIR/mcp_settings.json"

# --- Print success message ---
echo ""
echo "════════════════════════════════════════════════════════════════════════"
echo "✅  Cline Starter Kit setup complete!"
echo "════════════════════════════════════════════════════════════════════════"
echo ""
echo "  Files copied to: $TARGET_DIR"
echo ""
echo "  Next steps:"
echo "  1. Open the project in VS Code with the Cline extension installed."
echo "  2. Edit the memory-bank/*.md files to describe your project."
echo "  3. Update mcp_settings.json — set correct paths and install MCP servers."
echo "     See: https://github.com/modelcontextprotocol/servers"
echo "  4. Initialize a git repository (if not already done):"
echo "     git init && git add . && git commit -m \"chore: initial project setup\""
echo "  5. Start building! Cline will read .clinerules/ and memory-bank/ automatically."
echo ""
echo "  ⚠️  Remember: Edit mcp_settings.json to update paths and env variables."
echo ""
