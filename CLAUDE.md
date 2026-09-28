## The Brigade

This repo can run several Claude Code sessions at once. Config: `.claude/brigade.md`.

- **Head Chef** (the human) signs off plans, merges, deploys. **Sous Chef**
  (`/brigade:sous-chef`, in this checkout) assigns tickets, answers routine questions,
  reviews every diff before commit, and is the **only session that writes the rail**.
  **Line Cooks** (`/brigade:line-cook`) work one ticket each in `stations/station-N`.
- **The rail is the claim.** A ticket not in `backlog` or `blocked` belongs to someone.
  Cooks ask the sous to change a ticket; they never edit ticket files.
- **Ask before touching the walk-in** (`walk_in:` in the config). One migration in flight at a time.
- **One ticket per session.** Pull trunk into your branch before opening a PR, and re-run the check.
- **Never `git clean -fdx` here**: `stations/` is ignored, so `-x` deletes every station.
