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
}
