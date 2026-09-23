<#
# ============================================================================
# setup-new-project.ps1
# Cline Starter Kit — New Project Setup Script (PowerShell)
# ============================================================================
# This script copies the Cline configuration files (.clinerules/, memory-bank/,
# .clineignore, .gitignore, and mcp-settings) into a target directory to
# bootstrap a new Cline-powered project.
#
# Usage:
#   .\setup-new-project.ps1 [-TargetDir <path>]
#
# If no target directory is provided, the current directory (.) is used.
#
# Prerequisites:
#   - PowerShell 5.0+
#   - The script must be run from a copy of the Cline Starter Kit repository
#     (or from the template directory itself).
# ============================================================================
#>

param(
    [Parameter(Position = 0)]
    [string]$TargetDir = "."
)

# --- Enable strict mode for safer scripting ---
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# --- Resolve the Starter Kit root directory ---
# The script assumes it lives in the "scripts/" subdirectory of the Starter Kit.
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$StarterKitDir = Split-Path -Parent $ScriptDir

# --- Resolve the target to an absolute path ---
$TargetDir = (Resolve-Path -Path $TargetDir -ErrorAction SilentlyContinue).Path
if (-not $TargetDir) {
    # Target does not exist yet — create it
    Write-Host ">>> Target directory does not exist. Creating: $TargetDir"
    try {
        $TargetDir = (New-Item -ItemType Directory -Path $TargetDir -Force | Select-Object -ExpandProperty FullName)
    } catch {
        Write-Error "❌ Failed to create target directory: $($_.Exception.Message)"
        exit 1
    }
}

# --- Validate that the source files exist ---
Write-Host ">>> Verifying source files in: $StarterKitDir"

function Check-Source {
    param([string]$Path)
    if (-not (Test-Path $Path)) {
        Write-Error "❌ Required source not found: $Path"
        exit 1
    }
}

Check-Source "$StarterKitDir\.clinerules"
Check-Source "$StarterKitDir\memory-bank"
Check-Source "$StarterKitDir\.clineignore"
Check-Source "$StarterKitDir\.gitignore"
Check-Source "$StarterKitDir\mcp-settings\cline_mcp_settings.json"

# --- Copy files to the target directory ---
Write-Host ""
Write-Host ">>> Copying files to: $TargetDir"
Write-Host ""

function Copy-ItemWithMessage {
    param(
        [string]$Source,
        [string]$Destination,
        [string]$Label
    )
    try {
        Copy-Item -Path $Source -Destination $Destination -Recurse -Force
        Write-Host "  ✅ Copying $Label"
    } catch {
        Write-Error "❌ Failed to copy $Label: $($_.Exception.Message)"
        exit 1
    }
}

# Copy .clinerules/ — Cline behavioral rules
Copy-ItemWithMessage `
    "$StarterKitDir\.clinerules" `
    "$TargetDir\.clinerules" `
    ".clinerules/"

# Copy memory-bank/ — project context templates
Copy-ItemWithMessage `
    "$StarterKitDir\memory-bank" `
    "$TargetDir\memory-bank" `
    "memory-bank/"

# Copy .clineignore — Cline-specific ignore patterns
Copy-ItemWithMessage `
    "$StarterKitDir\.clineignore" `
    "$TargetDir\.clineignore" `
    ".clineignore"

# Copy .gitignore — general ignore patterns
Copy-ItemWithMessage `
    "$StarterKitDir\.gitignore" `
    "$TargetDir\.gitignore" `
    ".gitignore"

# Copy MCP settings — model context protocol server configuration
Copy-ItemWithMessage `
    "$StarterKitDir\mcp-settings\cline_mcp_settings.json" `
    "$TargetDir\mcp_settings.json" `
    "mcp-settings/cline_mcp_settings.json → mcp_settings.json"

# --- Print success message ---
Write-Host ""
Write-Host "════════════════════════════════════════════════════════════════════════"
Write-Host "✅  Cline Starter Kit setup complete!"
Write-Host "════════════════════════════════════════════════════════════════════════"
Write-Host ""
Write-Host "  Files copied to: $TargetDir"
Write-Host ""
Write-Host "  Next steps:"
Write-Host "  1. Open the project in VS Code with the Cline extension installed."
Write-Host "  2. Edit the memory-bank/*.md files to describe your project."
Write-Host "  3. Update mcp_settings.json — set correct paths and install MCP servers."
Write-Host "     See: https://github.com/modelcontextprotocol/servers"
Write-Host "  4. Initialize a git repository (if not already done):"
Write-Host "     git init && git add . && git commit -m 'chore: initial project setup'"
Write-Host "  5. Start building! Cline will read .clinerules/ and memory-bank/ automatically."
Write-Host ""
Write-Host "  ⚠️  Remember: Edit mcp_settings.json to update paths and env variables."
Write-Host ""
