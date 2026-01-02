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
}
