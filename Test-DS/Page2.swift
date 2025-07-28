//
//  Page2.swift
//  Test-DSTests
//
//  Created by Moazam Abass Mir on 9/7/24.
//

import XCTest

final class Page2: XCTestCase {

/*
 HackerLand University has the following grading policy:
 Every student receives a grade in the inclusive range from 0 to 100.
 Any  less than 40 is a failing grade.
 Sam is a professor at the university and likes to round each student's grade according to these rules:
 If the difference between the grade and the next multiple of 5 is less than 3, round  up to the next multiple of 5 .
 If the value of grade is less than 38, no rounding occurs as the result will still be a failing grade.
 */

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

	func test_gradingStudents_forAnEmptySetOfGrades() {
		let grades: [Int] = []
		let results = self.gradingStudents(grades: grades)
		XCTAssertEqual(results, [])
	}

	func test_gradingStudents_forGradesLessThan38() {
		let grades: [Int] = [37, 25, 10]
		let results = self.gradingStudents(grades: grades)
		XCTAssertEqual(results, [37, 25, 10])
	}

	func test_gradingStudents_forGradesWithDifferenceMoreThanThree() {
		let grades: [Int] = [47, 55, 92]
		let results = self.gradingStudents(grades: grades)
		XCTAssertEqual(results, [47, 55, 92])
	}

	func test_gradingStudents_forGradesWithDifferenceLessThanThree() {
		let grades: [Int] = [49, 58, 94]
		let results = self.gradingStudents(grades: grades)
		XCTAssertEqual(results, [50, 60, 95])
	}

}

/*
 Sam's house has an apple tree and an orange tree that yield an abundance of fruit. Using the information given below, determine the number of apples and oranges that land on Sam's house.
 In the diagram below:
 The red region denotes the house, where  is the start point, and  is the endpoint. The apple tree is to the left of the house, and the orange tree is to its right.
 Assume the trees are located on a single point, where the apple tree is at point , and the orange tree is at point .
 When a fruit falls from its tree, it lands  units of distance from its tree of origin along the -axis. *A negative value of  means the fruit fell  units to the tree's left, and a positive value of  means it falls  units to the tree's right. *
 Given the value of  for  apples and  oranges, determine how many apples and oranges will fall on Sam's house (i.e., in the inclusive range )?
 For example, Sam's house is between  and . The apple tree is located at  and the orange at . There are  apples and  oranges. Apples are thrown  units distance from , and  units distance. Adding each apple distance to the position of the tree, they land at . Oranges land at . One apple and two oranges land in the inclusive range  so we print:
 1

 2

 */


//s: integer, starting point of Sam's house location.
//t: integer, ending location of Sam's house location.
//a: integer, location of the Apple tree.
//b: integer, location of the Orange tree.
//apples: integer array, distances at which each apple falls from the tree.
//oranges: integer array, distances at which each orange falls from the tree.
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

