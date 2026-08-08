# AGENTS.md

## Commit and pull request titles

Use Conventional Commits **without a scope in parentheses**.

Format:

```text
<type>: <Description>
```

Rules:

- Use a short type such as `fix`, `feat`, `ci`, `docs`, `chore`, or `refactor`
- Do **not** use scoped prefixes; put the target in the description instead
- Start the description with an uppercase letter
- Keep the subject concise; put details in the commit body or PR description when needed

Examples:

```text
fix: Work around missing ros-gz metapackage on Rolling
ci: Pin GitHub Actions to patch versions
docs: Add AGENTS.md with commit message conventions
```

Exception: Dependabot may generate `chore(deps): ...` titles. Leave those unchanged unless intentionally changing Dependabot config.

Pull request titles follow the same format as commit subjects.
