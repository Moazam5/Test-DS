//
//  MiscellaneousProblems.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 2/14/26.
//

import Foundation

protocol MiscellaneousProblems {
	///	HackerLand University has the following grading policy:
	///	Every student receives a grade in the inclusive range from 0 to 100.
	///	Any  less than 40 is a failing grade.
	///	Sam is a professor at the university and likes to round each student's grade according to these rules:
	///	If the difference between the grade and the next multiple of 5 is less than 3, round  up to the next multiple of 5 .
	///	If the value of grade is less than 38, no rounding occurs as the result will still be a failing grade.
	func gradingStudents(grades: [Int]) -> [Int]

	/// s: integer, starting point of Sam's house location.
	/// t: integer, ending location of Sam's house location.
	/// a: integer, location of the Apple tree.
	/// b: integer, location of the Orange tree.
	/// apples: integer array, distances at which each apple falls from the tree.
	/// oranges: integer array, distances at which each orange falls from the tree.
	func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void
}
