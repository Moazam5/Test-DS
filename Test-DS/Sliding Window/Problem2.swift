//
//  Problem2.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 6/18/25.
//

import Foundation
import Testing 
/*
 Medium
 Longest Substring Without Repeating Characters
 Given a string s, find the length of the longest substring without duplicate characters.

 A substring is a contiguous sequence of characters within a string.

 Example 1:

 Input: s = "zxyzxyz"

 Output: 3
 Explanation: The string "xyz" is the longest without duplicate characters.

 Example 2:

 Input: s = "xxxx"

 Output: 1
 Constraints:

 0 <= s.length <= 1000
 s may consist of printable ASCII characters.
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
	return 0
}

@Test func lengthOfLongestSubstringTest() {
	#expect(lengthOfLongestSubstring("zxyzxyz") == 3)
	#expect(lengthOfLongestSubstring("xxxx") == 1)
	#expect(lengthOfLongestSubstring("pwwkew") == 3)
	#expect(lengthOfLongestSubstring("dvdf") == 3)
}
