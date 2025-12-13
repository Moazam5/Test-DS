import Testing
@testable import Test_DS

struct KnapsackProblemsTests {
    @Test("Subset exists: [3, 34, 4, 12, 5, 2], sum 9 => true")
    func subsetExistsBasic() async throws {
        let solver = KnapsackProblems()
        let list = [3, 34, 4, 12, 5, 2]
        let sum = 9
        let result = solver.subsetSum(list: list, sum: sum)
        #expect(result == true)
    }

    @Test("Subset doesn't exist: [3, 34, 4, 12, 5, 2], sum 30 => false")
    func subsetDoesNotExist() async throws {
        let solver = KnapsackProblems()
        let list = [3, 34, 4, 12, 5, 2]
        let sum = 30
        let result = solver.subsetSum(list: list, sum: sum)
        #expect(result == false)
    }

    @Test("Empty list, sum 0 => true")
    func emptyListZeroSum() async throws {
        let solver = KnapsackProblems()
        let list: [Int] = []
        let sum = 0
        let result = solver.subsetSum(list: list, sum: sum)
        #expect(result == true)
    }

    @Test("Empty list, positive sum => false")
    func emptyListPositiveSum() async throws {
        let solver = KnapsackProblems()
        let list: [Int] = []
        let sum = 10
        let result = solver.subsetSum(list: list, sum: sum)
        #expect(result == false)
    }

    @Test("Repeated numbers exact match => true")
    func repeatedNumbersExactMatch() async throws {
        let solver = KnapsackProblems()
        let list = [2, 2, 2, 2, 2]
        let sum = 6
        let result = solver.subsetSum(list: list, sum: sum)
        #expect(result == true)
    }

    @Test("Single element equals sum => true")
    func singleElementEqualsSum() async throws {
        let solver = KnapsackProblems()
        let list = [1, 7, 10]
        let sum = 7
        let result = solver.subsetSum(list: list, sum: sum)
        #expect(result == true)
    }

    // MARK: - canPartition tests

    @Test("canPartition: [1,5,11,5] => true (two subsets with equal sum)")
    func canPartitionTrueBasic() async throws {
        let solver = KnapsackProblems()
        let nums = [1, 5, 11, 5]
        let result = solver.canPartition(nums)
        #expect(result == true)
    }

    @Test("canPartition: [1,2,3,5] => false (cannot split equally)")
    func canPartitionFalseBasic() async throws {
        let solver = KnapsackProblems()
        let nums = [1, 2, 3, 5]
        let result = solver.canPartition(nums)
        #expect(result == false)
    }

    @Test("canPartition: empty array => true (two empty subsets)")
    func canPartitionEmpty() async throws {
        let solver = KnapsackProblems()
        let nums: [Int] = []
        let result = solver.canPartition(nums)
        #expect(result == true)
    }

    @Test("canPartition: single element => false unless zero")
    func canPartitionSingleElement() async throws {
        let solver = KnapsackProblems()
        #expect(solver.canPartition([1]) == false)
        #expect(solver.canPartition([0]) == true)
    }

    @Test("canPartition: includes zeros, [0,0,1,1] => true")
    func canPartitionWithZeros() async throws {
        let solver = KnapsackProblems()
        let nums = [0, 0, 1, 1]
        let result = solver.canPartition(nums)
        #expect(result == true)
    }

    // MARK: - countOfSubsetSum tests

    @Test("countOfSubsetSum: [1,2,3,3], target 6 => 3 ways ([1,2,3],[3,3],[1,2,3] with different 3)")
    func countOfSubsetSumBasic() async throws {
        let solver = KnapsackProblems()
        let list = [1, 2, 3, 3]
        let target = 6
        let count = solver.countOfSubsetSum(list, target)
        #expect(count == 3)
    }

    @Test("countOfSubsetSum: [2,3,5,6,8,10], target 10 => 3 ways ([10],[2,8],[5,3,2])")
    func countOfSubsetSumMultipleWays() async throws {
        let solver = KnapsackProblems()
        let list = [2, 3, 5, 6, 8, 10]
        let target = 10
        let count = solver.countOfSubsetSum(list, target)
        #expect(count == 3)
    }

    @Test("countOfSubsetSum: zero target => 1 way (empty subset), regardless of elements")
    func countOfSubsetSumZeroTarget() async throws {
        let solver = KnapsackProblems()
        #expect(solver.countOfSubsetSum([], 0) == 1)
        #expect(solver.countOfSubsetSum([1,2,3], 0) == 1)
    }

    @Test("countOfSubsetSum: no way to form target => 0")
    func countOfSubsetSumNoWays() async throws {
        let solver = KnapsackProblems()
        let list = [4, 5, 6]
        let target = 3
        let count = solver.countOfSubsetSum(list, target)
        #expect(count == 0)
    }

    @Test("countOfSubsetSum: duplicates contributing multiple combinations")
    func countOfSubsetSumWithDuplicates() async throws {
        let solver = KnapsackProblems()
        let list = [1, 1, 1, 1]
        let target = 2
        let count = solver.countOfSubsetSum(list, target)
        // Choose any 2 of 4 ones => C(4,2) = 6
        #expect(count == 6)
    }
}
