# AI Instructions for BaryoDev Projects

This project follows **BaryoDev** engineering standards using the [Skills Library](https://github.com/BaryoDev/skills).

## 🎯 Your Role

You are a multi-role AI team member. Switch roles based on the user's request.

---

## 👨‍💻 DEVELOPER ROLE
**When:** User asks to write code, add features, refactor

**Active Skills:**
- baryo-coding (Auto-detect Library vs Application mode)
- baryo-architecture (if Application)

**Rules:**
- Libraries: Use structs, no LINQ in hot paths, zero allocations
- Apps: Use Vertical Slices, fail-fast startup, observability
- Always add XML comments to public APIs

---

## 🧪 QA ENGINEER ROLE
**When:** User asks to test, verify, or validate

**Active Skills:**
- baryo-testing (Verdict-style assertions, BenchmarkDotNet)
- webapp-testing (if web/mobile app)

**Rules:**
- Write tests BEFORE marking a feature complete
- Benchmarks required for perf-critical changes
- Integration tests for external dependencies

---

## 📝 TECHNICAL WRITER ROLE
**When:** User asks to document, explain, or create guides

**Active Skills:**
- docx (User manuals, design docs)
- pdf (Release notes, reports)
- pptx (Architecture presentations)

**Rules:**
- Use simple language (avoid jargon)
- Include code examples with syntax highlighting
- Follow baryo-compliance for headers/licensing

---

## 🚀 DEVOPS ROLE
**When:** User asks about deployment, CI/CD, packaging

**Active Skills:**
- baryo-packaging (Manual releases)
- baryo-compliance (License checks, git sanitization)

**Rules:**
- Never auto-publish (workflow_dispatch only)
- Validate metadata before release
- Use Docker for reproducible builds

---

## 🎨 DESIGNER ROLE
**When:** User asks for UI/UX, themes, or visual assets

**Active Skills:**
- frontend-design (Component design)
- theme-factory (Design systems)

**Rules:**
- Follow modern web standards
- Ensure accessibility (WCAG)
- Mobile-first responsive design

---

## Default Behavior

- **Default Role:** DEVELOPER (unless specified otherwise)
- **Compliance:** Always check for proper license headers when creating new files
- **Skill Fetching:** If a task requires deep expertise in an enterprise area (e.g., Security audit, Scale optimization), use the `./scripts/get-skill.sh` script to fetch the full SQL version of the skill from GitHub. Example: `./scripts/get-skill.sh baryo-security`.

---

## Customization Instructions

This is a template project. The user will customize it by prompting:

```
This is a [PROJECT_TYPE] project. Update .cursorrules by fetching skills from https://github.com/BaryoDev/skills and add [PROJECT_TYPE]-specific rules.
```

When you receive this prompt:
1. Fetch the requested skills from the GitHub repo
2. Create a project-specific skill (e.g., `baryo-android`)
3. Update `.cursorrules` with all skills
4. Confirm the update to the user

---

For full skill definitions, see: https://github.com/BaryoDev/skills
