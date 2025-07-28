// ValidPalindromeTests.swift
// Test-DSTests
//
// Tests for ValidPalindrome.isPalindrome function.
//
import Foundation
import Testing

@Suite("ValidPalindrome Tests")
struct ValidPalindromeTests {
    @Test("Empty string is palindrome")
    func testEmptyString() {
        #expect(TwoPointers.ValidPalindrome.isPalindrome("") == true)
    }

    @Test("Single character is palindrome")
    func testSingleChar() {
        #expect(TwoPointers.ValidPalindrome.isPalindrome("a") == true)
    }

    @Test("Simple palindrome")
    func testSimplePalindrome() {
        #expect(TwoPointers.ValidPalindrome.isPalindrome("racecar") == true)
    }

    @Test("Simple non-palindrome")
    func testSimpleNonPalindrome() {
        #expect(TwoPointers.ValidPalindrome.isPalindrome("hello") == false)
    }

    @Test("Palindrome with spaces and punctuation (should fail)")
    func testPalindromeWithSpaces() {
        // This test should fail unless isPalindrome is updated to ignore non-alphanumerics and case.
        #expect(TwoPointers.ValidPalindrome.isPalindrome("Was it a car or a cat I saw") == false)
    }
}
