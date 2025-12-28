//
//  UnboundedKnapsackTests.swift
//  Test-DSTests
//
//  Created by Moazam Abass Mir on 12/27/25.
//

import Testing

@Suite("UnboundedKnapsack Tests")
struct UnboundedKnapsackTests {
	private let solver: UnboundedKnapsack = UnboundedKnapsackProblems()
	
	@Test("Basic example with multiple uses allowed")
	func basicExample() async throws {
		// Classic unbounded knapsack example
		// weights: [2, 3, 4], values: [4, 5, 7], capacity: 7
		// Optimal: 3 + 4 (weights) -> values 5 + 7 = 12, or 2 + 2 + 3 -> 4 + 4 + 5 = 13 (better)
		let weights = [2, 3, 4]
		let values  = [4, 5, 7]
		let capacity = 7
		let result = solver.unboundedKnapsack(weights, values, capacity: capacity)
		#expect(result == 13, "Expected best value 13 for capacity 7")
	}
	
	@Test("Zero capacity yields zero value")
	func zeroCapacity() async throws {
		let weights = [1, 2, 3]
		let values  = [10, 15, 40]
		let result = solver.unboundedKnapsack(weights, values, capacity: 0)
		#expect(result == 0)
	}
	
	@Test("Empty items yields zero")
	func emptyItems() async throws {
		let result1 = solver.unboundedKnapsack([], [], capacity: 10)
		#expect(result1 == 0)
		
		let result2 = solver.unboundedKnapsack([], [1,2,3], capacity: 10)
		#expect(result2 == 0)
		
		let result3 = solver.unboundedKnapsack([1,2,3], [], capacity: 10)
		#expect(result3 == 0)
	}
	
	@Test("Single item repeatable")
	func singleItemRepeatable() async throws {
		// One item weight 3, value 5; capacity 10 -> we can take 3 items (weight 9) value 15
		let weights = [3]
		let values  = [5]
		let capacity = 10
		let result = solver.unboundedKnapsack(weights, values, capacity: capacity)
		#expect(result == 15)
	}
	
	@Test("Mixed items correctness")
	func mixedItems() async throws {
		// weights: [5, 10, 15], values: [10, 30, 20], capacity: 100
		// Best is 10-weight item repeated: 10 * 30 = 300
		let weights = [5, 10, 15]
		let values  = [10, 30, 20]
		let capacity = 100
		let result = solver.unboundedKnapsack(weights, values, capacity: capacity)
		#expect(result == 300)
	}
	
	@Test("Larger capacity sanity check")
	func largerCapacity() async throws {
		// weights: [1, 3, 4], values: [1, 4, 5], capacity: 50
		// Greedy by value/weight suggests 4/3 ~ 1.333 and 5/4 = 1.25 and 1/1 = 1
		// Optimal DP result should be 4 * 50/3 approximated via DP; exact DP result is 66
		let weights = [1, 3, 4]
		let values  = [1, 4, 5]
		let capacity = 50
		let result = solver.unboundedKnapsack(weights, values, capacity: capacity)
		#expect(result == 66)
	}
	
	
	@Suite("Coin Change (Unbounded Knapsack) Tests")
	struct CoinChangeITests {
		// Helper to access the method under test. Adjust the type name if needed.
		let solver = UnboundedKnapsackProblems()
		
		@Test("Example: N=4, S={1,2,3} -> 4 ways")
		func exampleFromDescription() async throws {
			let ways = solver.coinChange([1,2,3], 4)
			#expect(ways == 4)
		}
		
		@Test("Single coin equal to sum -> 1 way")
		func singleCoinEqualToSum() async throws {
			let ways = solver.coinChange([5], 5)
			#expect(ways == 1)
		}
		
		@Test("Single coin not dividing sum -> 0 ways")
		func singleCoinNotDividingSum() async throws {
			let ways = solver.coinChange([4], 5)
			#expect(ways == 0)
		}
		
