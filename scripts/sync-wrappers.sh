#!/usr/bin/env bash
# Regenerates the per-agent wrapper files from SKILL.md (the single source of truth).
# Run this after editing SKILL.md, then commit the results.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL="$ROOT/SKILL.md"
NAME="short-drama-finder"
DESC="Find the full series of viral short dramas / micro-dramas / AI short dramas (短剧, AI短剧) from a title, TikTok/Reels/Shorts link, screenshot, or plot: original Chinese title, studio, production type, and verified watch links."

# SKILL.md without its YAML frontmatter.
body() {
  awk 'NR==1 && /^---$/ {fm=1; next} fm && /^---$/ {fm=0; next} !fm' "$SKILL"
}

notice="<!-- Generated from SKILL.md by scripts/sync-wrappers.sh. Do not edit by hand. -->"

# AGENTS.md: OpenAI Codex and any agent that reads AGENTS.md.
{
  echo "# AGENTS.md: $NAME"
  echo
  echo "$notice"
  echo
  echo "> When the user asks to identify a short drama, micro-drama, or AI short drama, or asks where to watch its full episodes, follow the instructions below."
  echo
  body
} > "$ROOT/AGENTS.md"

# Kiro steering file (manual inclusion: reference it with #$NAME in chat).
mkdir -p "$ROOT/.kiro/steering"
{
  printf -- '---\ninclusion: manual\n---\n\n'
  echo "$notice"
  echo
  body
} > "$ROOT/.kiro/steering/$NAME.md"

# Cursor project rule (agent-requested: applied when the description matches).
mkdir -p "$ROOT/.cursor/rules"
{
  printf -- '---\ndescription: "%s"\nglobs:\nalwaysApply: false\n---\n\n' "$DESC"
  echo "$notice"
  echo
  body
} > "$ROOT/.cursor/rules/$NAME.mdc"

# Windsurf workspace rule (model decision: applied when the description matches).
mkdir -p "$ROOT/.windsurf/rules"
{
  printf -- '---\ntrigger: model_decision\ndescription: "%s"\n---\n\n' "$DESC"
  echo "$notice"
  echo
  body
} > "$ROOT/.windsurf/rules/$NAME.md"

# /search-short-drama: manual slash command / workflow for agents that support them.
# Self-contained (embeds the full skill) so it works even when the skill did not load.
CMD="search-short-drama"
mkdir -p "$ROOT/commands"
{
  printf -- '---\ndescription: "Search for a short drama / micro-drama / AI short drama and where to watch the full series (manually runs the %s skill)."\nargument-hint: "<title | TikTok/Reels/Shorts link | screenshot | plot description>"\n---\n\n' "$NAME"
  echo "$notice"
  echo
  echo "Run the **$NAME** skill now on this query:"
  echo
  echo '> $ARGUMENTS'
  echo
  echo "If the line above is empty or still shows a literal \`\$ARGUMENTS\` placeholder, use the text, link, or image the user sent with this command. If there is none, ask the user for a drama title, video link, screenshot, or plot description, then continue."
  echo
  echo "Follow every step below and answer in the required output format."
  echo
  body
} > "$ROOT/commands/$CMD.md"

echo "Wrappers regenerated from SKILL.md."
