# AGENTS.md

Guidance for coding agents working on this repository.

## Project

Docker images that provide ROS 2 Desktop environments accessible over VNC/noVNC.
Each supported ROS distribution has its own directory (for example `humble/`, `jazzy/`, `rolling/`) with a `Dockerfile` and related files.
CI builds and tests images via GitHub Actions under `.github/`.

## Commit and pull request titles

Use Conventional Commits **without a scope in parentheses**.

Format:

```text
<type>: <Description>
```

Rules:

- Use a short type such as `fix`, `feat`, `ci`, `docs`, `chore`, or `refactor`
- Do **not** use scoped prefixes like `fix(rolling):` or `chore(ci):`
- Put target area details in the description instead (for example `on Rolling`, `for GitHub Actions`)
- Start the description with an uppercase letter
- Keep the subject concise; put details in the commit body or PR description when needed

Examples:

```text
fix: Work around missing ros-gz metapackage on Rolling
ci: Pin GitHub Actions to patch versions
docs: Add AGENTS.md with commit message conventions
```

Exception: Dependabot may continue to generate titles such as `chore(deps): ...`. Do not rewrite those unless you are intentionally changing the Dependabot configuration.

Pull request titles should follow the same format as commit subjects.
