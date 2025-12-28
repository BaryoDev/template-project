# Code Review Standards

## Philosophy

"Code review is not about finding fault. It's about knowledge sharing and maintaining quality."

## Review Checklist

### Functionality
- [ ] Code does what it's supposed to do
- [ ] Edge cases are handled
- [ ] Error handling is appropriate
- [ ] No obvious bugs

### Code Quality (baryo-coding)
- [ ] Follows BaryoDev coding standards
- [ ] No LINQ in hot paths (for libraries)
- [ ] Proper use of structs vs classes
- [ ] No unnecessary allocations
- [ ] Async/sync parity maintained

### Testing (baryo-testing)
- [ ] Unit tests cover new code
- [ ] Tests are meaningful (not just for coverage)
- [ ] Benchmarks included (if performance-critical)
- [ ] Integration tests added (if needed)

### Documentation (baryo-documentation)
- [ ] XML comments on public APIs
- [ ] VitePress docs updated
- [ ] Changelog updated
- [ ] README updated (if needed)

### Security & Compliance (baryo-compliance)
- [ ] No secrets in code
- [ ] License headers present
- [ ] No SQL injection vulnerabilities
- [ ] Input validation present

## Review Process

### 1. Author Prepares PR
```bash
# Before creating PR
git checkout -b feature/my-feature
# Make changes
git add .
git commit -m "feat: add my feature"
git push origin feature/my-feature
```

### 2. Create PR
- Use the PR template
- Fill out all sections
- Link related issues
- Add screenshots/benchmarks

### 3. Automated Checks
Wait for CI to pass:
- [ ] Build succeeds
- [ ] Tests pass
- [ ] Linting passes
- [ ] Coverage threshold met

### 4. Request Review
- Assign 1-2 reviewers
- Tag with appropriate labels
- Set milestone (if applicable)

### 5. Reviewer Responds (Within 24 Hours)
**Review Types**:
- ✅ **Approve**: Ready to merge
- 💬 **Comment**: Suggestions, no blocking issues
- 🚫 **Request Changes**: Must address before merge

### 6. Address Feedback
- Respond to all comments
- Make requested changes
- Re-request review

### 7. Merge
**Merge Strategy**:
- **Squash and Merge**: For feature branches (default)
- **Rebase and Merge**: For clean history
- **Merge Commit**: For release branches

## Comment Etiquette

### For Reviewers

**DO**:
```markdown
✅ "Consider using a struct here for better performance. See baryo-coding skill."
✅ "This could be simplified: [code suggestion]"
✅ "Great use of Expression Trees! 🎉"
```

**DON'T**:
```markdown
❌ "This is wrong."
❌ "Why did you do it this way?"
❌ "I would never write code like this."
```

### For Authors

**DO**:
```markdown
✅ "Good catch! Fixed in abc123"
✅ "I chose this approach because [reason]. Open to alternatives."
✅ "Thanks for the suggestion! Applied."
```

**DON'T**:
```markdown
❌ "This is how I always do it."
❌ "The tests pass, so it's fine."
❌ "I don't have time to change this."
```

## Review Priorities

### P0 (Must Fix)
- Security vulnerabilities
- Breaking changes without migration path
- Failing tests
- Performance regressions

### P1 (Should Fix)
- Code style violations
- Missing tests
- Incomplete documentation
- Unclear naming

### P2 (Nice to Have)
- Refactoring suggestions
- Optimization opportunities
- Alternative approaches

## Time Expectations

| PR Size                | Review Time    |
| ---------------------- | -------------- |
| Small (<100 lines)     | 30 minutes     |
| Medium (100-500 lines) | 1-2 hours      |
| Large (500-1000 lines) | 2-4 hours      |
| XL (>1000 lines)       | Break it down! |

**Rule**: PRs > 500 lines should be split into smaller PRs.

## Approval Requirements

### Standard PR
- **Approvals needed**: 1
- **Who can approve**: Any team member

### Critical PR (Production, Breaking Changes)
- **Approvals needed**: 2
- **Who can approve**: Senior developers

### Hotfix
- **Approvals needed**: 1 (fast-track)
- **Who can approve**: On-call engineer

## Merge Conflicts

### Prevention
- Pull `main` frequently
- Keep PRs small and focused
- Communicate with team about overlapping work

### Resolution
```bash
# Update your branch
git checkout feature/my-feature
git fetch origin
git rebase origin/main

# Resolve conflicts
# ... edit files ...

git add .
git rebase --continue
git push --force-with-lease
```

## Post-Merge

### Author Responsibilities
- [ ] Delete feature branch
- [ ] Close related issues
- [ ] Monitor deployment
- [ ] Update sprint board

### Reviewer Responsibilities
- [ ] Verify merge
- [ ] Watch for regressions
- [ ] Provide feedback on process

## Metrics

Track these for continuous improvement:

- **Review Turnaround Time**: Goal <24 hours
- **PR Size**: Goal <300 lines
- **Approval Rate**: Goal >90% first review
- **Merge Frequency**: Goal >5 per week
