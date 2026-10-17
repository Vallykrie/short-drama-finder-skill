<div align="center">

# 🎬 Short Drama Finder: AI Agent Skill for Finding Full Short Dramas

**Saw a viral short drama clip on TikTok, Reels, or YouTube Shorts and want the full series?**
Hand your AI agent the title, link, screenshot, or a vague plot, and it finds the real name, the original Chinese title (《...》), and where to watch every episode.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Agent Skill](https://img.shields.io/badge/Agent%20Skill-SKILL.md-blue)](SKILL.md)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-supported-orange)](#-supported-agents)
[![Codex](https://img.shields.io/badge/OpenAI%20Codex-supported-black)](#-supported-agents)
[![Antigravity](https://img.shields.io/badge/Antigravity-supported-4285F4)](#-supported-agents)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

**Short drama finder** · **micro-drama finder** · **AI short drama search** · **短剧 / AI短剧 / 漫剧 finder** · **cari drama pendek**

</div>

---

## 📖 What is Short Drama Finder?

**Short Drama Finder** (`short-drama-finder`) is a free, open-source **agent skill** that turns AI coding and research agents (**Claude Code, OpenAI Codex, Google Antigravity, OpenCode, Kiro, Cursor, and Windsurf**) into a specialist for identifying **vertical short dramas**, **micro-dramas**, and **AI-generated short dramas** (Chinese *Duanju* 短剧, *AI短剧*, and *漫剧*).

Short-drama clips go viral every day on TikTok, Instagram Reels, YouTube Shorts, and Facebook Reels, but re-uploaders often hide or fake the real title. This skill gives your agent a step-by-step OSINT method to:

- 🔍 **Identify the drama** from a title, a social media link, a screenshot, or a half-remembered plot.
- 🀄 **Find the original Chinese catalog title (《...》)**, the stable ID that works across every platform and re-upload.
- 🏢 **Name the studio and platform**: ReelShort, DramaBox, ShortMax, DramaWave, Vigloo, KalosTV, MoboReels, Hongguo (红果短剧), Kuaishou (快手), and more.
- 🤖 **Classify how it was made**: AI face-swap live-action, full-stack AI video, AI pet / manhua drama, or traditional live-action.
- 🔗 **Return verified watch links** in three tiers (official app, global free mirrors and compilations, Chinese raw catalog), plus **copy-paste search strings** for when mirrors move.

No API keys, servers, or dependencies. It is a single Markdown skill file that works with any agent that can search the web.

## ✨ Features

| Feature | What it does |
|---|---|
| **Any input** | Titles in English, Indonesian, Spanish, or Portuguese; TikTok, Reels, Shorts, or FB links; screenshots; plot descriptions |
| **Screenshot OCR** | Reads subtitles, system UI boxes like `[Affection +15]`, and platform watermarks |
| **Fake-title detection** | Cross-checks character names and plot hooks against real catalogs, because re-uploaders rename clips |
| **Chinese title discovery** | Bilingual aggregator lookup, plus trope-to-Chinese keyword translation (`好感度`, `系统`, `首富`, `重生`, `赘婿`...) |
| **3-tier link search** | Official platform → global free mirrors → Chinese raw catalog |
| **Production type** | Tells you if it is AI face-swap, full-stack AI (SkyReels, Seedance, Kling), AI pet / manhua, or live-action |
| **No fake links** | The agent only shows URLs it verified in the current turn, and labels unofficial sources |
| **Multilingual replies** | Answers in your language; triggers on Indonesian requests like *"cari drama pendek"* and *"nonton full episode"* |
| **Manual slash command** | Run `/search-short-drama <query>` any time the skill does not start on its own |

## ⚡ Quick Install (one line)

```bash
git clone https://github.com/Vallykrie/short-drama-finder-skill.git && cd short-drama-finder-skill && ./scripts/install.sh
```

This installs the skill **globally** for Antigravity, Claude Code, OpenAI Codex, OpenCode, and Kiro.

To install it **into one project only** (this also adds the Cursor and Windsurf rules):

```bash
cd /path/to/your/project && /path/to/short-drama-finder-skill/scripts/install.sh --workspace
```

To remove it:

```bash
./scripts/install.sh --uninstall
```

## 🧩 Supported Agents

| Agent | Workspace Path (Project-level) | Global Path (User-level) |
|---|---|---|
| **Antigravity** | `.agent/skills/short-drama-finder/SKILL.md` | `~/.gemini/antigravity/skills/short-drama-finder/SKILL.md` |
| **Claude Code** | `.claude/skills/short-drama-finder/SKILL.md` | `~/.claude/skills/short-drama-finder/SKILL.md` |
| **OpenAI Codex** | `.codex/skills/short-drama-finder/SKILL.md` *(or append [`AGENTS.md`](AGENTS.md))* | `~/.codex/skills/short-drama-finder/SKILL.md` |
| **OpenCode** | `.opencode/skills/short-drama-finder/SKILL.md` | `~/.config/opencode/skills/short-drama-finder/SKILL.md` |
| **Kiro** | `.kiro/steering/short-drama-finder.md` | `~/.kiro/steering/short-drama-finder.md` |
| **Cursor** | `.cursor/rules/short-drama-finder.mdc` | *(project-level only)* |
| **Windsurf** | `.windsurf/rules/short-drama-finder.md` | *(project-level only)* |

**Manual install:** copy [`SKILL.md`](SKILL.md) to the path for your agent in the table above. For Kiro, Cursor, and Windsurf, copy the matching ready-made file from [`.kiro/`](.kiro/steering/short-drama-finder.md), [`.cursor/`](.cursor/rules/short-drama-finder.mdc), or [`.windsurf/`](.windsurf/rules/short-drama-finder.md).

> **Kiro tip:** the steering file uses manual inclusion. Type `#short-drama-finder` in chat to load it.

### ⌨️ `/search-short-drama` slash command

The installer also adds a **`/search-short-drama`** command, so you can run the skill by hand if your agent does not pick it up on its own. The command file embeds the full skill, so it works even when the skill was not loaded.

| Agent | How to run it | Global path | Workspace path |
|---|---|---|---|
| **Claude Code** | `/search-short-drama <query>` | `~/.claude/commands/search-short-drama.md` | `.claude/commands/search-short-drama.md` |
| **OpenAI Codex** | `/prompts:search-short-drama <query>` | `~/.codex/prompts/search-short-drama.md` | *(global only)* |
| **OpenCode** | `/search-short-drama <query>` | `~/.config/opencode/commands/search-short-drama.md` | `.opencode/commands/search-short-drama.md` |
| **Antigravity** | `/search-short-drama <query>` | `~/.gemini/antigravity/global_workflows/search-short-drama.md` | `.agent/workflows/search-short-drama.md` |
| **Cursor** | `/search-short-drama <query>` | `~/.cursor/commands/search-short-drama.md` | `.cursor/commands/search-short-drama.md` |
| **Windsurf** | `/search-short-drama <query>` | *(workspace only)* | `.windsurf/workflows/search-short-drama.md` |
| **Kiro** | `#short-drama-finder <query>` | *(uses the steering file)* | *(uses the steering file)* |

**Manual install:** copy [`commands/search-short-drama.md`](commands/search-short-drama.md) to the path for your agent. Restart Codex after adding it.

## 🚀 Usage

After installing, just ask your agent in plain language:

```text
Where can I watch the full series of "I Got Three Girlfriends From the System"?
```

```text
What drama is this? https://www.tiktok.com/@user/video/1234567890
```

```text
There's an AI drama where a guy in ancient Sparta gets modern weapons every time a girl likes him more. What's it called?
```

```text
Cari drama pendek "Istri Tersembunyi Sang CEO", nonton full episode sub indo di mana?
```

If the skill does not start on its own, run it manually with the slash command:

```text
/search-short-drama I Got Three Girlfriends From the System
```

More examples live in [`examples/sample-queries.md`](examples/sample-queries.md).

### Example output

```markdown
### 🎬 Drama Identified: I Got Three Girlfriends From the System
* **Original Chinese Title:** `《好感度越高，武器越猛》` *(Hǎogǎndù yuè gāo, wǔqì yuè měng: "The Higher the Affection, the Stronger the Weapons")*
* **Episodes:** [verified episode count]
* **Production Type:** Type 2: Full-Stack AI Series
* **Studio / Platform:** DramaWave
* **Match Confidence:** High (character names + system mechanic match)

### 🔗 Where to Watch the Full Series
#### 📱 1. Official Platform Source
#### 🌐 2. Free Global Web Mirrors & Compilations
#### 🟢 3. Chinese Raw / Original Catalog
#### 🔎 Copy-Paste Search Strings
* `《好感度越高，武器越猛》 全集`

### 🧠 Story & Production Backstory
A "cultural reskin" of a Chinese system-novel trope, moved from imperial China to ancient Sparta...
```

*(Illustrative only: the real answer contains links your agent verified at the time you asked.)*

## 🧠 How It Works

1. **Extract clues.** OCR the screenshot, read the caption, hashtags, and pinned comment, or pull character names, the core hook, and the episode count from your description.
2. **Resolve the official title.** Targeted `site:` searches across short-drama aggregators and official platforms, with a disambiguation check for look-alike titles.
3. **Find the original Chinese title (《...》).** Bilingual catalog lookup first, then trope-to-Chinese keyword translation.
4. **Search three tiers of sources** using both the English and Chinese titles.
5. **Classify the production type** into one of four industry archetypes.
6. **Answer in a fixed, scannable format** with only verified links.

The full instructions are in [`SKILL.md`](SKILL.md).

## 🗂️ Repository Structure

```text
short-drama-finder-skill/
├── SKILL.md                         # The skill: single source of truth
├── AGENTS.md                        # Codex / generic-agent version (generated)
├── .kiro/steering/short-drama-finder.md     # Kiro steering file (generated)
├── .cursor/rules/short-drama-finder.mdc     # Cursor rule (generated)
├── .windsurf/rules/short-drama-finder.md    # Windsurf rule (generated)
├── commands/search-short-drama.md   # /search-short-drama slash command (generated)
├── scripts/
│   ├── install.sh                   # Multi-agent installer (global / workspace / uninstall)
│   └── sync-wrappers.sh             # Regenerates the wrapper files from SKILL.md
├── examples/sample-queries.md       # Example inputs for every input type
├── CONTRIBUTING.md
├── LICENSE                          # MIT
└── README.md
```

## ❓ FAQ

**How do I find the full version of a short drama I saw on TikTok?**
Install this skill, then paste the TikTok link (or a screenshot) into your AI agent and ask "what drama is this?". The agent reads the caption and on-screen clues, matches them against short-drama catalogs, and returns the real title and where to watch all episodes.

**Why does the original Chinese title matter?**
Most vertical short dramas and AI short dramas are produced in China first and then localized. The Chinese title (《...》) stays the same across every platform, dub, and re-upload, so it is the most reliable key for finding the complete series.

**What is an AI short drama (AI短剧)?**
A micro-drama made partly or fully with generative AI: face-swapped and AI-dubbed live action, fully AI-generated video, or AI-animated manhua and pet dramas. The skill tells you which kind you are watching.

**Which short drama apps does it know about?**
ReelShort, DramaBox, ShortMax, DramaWave, Vigloo, KalosTV, MoboReels, PineDrama, Hongguo (红果短剧), Kuaishou (快手), plus aggregators such as DramaTip, VerticalShorts, DramaFinds, and HuangguoDrama.

**Does it need an API key or a paid service?**
No. It is a plain Markdown skill. Your agent only needs web search and web browsing tools.

**Will it invent links?**
It is instructed never to. It only outputs URLs it verified during the current turn, and otherwise gives you a search string to use.

**Does it work in Indonesian?** *(Apakah bisa dipakai dalam Bahasa Indonesia?)*
Yes. Ask *"cari drama pendek ..."* or *"nonton full episode ... sub indo"* and it replies in Indonesian.

## ⚖️ Responsible Use

This skill helps you **identify** dramas and **find where they are available**. It lists official and licensed sources first and labels third-party mirrors as unofficial. It never gives instructions for downloading, bypassing paywalls, or removing DRM. Please support the studios and platforms that make the shows you enjoy, and follow the copyright laws where you live.

## 🤝 Contributing

New platforms, trope translations, languages, and test cases are all welcome. See [CONTRIBUTING.md](CONTRIBUTING.md). Edit `SKILL.md`, then run `scripts/sync-wrappers.sh` to regenerate the other agent files.

## 📄 License

[MIT](LICENSE). Free to use, modify, and share.

---

<sub>**Keywords:** short drama finder, find short drama, micro drama finder, vertical drama, AI short drama, AI drama finder, duanju, 短剧, AI短剧, 漫剧, 短剧全集, find full series, full episodes, where to watch short drama, TikTok drama name, Reels drama title, YouTube Shorts drama, ReelShort, DramaBox, ShortMax, DramaWave, Hongguo 红果短剧, cari drama pendek, nonton full episode, drama China sub indo, agent skill, Claude Code skill, Codex skill, Antigravity skill, OpenCode skill, Kiro steering, Cursor rules, Windsurf rules, Windsurf workflows, slash command, /search-short-drama, search short drama, SKILL.md</sub>
