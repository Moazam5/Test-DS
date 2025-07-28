//
//  ValidateParenthesis.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 4/20/25.
//

import Foundation
import Testing
/*
 You are given a string s consisting of the following characters: '(', ')', '{', '}', '[' and ']'.

 The input string s is valid if and only if:

 1. Every open bracket is closed by the same type of close bracket.
 2. Open brackets are closed in the correct order.
 3. Every close bracket has a corresponding open bracket of the same type.

 Output: Return true if s is a valid string, and false otherwise.

 Example 1:

 Input: s = "[]"

 Output: true
 Example 2:

 Input: s = "([{}])"

 Output: true
 Example 3:

 Input: s = "[(])"

 Output: false
 Explanation: The brackets are not closed in the correct order.
 */

func isValid(_ str: String) -> Bool {
	var stack = [Character]()
	let dict: [Character: Character] = ["}": "{", ")": "(", "]": "["]
	for char in str {
		if char == "(" || char == "[" || char == "{" {
			stack.append(char)
		} else if let matchingParen = dict[char] {
			let last = stack.last
			if stack.isEmpty || matchingParen != last {
				return false
			}
			stack.removeLast()
		}
	}
	return stack.isEmpty
}

struct TestClassValidateParenthesis {
	@Test
	func test1() {
		#expect(isValid("[(])") == false)
	}
}
