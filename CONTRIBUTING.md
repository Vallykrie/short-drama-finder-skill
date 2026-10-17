# Contributing to short-drama-finder

Thanks for helping people find the dramas they love. Contributions of every size are welcome.

## Good first contributions
- **New platforms or aggregators:** add a short-drama app, catalog, or aggregator to the search queries in `SKILL.md`.
- **Trope translations:** add English-to-Chinese trope mappings (for example `Contract marriage` → `契约婚姻` / `闪婚`) to Step 2, Method B.
- **Languages:** add triggers and search patterns for Spanish, Portuguese, Thai, Vietnamese, Arabic, and others.
- **Test cases:** add a real query and the verified result to `examples/sample-queries.md`.

## How to change the skill
1. Edit **`SKILL.md` only**. It is the single source of truth.
2. Run `scripts/sync-wrappers.sh` to regenerate `AGENTS.md`, the Kiro steering file, the Cursor and Windsurf rules, and the `/search-short-drama` command.
3. Run `scripts/install.sh --workspace` in a scratch folder and try a query in your agent.
4. Open a pull request that describes what changed and which agent you tested with.

## Ground rules
- Never add instructions to fabricate links, bypass paywalls or DRM, or download copyrighted video.
- Keep official and licensed sources listed before third-party mirrors.
- Keep the output format in `SKILL.md` § 3 stable: people and tools rely on it.
