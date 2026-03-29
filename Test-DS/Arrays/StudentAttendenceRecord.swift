//
//  StudentAttendenceRecord.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 3/29/26.
//

import Foundation

extension ArraySolutions {
	/// https://leetcode.com/problems/student-attendance-record-i/description/
	func checkRecord(_ s: String) -> Bool {
		var absentCount: Int = 0
		var consecutiveLateCount: Int = 0

		for char in s {
			switch char {
				case "A":
					absentCount += 1
					// An 'A' resets any consecutive 'L' streak
					consecutiveLateCount = 0
				case "L":
					consecutiveLateCount += 1
				case "P":
					// A 'P' resets any consecutive 'L' streak
					consecutiveLateCount = 0
				default:
					// This case should ideally not be reached based on problem description,
					// but it's good practice to consider or assert.
					// For this problem, we can assume valid input.
					break
			}

			// Check eligibility criteria immediately after processing each character
			// This allows for early exit if a condition is violated
			if absentCount >= 2 {
				return false // Ineligible: 2 or more 'A's
			}

			if consecutiveLateCount >= 3 {
				return false // Ineligible: 3 or more consecutive 'L's
			}
		}

		// If the loop completes without returning false, it means all criteria are met.
		return true // Eligible for the award

	}
}
