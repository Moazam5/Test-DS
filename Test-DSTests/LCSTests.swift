//
//  LCSTests.swift
//  Test-DSTests
//
//  Created by Moazam Abass Mir on 1/1/26.
//

import Testing

struct LCSProblemsTests {
	@Suite("Print LCS")
	struct TestPrintLCS {
		private let sut = LCSProblems()

		@Test
		func test_printLCS_basicExample() {
			// Common characters: a c f -> "acf"
			let result = sut.printLCS("abcdef", "actkf")
			#expect(result == "acf")
		}
		@Test
		func test_printLCS_noCommonSubsequence() {
			let result = sut.printLCS("abc", "XYZ")
			#expect(result == "")
		}
		@Test
		func test_printLCS_oneEmptyString() {
			#expect(sut.printLCS("", "abc") == "")
			#expect(sut.printLCS("abc", "") == "")
		}
		@Test
		func test_printLCS_multipleValidLCS_pickOne() {
			// For "AGGTAB" and "GXTXAYB", a valid LCS is "GTAB" (length 4).
			// Depending on tie-breaking, "GTAB" is commonly produced.
			let result = sut.printLCS("AGGTAB", "GXTXAYB")
			#expect(result == "GTAB")
		}
		@Test
		func test_printLCS_caseSensitivity() {
			// Case-sensitive: only 'a' matches
			let result = sut.printLCS("aBcDe", "xaYza")
			#expect(result == "a")
		}
	}

	@Suite("MinInsertionAndDeletions Tests")
	struct MinInsertionAndDeletionsTests {
		@Test("Identical strings require 0 operations")
		func identicalStrings() async throws {
			let lcs = LCSProblems()
			let result = lcs.minInsertionAndDeletions("abcde", "abcde")
			#expect(result == 0)
		}

		@Test("One empty, one non-empty requires length operations")
		func oneEmptyString() async throws {
			let lcs = LCSProblems()
			#expect(lcs.minInsertionAndDeletions("", "kitten") == 6)
			#expect(lcs.minInsertionAndDeletions("puppy", "") == 5)
		}

		@Test("General case small strings")
		func generalCase() async throws {
			let lcs = LCSProblems()
			// s1 = "heap", s2 = "pea"
			// LCS("heap","pea") = "ea" length 2
			// deletions = 4-2 = 2, insertions = 3-2 = 1, total = 3
			let result1 = lcs.minInsertionAndDeletions("heap", "pea")
			#expect(result1 == 3)

			// s1 = "abcdef", s2 = "azced"
			// LCS length is 3 ("acd" or "aced" subsequence length 3)
			// deletions = 6-3 = 3, insertions = 5-3 = 2, total = 5
			let result2 = lcs.minInsertionAndDeletions("abcdef", "azced")
			#expect(result2 == 5)
		}

		@Test("Already subsequence case")
		func subsequenceCase() async throws {
			let lcs = LCSProblems()
			// s2 is a subsequence of s1 -> only deletions needed
			let result = lcs.minInsertionAndDeletions("abcde", "ace")
			// LCS = 3, deletions = 5-3 = 2, insertions = 3-3 = 0, total = 2
			#expect(result == 2)
		}
	}

	// MARK: Min Deletions to Make Palindrome 
	@Suite("Min Deletions to Make Palindrome Tests")
	struct MinDeletionsTests {
		@Test("Empty string requires 0 deletions")
		func emptyString() {
			let lcs = LCSProblems()
			#expect(lcs.minDeletions("") == 0)
		}

		@Test("Single character requires 0 deletions")
		func singleCharacter() {
			let lcs = LCSProblems()
			#expect(lcs.minDeletions("a") == 0)
		}

		@Test("Already palindrome requires 0 deletions")
		func alreadyPalindrome() {
			let lcs = LCSProblems()
			#expect(lcs.minDeletions("racecar") == 0)
			#expect(lcs.minDeletions("abba") == 0)
		}

		@Test("Typical cases")
		func typicalCases() {
			let lcs = LCSProblems()
			// "bbbab" has LPS 4 -> deletions = 5 - 4 = 1
			#expect(lcs.minDeletions("bbbab") == 1)
			// "cbbd" has LPS 2 -> deletions = 4 - 2 = 2
			#expect(lcs.minDeletions("cbbd") == 2)
		}

		@Test("No repeating characters")
		func noRepeats() {
			let lcs = LCSProblems()
			// For "abcd", LPS = 1 -> deletions = 3
			#expect(lcs.minDeletions("abcd") == 3)
		}
	}

	// MARK: Longest Palindromic Subsequence Tests
	@Suite("Longest Palindromic Subsequence Tests")
	struct LongestPalSubseqTests {
		@Test("Empty string has LPS length 0")
		func emptyString() async throws {
			let lcs = LCSProblems()
			#expect(lcs.longestPalindromeSubseq("") == 0)
		}

		@Test("Single character has LPS length 1")
		func singleCharacter() async throws {
			let lcs = LCSProblems()
			#expect(lcs.longestPalindromeSubseq("a") == 1)
		}

		@Test("Already a palindrome")
		func alreadyPalindrome() async throws {
			let lcs = LCSProblems()
			#expect(lcs.longestPalindromeSubseq("racecar") == 7)
			#expect(lcs.longestPalindromeSubseq("abba") == 4)
		}

		@Test("Typical cases")
		func typicalCases() async throws {
			let lcs = LCSProblems()
			// "bbbab" -> LPS is 4 ("bbbb")
			#expect(lcs.longestPalindromeSubseq("bbbab") == 4)
			// "cbbd" -> LPS is 2 ("bb")
			#expect(lcs.longestPalindromeSubseq("cbbd") == 2)
		}

		@Test("No repeating characters")
		func noRepeats() async throws {
			let lcs = LCSProblems()
			// For a string like "abcd", LPS is 1
			#expect(lcs.longestPalindromeSubseq("abcd") == 1)
		}
	}
}