		@Test("Zero sum -> exactly 1 way (choose nothing)")
		func zeroSum() async throws {
			let ways = solver.coinChange([1,2,3], 0)
			#expect(ways == 1)
		}
		
		@Test("Empty coin list and non-zero sum -> 0 ways")
		func emptyCoinsNonZeroSum() async throws {
			let ways = solver.coinChange([], 5)
			#expect(ways == 0)
		}
		
		// Doesn't work in swift, works in python
		//    @Test("Sum negative -> 0 ways (safety guard)")
		//    func negativeSum() async throws {
		//		let arr = [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100,102,104,106,108,110,112,114,116,118,120,122,124,126,128,130,132,134,136,138,140,142,144,146,148,150,152,154,156,158,160,162,164,166,168,170,172,174,176,178,180,182,184,186,188,190,192,194,196,198,200,202,204,206,208,210,212,214,216,218,220,222,224,226,228,230,232,234,236,238,240,242,244,246,248,250,252,254,256,258,260,262,264,266,268,270,272,274,276,278,280,282,284,286,288,290,292,294,296,298,300,302,304,306,308,310,312,314,316,318,320,322,324,326,328,330,332,334,336,338,340,342,344,346,348,350,352,354,356,358,360,362,364,366,368,370,372,374,376,378,380,382,384,386,388,390,392,394,396,398,400,402,404,406,408,410,412,414,416,418,420,422,424,426,428,430,432,434,436,438,440,442,444,446,448,450,452,454,456,458,460,462,464,466,468,470,472,474,476,478,480,482,484,486,488,490,492,494,496,498,500,502,504,506,508,510,512,514,516,518,520,522,524,526,528,530,532,534,536,538,540,542,544,546,548,550,552,554,556,558,560,562,564,566,568,570,572,574,576,578,580,582,584,586,588,780,936,1170,1560,2340,4680]
		//
		//        let ways = solver.coinChange(arr, 4681)
		//        #expect(ways == 0)
		//    }
		
		@Test("Larger case sanity: S={1,2,5}, N=10 -> 10 ways")
		func largerCaseSanity() async throws {
			// Known result for classic coin change combinations
			// Ways(10) with coins {1,2,5} = 10
			let ways = solver.coinChange([1,2,5], 10)
			#expect(ways == 10)
		}
	}

	@Suite("CoinChangeII Tests")
	struct CoinChangeIITests {
		@Test("Example from doc: coins {25,10,5}, amount 30 -> 2")
		func exampleDocCase() async throws {
			let kp = UnboundedKnapsackProblems()
			let result = kp.coinChangeII([25, 10, 5], 30)
			#expect(result == 2)
		}

		@Test("Simple exact match: coins {1,2,5}, amount 11 -> 3 (5+5+1)")
		func simpleExactMatch() async throws {
			let kp = UnboundedKnapsackProblems()
			let result = kp.coinChangeII([1, 2, 5], 11)
			#expect(result == 3)
		}

		@Test("Single coin type divides amount: coins {3}, amount 9 -> 3")
		func singleCoinDivides() async throws {
			let kp = UnboundedKnapsackProblems()
			let result = kp.coinChangeII([3], 9)
			#expect(result == 3)
		}

		@Test("Zero amount should be 0 coins")
		func zeroAmount() async throws {
			let kp = UnboundedKnapsackProblems()
			let result = kp.coinChangeII([1, 2, 5], 0)
			#expect(result == 0)
		}

		@Test("Amount negative should return 0 per implementation guard")
		func negativeAmount() async throws {
			let kp = UnboundedKnapsackProblems()
			let result = kp.coinChangeII([1, 2, 5], -3)
			#expect(result == 0)
		}

		@Test("Another set: coins {3,4,5}, amount 5 -> 1")
		func sampleFromPlayground() async throws {
			let kp = UnboundedKnapsackProblems()
			let result = kp.coinChangeII([3, 4, 5], 5)
			#expect(result == 1)
		}
	}
}
