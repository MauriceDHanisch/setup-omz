#!/bin/bash
# Simple bash test suite for setup.sh

set -e

TESTS_PASSED=0
TESTS_FAILED=0

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Test helper
assert_true() {
    if "$@"; then
        echo -e "${GREEN}✓${NC} $*"
        ((TESTS_PASSED++))
    else
        echo -e "${RED}✗${NC} $*"
        ((TESTS_FAILED++))
    fi
}

assert_false() {
    if ! "$@"; then
        echo -e "${GREEN}✓${NC} NOT $*"
        ((TESTS_PASSED++))
    else
        echo -e "${RED}✗${NC} NOT $*"
        ((TESTS_FAILED++))
    fi
}

# Test 1: Check if setup.sh exists
test_setup_script_exists() {
    [ -f "./setup.sh" ]
}

# Test 2: Check if setup.sh is executable
test_setup_script_executable() {
    [ -x "./setup.sh" ]
}

# Test 3: Check if setup.sh has proper shebang
test_setup_script_shebang() {
    head -1 ./setup.sh | grep -q "#!/bin/bash"
}

# Test 4: Check for zsh check in script
test_check_zsh_command() {
    grep -q "check_command zsh" ./setup.sh
}

# Test 5: Check for git check in script
test_check_git_command() {
    grep -q "check_command git" ./setup.sh
}

# Test 6: Check for curl check in script
test_check_curl_command() {
    grep -q "check_command curl" ./setup.sh
}

# Test 7: Check for Oh My Zsh installation logic
test_oh_my_zsh_installation() {
    grep -q "git clone https://github.com/ohmyzsh/ohmyzsh" ./setup.sh
}

# Test 8: Check for plugin installation (autosuggestions)
test_zsh_autosuggestions_plugin() {
    grep -q "zsh-autosuggestions" ./setup.sh
}

# Test 9: Check for plugin installation (syntax-highlighting)
test_zsh_syntax_highlighting_plugin() {
    grep -q "zsh-syntax-highlighting" ./setup.sh
}

# Test 10: Check for theme installation
test_theme_installation() {
    grep -q "mhanisch.zsh-theme" ./setup.sh
}

# Test 11: Check for .zshrc installation
test_zshrc_installation() {
    grep -q ".zshrc" ./setup.sh
}

# Test 12: Check for cleanup of temp directory
test_cleanup_temp_directory() {
    grep -q "rm -rf" ./setup.sh
}

# Test 13: Check for proper error exit on missing dependencies
test_error_handling() {
    grep -q "exit 1" ./setup.sh
}

# Test 14: Check if README exists
test_readme_exists() {
    [ -f "./README.md" ]
}

# Test 15: Check if README documents curl installation
test_readme_curl_installation() {
    grep -q "curl -fsSL" ./README.md
}

# Run all tests
echo "Running setup-omz tests..."
echo ""

assert_true test_setup_script_exists
assert_true test_setup_script_executable
assert_true test_setup_script_shebang
assert_true test_check_zsh_command
assert_true test_check_git_command
assert_true test_check_curl_command
assert_true test_oh_my_zsh_installation
assert_true test_zsh_autosuggestions_plugin
assert_true test_zsh_syntax_highlighting_plugin
assert_true test_theme_installation
assert_true test_zshrc_installation
assert_true test_cleanup_temp_directory
assert_true test_error_handling
assert_true test_readme_exists
assert_true test_readme_curl_installation

echo ""
echo "======================================="
echo -e "Tests passed: ${GREEN}$TESTS_PASSED${NC}"
echo -e "Tests failed: ${RED}$TESTS_FAILED${NC}"
echo "======================================="

if [ $TESTS_FAILED -eq 0 ]; then
    echo -e "${GREEN}✅ All tests passed!${NC}"
    exit 0
else
    echo -e "${RED}❌ Some tests failed${NC}"
    exit 1
fi
