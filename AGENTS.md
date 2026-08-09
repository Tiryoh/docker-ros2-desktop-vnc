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

## GitHub Actions pins

Pin third-party Actions to patch releases:

```yaml
uses: actions/checkout@v7.0.1
```

Exception: pin `aquasecurity/trivy-action` to a commit SHA, and keep the version in a comment:

```yaml
# aquasecurity/trivy-action@v0.36.0
uses: aquasecurity/trivy-action@ed142fd0673e97e23eac54620cfb913e5ce36c25
```

Do not use floating refs such as `@v7`, `@main`, `@master`, or `@beta` for third-party Actions.

## Dockerfile: ros-apt-source

When a Dockerfile installs ROS via `ros-apt-source`, pin the version with `ARG ROS_APT_SOURCE_VERSION=...`.
Do not resolve `releases/latest` at image build time.

Updates are handled by `.github/workflows/update-ros-apt-source.yml` (monthly / manual).

## README: seccomp workaround

Do not add `--security-opt seccomp=unconfined` to the default Quick Start `docker run` command.
Keep the troubleshooting explanation that documents when and why that option may be needed.
