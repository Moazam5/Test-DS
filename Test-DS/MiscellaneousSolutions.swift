//
//  MiscellaneousSolutions.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/14/26.
//

import Foundation

struct MiscellaneousSolutions: MiscellaneousProblems {
	func gradingStudents(grades: [Int]) -> [Int] {
		if grades.isEmpty { return [] }

		let roundedGrades = grades.map {
			let remainder = $0.quotientAndRemainder(dividingBy: 5).remainder
			if $0 < 38 || remainder < 3 {
				return $0
			} else {
				return $0 - remainder + 5
			}
		}
		return roundedGrades
	}

	// Good use of maths here.
	func gradingStudentsChatGPT(grades: [Int]) -> [Int] {
		var finalGrades = [Int]()

		for grade in grades {
			if grade >= 38 {
				let nextMultipleOfFive = ((grade / 5) + 1) * 5
				if nextMultipleOfFive - grade < 3 {
					finalGrades.append(nextMultipleOfFive)
				} else {
					finalGrades.append(grade)
				}
			} else {
				finalGrades.append(grade)
			}
		}

		return finalGrades
	}

	func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
		// Write your code here
		let houseRange = s...t
		let applesLocation = apples.map { $0 + a }
		let orangesLocation = oranges.map { $0 + b }
		let applesForSam = applesLocation.filter { houseRange.contains($0) }
		let orangesForSam = orangesLocation.filter { houseRange.contains($0) }
		print(applesForSam.count)
		print(orangesForSam.count)
	}

	// Better time complexity and less verbose.
	func countApplesAndOrangesChatGPT(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) {
		// Calculate where each apple lands and count those that land on the house
		let appleCount = apples.map { a + $0 }.filter { $0 >= s && $0 <= t }.count

		// Calculate where each orange lands and count those that land on the house
		let orangeCount = oranges.map { b + $0 }.filter { $0 >= s && $0 <= t }.count

		// Print the results
		print(appleCount)
		print(orangeCount)
	}
}
