# Owain Codex Real Workflow

Source:

- https://www.youtube.com/watch?v=DLSK4wLK544
- https://github.com/owainlewis/youtube-tutorials/tree/main/tutorials/codex-for-developers

## Main Lesson

Codex is not the workflow. Codex is the execution layer inside a professional
workflow.

The real leverage comes from shaping the work:

```text
ticket -> context -> plan -> implementation -> diff review -> verification -> PR
```

## What Matters

- Use `AGENTS.md` for project context and workflow rules.
- Keep instructions short and high-signal.
- Use local mode for small supervised changes.
- Use worktrees for isolated parallel work.
- Review diffs like a real code review.
- Use comments and iteration instead of accepting whole outputs blindly.
- Use plugins when they remove context switching.
- Use automations for repeatable maintenance.

## What To Practice

1. Start every project with a compact `AGENTS.md`.
2. Turn vague work into a small task before asking Codex to build.
3. Review generated diffs before accepting.
4. Run verification commands and record what passed.
5. Reflect on what instruction would have produced a better result.

## Repo Action

This repository should preserve the workflow as templates and repeated
practice, then prove it through real projects in `projects/`.
