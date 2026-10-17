# Sample Queries for `short-drama-finder`

Paste any of these into an agent that has the skill installed. Each one exercises a different input path in [`SKILL.md`](../SKILL.md).

## 1. Localized English title
> Where can I watch the full series of "I Got Three Girlfriends From the System"?

Exercises: Step 1 title resolution, the disambiguation rule (similar titles such as *"Super System Gets Me 3 Girls"*), and Step 2 Chinese title lookup.

## 2. TikTok / Reels / Shorts link
> What drama is this? https://www.tiktok.com/@someuser/video/1234567890

Exercises: caption, hashtag and pinned-comment extraction, plus the warning that re-uploaders often post fake titles.

## 3. Screenshot
> *(attach a screenshot showing subtitles, a `[Affection +15]` system box, and a DramaWave watermark)*
> Find the full episodes of this.

Exercises: OCR of dialogue and system UI, watermark detection, and the visual-style check (full-stack AI or face-swap live-action).

## 4. Vague plot description
> There's an AI drama where a guy in ancient Sparta gets a system that gives him modern weapons every time a girl likes him more. Jason, Cleo and Layla are in it. What's it called?

Exercises: Method B trope-to-Chinese translation (`好感度` + `武器` + `系统`).

## 5. Indonesian request
> Cari drama pendek "Istri Tersembunyi Sang CEO", nonton full episode sub indo di mana?

Exercises: the Indonesian triggers, Tier 2 `sub indo` searches, and replying in the user's language.

## 6. Live-action revenge series
> My mom keeps watching a ReelShort drama about a divorced wife who turns out to be a billionaire heiress. About 80 episodes. Which one is it?

Exercises: episode-count heuristics (live-action is usually 60–100 episodes), Tier 1 official-source lookup, and Type 4 classification.

## 7. AI pet soap opera
> What's the name of that viral AI cat drama where the orange cat gets betrayed by his wife?

Exercises: Type 3 (AI pet / manhua) classification.

## Expected output shape

Every answer follows the fixed layout in [`SKILL.md` § 3](../SKILL.md#3-required-output-format): the identified drama card, three tiers of verified links, copy-paste search strings, and a short production backstory.
