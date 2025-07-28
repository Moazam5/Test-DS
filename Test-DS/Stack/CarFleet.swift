//
//  CarFleet.swift
//  Test-DS
//
//  Created by Moazam Abass Mir on 5/10/25.
//

import Foundation

/*
 There are n cars traveling to the same destination on a one-lane highway.

 You are given two arrays of integers position and speed, both of length n.

 position[i] is the position of the ith car (in miles)
 speed[i] is the speed of the ith car (in miles per hour)
 The destination is at position target miles.

 A car can not pass another car ahead of it. It can only catch up to another car and then drive at the same speed as the car ahead of it.

 A car fleet is a non-empty set of cars driving at the same position and same speed. A single car is also considered a car fleet.

 If a car catches up to a car fleet the moment the fleet reaches the destination, then the car is considered to be part of the fleet.

 Return the number of different car fleets that will arrive at the destination.

 Example 1:

 Input: target = 10, position = [1,4], speed = [3,2]

 Output: 1
 Explanation: The cars starting at 1 (speed 3) and 4 (speed 2) become a fleet, meeting each other at 10, the destination.
 */

	// Got a 3/ 10 because I didn't account for catching up to the speed.
func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
	var steps = [Int]()
	for (i, p) in position.enumerated() {
		let step = ceil(Double(target - p) / Double(speed[i]))
		steps.append(Int(step))
	}
	let stepSet = Set(steps)
	return stepSet.count
}


