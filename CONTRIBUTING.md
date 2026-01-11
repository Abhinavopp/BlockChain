# 🤝 Contributing to DeSocial

Thank you for considering contributing to DeSocial! This document provides guidelines for contributing to the project.

## 🌟 Ways to Contribute

- 🐛 Report bugs
- 💡 Suggest features
- 📝 Improve documentation
- 🔧 Submit code fixes
- ✨ Add new features
- 🎨 Improve UI/UX
- 🧪 Add tests

## 🚀 Getting Started

### 1. Fork the Repository

Click the "Fork" button at the top of the repository.

### 2. Clone Your Fork

```bash
git clone https://github.com/your-username/desocial.git
cd desocial
```

### 3. Set Up Development Environment

```bash
# Install Foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup

# Install Solidity dependencies
cd desocial
forge install

# Install frontend dependencies
cd ../frontend
npm install
```

### 4. Create a Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

## 📋 Development Guidelines

### Smart Contract Development

#### Code Style
- Use Solidity 0.8.20+
- Follow [Solidity Style Guide](https://docs.soliditylang.org/en/latest/style-guide.html)
- Use 4 spaces for indentation
- Add NatSpec comments for all public functions
- Keep functions focused and small

#### Example
```solidity
/// @notice Allows users to create a new post
/// @param contentURI The content or IPFS hash of the post
/// @param communityId The community to post in
function createPost(string calldata contentURI, uint256 communityId) external {
    // Implementation
}
```

#### Testing Requirements
- Write tests for all new functions
- Aim for >90% code coverage
- Test both success and failure cases
- Use descriptive test names

```solidity
function testCreatePost_Success() public { ... }
function testCreatePost_RevertWhenNotRegistered() public { ... }
```

#### Gas Optimization
- Use `calldata` for string parameters
- Minimize storage writes
- Use events for data that doesn't need on-chain storage
- Consider batch operations

### Frontend Development

#### Code Style
- Follow Angular style guide
- Use TypeScript strict mode
- Use signals for reactive state
- Keep components focused and reusable

#### Component Structure
```typescript
@Component({
  selector: 'app-feature',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `...`,
  styles: [`...`]
})
export class FeatureComponent {
  // Signals for state
  loading = signal(false);
  data = signal<Type[]>([]);
  
  // Inject services
  service = inject(ServiceName);
  
  // Lifecycle
  async ngOnInit() { ... }
  
  // Methods
  async loadData() { ... }
}
```

#### Testing
- Write unit tests for services
- Test error handling
- Test loading states
- Test edge cases

## 🔄 Contribution Workflow

### 1. Make Your Changes

```bash
# Create/edit files
# Test your changes
forge test                    # For contracts
npm start                     # For frontend
```

### 2. Commit Your Changes

Use conventional commits:

```bash
git add .
git commit -m "feat: add user blocking feature"
# or
git commit -m "fix: resolve double-like bug"
# or
git commit -m "docs: update deployment guide"
```

**Commit Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Formatting
- `refactor`: Code restructuring
- `test`: Adding tests
- `chore`: Maintenance

### 3. Push Your Changes

```bash
git push origin feature/your-feature-name
```

### 4. Create Pull Request

1. Go to the original repository
2. Click "New Pull Request"
3. Select your fork and branch
4. Fill in the PR template
5. Submit

## 📝 Pull Request Guidelines

### PR Title
Use conventional commit format:
```
feat: add user blocking feature
fix: resolve double-like bug
docs: improve installation guide
```

### PR Description
Include:
- **What**: What does this PR do?
- **Why**: Why is this change needed?
- **How**: How does it work?
- **Testing**: How was it tested?
- **Screenshots**: If UI changes

### Example PR Description
```markdown
## What
Adds user blocking feature to prevent unwanted interactions.

## Why
Users requested ability to block spam accounts.

## How
- Added `blockedUsers` mapping in contract
- Added `blockUser()` and `unblockUser()` functions
- Updated UI with block button on profiles
- Added tests for block functionality

## Testing
- Added unit tests (testBlockUser, testUnblockUser)
- Manually tested on Polygon Amoy testnet
- Tested with multiple accounts

## Screenshots
[Add screenshots here]

## Checklist
- [x] Tests added and passing
- [x] Documentation updated
- [x] Code follows style guide
- [x] No breaking changes
```

## ✅ Code Review Checklist

Before submitting PR, verify:

### Smart Contract
- [ ] Code compiles without warnings
- [ ] All tests pass
- [ ] New tests added for new features
- [ ] Gas optimizations considered
- [ ] Security implications reviewed
- [ ] Events emitted for state changes
- [ ] Access control properly implemented

### Frontend
- [ ] Code builds without errors
- [ ] No console errors
- [ ] UI is responsive
- [ ] Loading states implemented
- [ ] Error handling implemented
- [ ] TypeScript types defined
- [ ] Follows Angular best practices

### Documentation
- [ ] README updated if needed
- [ ] Code comments added
- [ ] API changes documented
- [ ] Migration guide (if breaking changes)

## 🐛 Reporting Bugs

### Before Reporting
1. Check existing issues
2. Test on latest version
3. Try to reproduce consistently

### Bug Report Template
```markdown
## Description
Clear description of the bug

## Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. See error

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Environment
- OS: [e.g., Windows 10]
- Browser: [e.g., Chrome 120]
- Network: [e.g., Polygon Amoy]
- Contract Address: [if applicable]

## Additional Context
Screenshots, logs, transaction hashes, etc.
```

## 💡 Suggesting Features

### Feature Request Template
```markdown
## Feature Description
Clear description of the feature

## Problem It Solves
What problem does this solve?

## Proposed Solution
How would you implement it?

## Alternatives Considered
Other ways to solve this

## Additional Context
Mockups, examples, etc.
```

## 🎨 UI/UX Improvements

When suggesting UI changes:
- Include mockups or wireframes
- Explain the UX problem being solved
- Consider mobile responsiveness
- Follow existing design patterns
- Maintain accessibility standards

## 🧪 Adding Tests

### Test Requirements
- Test success cases
- Test failure cases (reverts)
- Test edge cases
- Test access control
- Test state changes

### Test Naming
```solidity
// Good
function testCreatePost_Success() public
function testCreatePost_RevertWhenNotRegistered() public
function testLikePost_RevertWhenAlreadyLiked() public

// Bad
function test1() public
function testPost() public
```

## 📚 Improving Documentation

Documentation improvements are always welcome:
- Fix typos
- Add examples
- Clarify instructions
- Add troubleshooting tips
- Improve formatting

## 🚫 What Not to Do

- ❌ Submit untested code
- ❌ Include unrelated changes
- ❌ Commit private keys or secrets
- ❌ Break existing functionality
- ❌ Ignore code review feedback
- ❌ Submit without description
- ❌ Copy code without attribution

## ✅ Best Practices

- ✅ Write clear commit messages
- ✅ Keep PRs focused and small
- ✅ Add tests for new features
- ✅ Update documentation
- ✅ Respond to code review
- ✅ Be respectful and professional
- ✅ Ask questions if unclear

## 🏆 Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md
- Credited in release notes
- Acknowledged in documentation

## 📞 Getting Help

Need help contributing?

- Read existing documentation
- Check closed issues/PRs for examples
- Ask questions in issues
- Join community discussions

## 🔐 Security Issues

**DO NOT** open public issues for security vulnerabilities.

Instead:
1. Email security concerns privately
2. Include detailed description
3. Wait for response before disclosure

## 📜 Code of Conduct

### Our Pledge

We are committed to providing a welcoming and inclusive experience for everyone.

### Expected Behavior
- Be respectful and professional
- Give and receive constructive feedback
- Focus on what's best for the community
- Show empathy towards others

### Unacceptable Behavior
- Harassment or discrimination
- Trolling or insulting comments
- Public or private harassment
- Publishing others' private information

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 🙏 Thank You!

Every contribution, no matter how small, helps make DeSocial better. We appreciate your time and effort!

---

## Quick Links

- [Code of Conduct](#code-of-conduct)
- [Development Guidelines](#development-guidelines)
- [Pull Request Guidelines](#pull-request-guidelines)
- [Reporting Bugs](#reporting-bugs)
- [Suggesting Features](#suggesting-features)

---

**Happy Contributing! 🎉**
