#!/usr/bin/env bash
# Universal installer for the short-drama-finder agent skill.
#
# Usage:
#   scripts/install.sh               Install globally for every supported agent (default)
#   scripts/install.sh --global      Same as above
#   scripts/install.sh --workspace   Install into the current directory (project-level)
#   scripts/install.sh --uninstall [--workspace]   Remove the installed files
#   scripts/install.sh --help
set -euo pipefail

SKILL_NAME="short-drama-finder"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL_SOURCE="$REPO_DIR/SKILL.md"
KIRO_SOURCE="$REPO_DIR/.kiro/steering/$SKILL_NAME.md"
CURSOR_SOURCE="$REPO_DIR/.cursor/rules/$SKILL_NAME.mdc"
WINDSURF_SOURCE="$REPO_DIR/.windsurf/rules/$SKILL_NAME.md"
CMD_NAME="search-short-drama"
CMD_SOURCE="$REPO_DIR/commands/$CMD_NAME.md"

MODE="--global"
ACTION="install"
for arg in "$@"; do
  case "$arg" in
    --global|--workspace) MODE="$arg" ;;
    --uninstall) ACTION="uninstall" ;;
    -h|--help) sed -n '2,10p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "Unknown option: $arg (see --help)" >&2; exit 1 ;;
  esac
done

for f in "$SKILL_SOURCE" "$KIRO_SOURCE" "$CURSOR_SOURCE" "$WINDSURF_SOURCE" "$CMD_SOURCE"; do
  [ -f "$f" ] || { echo "Missing $f. Run scripts/sync-wrappers.sh first." >&2; exit 1; }
done

install_target() {
  local agent_name="$1" source="$2" target_dir="$3" target_file="$4"
  if [ "$ACTION" = "uninstall" ]; then
    if [ -f "$target_dir/$target_file" ]; then
      rm "$target_dir/$target_file"
      rmdir "$target_dir" 2>/dev/null || true
      echo "  🗑️  Removed for $agent_name -> $target_dir/$target_file"
    fi
    return
  fi
  mkdir -p "$target_dir"
  cp "$source" "$target_dir/$target_file"
  echo "  ✅ Installed for $agent_name -> $target_dir/$target_file"
}

if [ "$ACTION" = "install" ]; then
  echo "🎬 Installing '$SKILL_NAME' across AI coding & research agents..."
else
  echo "🧹 Uninstalling '$SKILL_NAME'..."
fi

if [ "$MODE" = "--workspace" ]; then
  echo "📂 Mode: Current Workspace ($(pwd))"
  install_target "Antigravity (Workspace)" "$SKILL_SOURCE"    "./.agent/skills/$SKILL_NAME"    "SKILL.md"
  install_target "Claude Code (Workspace)" "$SKILL_SOURCE"    "./.claude/skills/$SKILL_NAME"   "SKILL.md"
  install_target "OpenAI Codex (Workspace)" "$SKILL_SOURCE"   "./.codex/skills/$SKILL_NAME"    "SKILL.md"
  install_target "OpenCode (Workspace)"    "$SKILL_SOURCE"    "./.opencode/skills/$SKILL_NAME" "SKILL.md"
  install_target "Kiro (Workspace)"        "$KIRO_SOURCE"     "./.kiro/steering"               "$SKILL_NAME.md"
  install_target "Cursor (Workspace)"      "$CURSOR_SOURCE"   "./.cursor/rules"                "$SKILL_NAME.mdc"
  install_target "Windsurf (Workspace)"    "$WINDSURF_SOURCE" "./.windsurf/rules"              "$SKILL_NAME.md"
  echo "⌨️  Slash command /$CMD_NAME:"
  install_target "Claude Code (Workspace)" "$CMD_SOURCE" "./.claude/commands"   "$CMD_NAME.md"
  install_target "OpenCode (Workspace)"    "$CMD_SOURCE" "./.opencode/commands" "$CMD_NAME.md"
  install_target "Antigravity (Workspace)" "$CMD_SOURCE" "./.agent/workflows"   "$CMD_NAME.md"
  install_target "Cursor (Workspace)"      "$CMD_SOURCE" "./.cursor/commands"   "$CMD_NAME.md"
  install_target "Windsurf (Workspace)"    "$CMD_SOURCE" "./.windsurf/workflows" "$CMD_NAME.md"
else
  echo "🌍 Mode: Global User Profile ($HOME)"
  install_target "Antigravity (Global)" "$SKILL_SOURCE" "$HOME/.gemini/antigravity/skills/$SKILL_NAME" "SKILL.md"
  install_target "Claude Code (Global)" "$SKILL_SOURCE" "$HOME/.claude/skills/$SKILL_NAME"            "SKILL.md"
  install_target "OpenAI Codex (Global)" "$SKILL_SOURCE" "$HOME/.codex/skills/$SKILL_NAME"            "SKILL.md"
  install_target "OpenCode (Global)"    "$SKILL_SOURCE" "$HOME/.config/opencode/skills/$SKILL_NAME"   "SKILL.md"
  install_target "Kiro (Global)"        "$KIRO_SOURCE"  "$HOME/.kiro/steering"                        "$SKILL_NAME.md"
  echo "⌨️  Slash command /$CMD_NAME:"
  install_target "Claude Code (Global)"  "$CMD_SOURCE" "$HOME/.claude/commands"                     "$CMD_NAME.md"
  install_target "OpenAI Codex (Global)" "$CMD_SOURCE" "${CODEX_HOME:-$HOME/.codex}/prompts"        "$CMD_NAME.md"
  install_target "OpenCode (Global)"     "$CMD_SOURCE" "$HOME/.config/opencode/commands"            "$CMD_NAME.md"
  install_target "Antigravity (Global)"  "$CMD_SOURCE" "$HOME/.gemini/antigravity/global_workflows" "$CMD_NAME.md"
  install_target "Cursor (Global)"       "$CMD_SOURCE" "$HOME/.cursor/commands"                     "$CMD_NAME.md"
  echo "  ℹ️  Cursor and Windsurf rules (and the Windsurf workflow) are project-level: run with --workspace inside a project."
  echo "  ℹ️  In Codex the command is /prompts:$CMD_NAME (restart Codex to load it)."
fi

echo ""
if [ "$ACTION" = "install" ]; then
  echo "🚀 Done! Trigger '$SKILL_NAME' in any agent by dropping a drama title, link, screenshot, or plot,"
  echo "   or run it manually with /$CMD_NAME <title | link | plot>."
else
  echo "Done."
fi
