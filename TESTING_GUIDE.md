# Testing Guide for DeSocial

This guide covers how to test all features of the DeSocial platform.

## 🧪 Smart Contract Tests

### Run All Tests

```bash
cd desocial
forge test
```

### Run Tests with Verbosity

```bash
# Show test names
forge test -vv

# Show stack traces for failures
forge test -vvv

# Show all traces including passing tests
forge test -vvvv
```

### Run Specific Tests

```bash
# Test only profile functionality
forge test --match-test testProfile

# Test only post functionality
forge test --match-test testPost

# Test only like functionality
forge test --match-test testLike
```

### Gas Report

```bash
forge test --gas-report
```

### Coverage Report

```bash
forge coverage
```

## 🎭 Manual Frontend Testing

### Setup for Testing

1. Deploy contract to testnet
2. Get testnet tokens from faucet
3. Create 2-3 test wallets in MetaMask
4. Fund all wallets with testnet tokens

### Test Checklist

#### 1. Profile Management ✅

**Create Profile:**
- [ ] Connect wallet
- [ ] Enter username and bio
- [ ] Submit transaction
- [ ] Verify profile appears in navbar
- [ ] Check profile page

**Update Profile:**
- [ ] Go to profile page
- [ ] Click "Edit Profile"
- [ ] Change username/bio
- [ ] Submit transaction
- [ ] Verify changes appear

**Edge Cases:**
- [ ] Try creating profile twice (should fail)
- [ ] Try updating without profile (should fail)
- [ ] Try empty username (should be rejected)

#### 2. Post Creation & Management ✅

**Create Post:**
- [ ] Type content in text area
- [ ] Select community
- [ ] Click "Post"
- [ ] Verify post appears in feed

**Edit Post:**
- [ ] Find your own post
- [ ] Click edit button (✏️)
- [ ] Change content
- [ ] Verify changes

**Delete Post:**
- [ ] Find your own post
- [ ] Click delete button (🗑️)
- [ ] Confirm deletion
- [ ] Verify post disappears from feed

**Edge Cases:**
- [ ] Try empty post (should be rejected)
- [ ] Try editing someone else's post (button shouldn't appear)
- [ ] Post to verified-only community without verification

#### 3. Likes & Reports ✅

**Like Post:**
- [ ] Click heart icon on any post
- [ ] Verify count increases
- [ ] Verify heart becomes filled (❤️)
- [ ] Try liking same post again (should fail)

**Report Post:**
- [ ] Click flag icon (🚩)
- [ ] Confirm report
- [ ] Verify report count increases
- [ ] Try reporting same post again (should fail)

#### 4. Following System ✅

**Follow User:**
- [ ] Visit another user's profile
- [ ] Click "Follow" button
- [ ] Verify button changes to "Unfollow"
- [ ] Switch to "Following" feed tab
- [ ] Verify their posts appear

**Unfollow User:**
- [ ] On followed user's profile, click "Unfollow"
- [ ] Verify button changes to "Follow"
- [ ] Check following feed (posts should disappear)

**Edge Cases:**
- [ ] Try following yourself (should fail)
- [ ] Try following same user twice (should fail)

#### 5. Communities ✅

**Create Community:**
- [ ] Go to Communities page
- [ ] Click "+ Create Community"
- [ ] Fill name and description
- [ ] Toggle "Verified Only" on/off
- [ ] Submit
- [ ] Verify community appears in list

**Post to Community:**
- [ ] Select community from dropdown
- [ ] Create post
- [ ] Verify post shows community badge

**Manage Community:**
- [ ] On your community, click "Manage"
- [ ] Add moderator address
- [ ] Verify transaction succeeds

#### 6. Verification System ✅ (Advanced)

**Admin: Add Verifier:**
- [ ] Connect as contract deployer
- [ ] Go to Admin page
- [ ] Add verifier address
- [ ] Verify transaction

**Verifier: Verify User:**
- [ ] Connect as verifier address
- [ ] Go to Admin page (Verify Users section should appear)
- [ ] Enter user address
- [ ] Click "Verify"
- [ ] Check user's profile (should show verified badge)

**Test Verified Community:**
- [ ] As verified user, post to verified-only community (should work)
- [ ] As non-verified user, try posting (should fail with "Not verified")

