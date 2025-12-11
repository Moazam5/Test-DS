import Testing
import Foundation

private struct DPTester: DynamicProgramming {}

@Suite("Knapsack Recursive")
struct KnapsackRecursiveTests {
  // Basic example: weights [1, 3, 4, 5], values [1, 4, 5, 7], capacity 7 -> expected 9
  @Test
  func basicExample() {
    let dp = DPTester()
    let result = dp.knapsackRecursive(weights: [1,3,4,5], values: [1,4,5,7], capacity: 7)
	#expect(result == 9)
  }

  // Zero capacity: weights [2,3], values [6,7], capacity 0 -> expected 0
  @Test
  func zeroCapacity() {
    let dp = DPTester()
    let result = dp.knapsackRecursive(weights: [2,3], values: [6,7], capacity: 0)
    #expect(result == 0)
  }

  // All items too heavy: weights [5,6], values [10,12], capacity 4 -> expected 0
  @Test
  func allItemsTooHeavy() {
    let dp = DPTester()
    let result = dp.knapsackRecursive(weights: [5,6], values: [10,12], capacity: 4)
    #expect(result == 0)
  }

  // Single item fits exactly: weights [4], values [9], capacity 4 -> expected 9
  @Test
  func singleItemFitsExactly() {
    let dp = DPTester()
    let result = dp.knapsackRecursive(weights: [4], values: [9], capacity: 4)
    #expect(result == 9)
  }

  // Choose best combination not greedy by value/weight: weights [2,2,6,5,4], values [6,3,5,4,6], capacity 10 -> expected 15 (choose items 0,1,4)
  @Test
  func bestCombinationNotGreedy() {
    let dp = DPTester()
    let result = dp.knapsackRecursive(weights: [2,2,6,5,4], values: [6,3,5,4,6], capacity: 10)
    #expect(result == 15)
  }

  // Empty weights/values arrays -> expected 0
  @Test
  func emptyArrays() {
    let dp = DPTester()
    let result = dp.knapsackRecursive(weights: [], values: [], capacity: 10)
    #expect(result == 0)
  }
}

@Suite("Knapsack Top-Down")
struct KnapsackTopDownTests {
  // Basic example: weights [1, 3, 4, 5], values [1, 4, 5, 7], capacity 7 -> expected 9
  @Test
  func basicExampleTopDown() {
    let dp = DPTester()
    let result = dp.knapsackTopDown(weights: [1,3,4,5], values: [1,4,5,7], capacity: 7)
    #expect(result == 9)
  }

  // Zero capacity: weights [2,3], values [6,7], capacity 0 -> expected 0
  @Test
  func zeroCapacityTopDown() {
    let dp = DPTester()
    let result = dp.knapsackTopDown(weights: [2,3], values: [6,7], capacity: 0)
    #expect(result == 0)
  }

  // All items too heavy: weights [5,6], values [10,12], capacity 4 -> expected 0
  @Test
  func allItemsTooHeavyTopDown() {
    let dp = DPTester()
    let result = dp.knapsackTopDown(weights: [5,6], values: [10,12], capacity: 4)
    #expect(result == 0)
  }

  // Single item fits exactly: weights [4], values [9], capacity 4 -> expected 9
  @Test
  func singleItemFitsExactlyTopDown() {
    let dp = DPTester()
    let result = dp.knapsackTopDown(weights: [4], values: [9], capacity: 4)
    #expect(result == 9)
  }

  // Choose best combination not greedy by value/weight: weights [2,2,6,5,4], values [6,3,5,4,6], capacity 10 -> expected 15 (choose items 0,1,4)
  @Test
  func bestCombinationNotGreedyTopDown() {
    let dp = DPTester()
    let result = dp.knapsackTopDown(weights: [2,2,6,5,4], values: [6,3,5,4,6], capacity: 10)
    #expect(result == 15)
  }

  // Empty weights/values arrays -> expected 0
  @Test
  func emptyArraysTopDown() {
    let dp = DPTester()
    let result = dp.knapsackTopDown(weights: [], values: [], capacity: 10)
    #expect(result == 0)
  }
}