#### 7. Moderation ✅ (Advanced)

**Assign Moderator:**
- [ ] As community creator, go to Communities
- [ ] Click "Manage" on your community
- [ ] Add moderator address
- [ ] Submit transaction

**Moderate Post:**
- [ ] Switch to moderator wallet
- [ ] Find post in your community
- [ ] Click moderate button (should be available)
- [ ] Post should be soft-deleted

#### 8. Reputation System ✅

**Check Reputation:**
- [ ] Go to any profile page
- [ ] Verify reputation stats show:
  - Total likes received
  - Reputation score
  - Number of posts

**Reputation Updates:**
- [ ] Like someone's post
- [ ] Check their profile (likes should increase)
- [ ] Report a post
- [ ] Check author's profile (reports should increase)

## 🔍 Integration Testing Scenarios

### Scenario 1: New User Onboarding

```
1. Connect wallet (fresh address)
2. Create profile
3. Browse global feed
4. Like a few posts
5. Follow a user
6. Create first post
7. Check profile page
```

### Scenario 2: Power User Workflow

```
1. Create multiple posts
2. Follow 5+ users
3. Create a community
4. Post to different communities
5. Assign moderator
6. Edit/delete posts
7. Check reputation score
```

### Scenario 3: Multi-User Interaction

```
User A:
1. Create profile
2. Create post

User B:
1. Create profile
2. Like User A's post
3. Follow User A
4. Comment (create reply post)

User A:
1. Check notifications (manual)
2. View User B's profile
3. Follow back
```

### Scenario 4: Admin & Moderation Flow

```
Admin:
1. Add verifier address

Verifier:
1. Verify User A

User A (verified):
1. Create verified-only community
2. Post in community

Community Creator:
1. Assign moderator

Moderator:
1. Moderate inappropriate post
```

## 🐛 Known Issues to Test

- [ ] Transaction pending state (should show loading)
- [ ] MetaMask rejection (should show error)
- [ ] Network switch (should prompt to switch)
- [ ] Insufficient gas (should show error)
- [ ] Very long posts (test character limits)
- [ ] Special characters in username
- [ ] Multiple tabs open (state sync)

## 📊 Performance Testing

### Load Testing

```bash
# Test with many posts
for i in {1..50}; do
  echo "Creating post $i"
  # Use script or manually create posts
done
```

### Gas Optimization Checks

```bash
# Check gas usage
forge test --gas-report

# Look for:
# - Profile creation: ~100k gas
# - Post creation: ~150k gas
# - Like: ~50k gas
# - Follow: ~50k gas
```

## ✅ Acceptance Criteria

### Beginner Level
- [x] All profile functions work
- [x] Posts can be created and viewed
- [x] Likes work with double-like prevention
- [x] Events are emitted
- [x] Tests pass

### Intermediate Level
- [x] Follow/unfollow works
- [x] Reputation system calculates correctly
- [x] Report system works
- [x] Edit/delete posts work
- [x] Profile pages show user stats

### Advanced Level
- [x] Verification system works (admin → verifier → user)
- [x] Communities work (public and verified-only)
- [x] Moderator system works
- [x] Admin dashboard shows stats
- [x] All role-based permissions work

## 🎯 Testing Tips

1. **Use Multiple Wallets**: Test interactions between users
2. **Check Events**: Use block explorer to verify events
3. **Test Edge Cases**: Try to break things!
4. **Network Issues**: Test with slow/failed transactions
5. **Mobile Testing**: Test on mobile browser
6. **Different Browsers**: Chrome, Firefox, Safari

## 🚨 Critical Tests (Must Pass)

- [ ] Cannot like same post twice
- [ ] Cannot report same post twice
- [ ] Cannot follow self
- [ ] Cannot edit others' posts
- [ ] Only admin can add verifiers
- [ ] Only verifiers can verify users
- [ ] Only verified users can post in verified communities
- [ ] Only moderators can moderate posts in their communities

---

**Happy Testing! 🎉**

If you find bugs, document them with:
1. Steps to reproduce
2. Expected behavior
3. Actual behavior
4. Screenshots/videos
5. Transaction hash (if applicable)
