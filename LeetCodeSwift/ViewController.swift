//
//  ViewController.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/7/20.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lcString()
    }
    
    func lcArray() -> Void {
        
        //        var duplicatesArray = [0,1,1,1,2,3,4,5,6,7,8,9,9]
        //
        //        let length = LCArraySolution.removeDuplicates(&duplicatesArray)
        //
        //        print("删除后的数组长度是",length)
        
        //        let maxProfitArray = [1,8,5,9,2,6,4,3,1,7]
        //
        //        let length = LCArraySolution.maxProfit(maxProfitArray)
        //
        //        print("最大获益是",length)
        
        //        var rotateArray = [1,8,5,9,2,6,4,3,1,7]
        //
        //         LCArraySolution.rotateFive(&rotateArray, 5)
        
        
        
        //        let containsDuplicateArray = [1,8,5,9,2,6,4,3,8,7]
        //
        //        let result =
        //        LCArraySolution.containsDuplicateTwo(containsDuplicateArray)
        //
        //        print(result ? "存在": "不存在")
        
        //        let array = [1,1,2,2,3,4,4,5,6,5,6,7,8,9,8,9,7]
        //
        //       let num = LCArraySolution.singleNumber(array)
        //        print(num)
        
        //        let array1 = [1,2,3,4,4,4,5,6,7,8,9]
        //        let array2 = [4,4,4,4,6,7,18,19,25,6757,89,23,97,46,67,34,54,889]
        //       let num = LCArraySolution.intersectFour(array1, array2)
        //        print(num)
        
        //        let array1 = [2,9,9]
        //
        //       let num = LCArraySolution.plusOneTwo(array1)
        //        print(num)
        
        //        var array1 = [2,0,0,1,0,9,9]
        //
        //       LCArraySolution.moveZeroesThree(&array1)
        
        //        var arr1 = [1,34,6,89,9,3,66]
        //        var arr2 = [11,34,6,89,9,3]
        //
        //        let num = sumOneH(&arr1, &arr2)
        //        print(num)
        
        //        let array = [2,7,11,15]
        //        let num = LCArraySolution.twoSum(array,23)
        //        print(num)
        
        //        let array: [[Character]] = [["5","3",".",".","7",".",".",".","."]
        //                                    ,["6",".",".","1","9","5",".",".","."]
        //                                    ,[".","9","8",".",".",".",".","6","."]
        //                                    ,["8",".",".",".","6",".",".",".","3"]
        //                                    ,["4",".",".","8",".","3",".",".","1"]
        //                                    ,["7",".",".",".","2",".",".",".","6"]
        //                                    ,[".","6",".",".",".",".","2","8","."]
        //                                    ,[".",".",".","4","1","9",".",".","5"]
        //                                    ,[".",".",".",".","8",".",".","7","9"]]
        //
        //        let num = LCArraySolution.isValidSudoku(array)
        //
        //        print(num ? "是数独": "不是数独")
        
        //        var array = [[1,2,3],[4,5,6],[7,8,9]]
        
        //        LCArraySolution.rotate(&array)
    }
    
    func sumOneH(_ nums: inout [Int], _ nums2: inout [Int]) -> [(Int, Int)] {
        nums.sort()
        nums2.sort()
        
        var array: [(Int, Int)] = []
        
        var index: Int = 0
        var index1: Int = nums2.count
        
        if nums.last! + nums2.last! < 100{
            return []
        }
        
        while index < nums.count {
            print(index)
            if nums2.contains(100 - nums[index]) {
                array.append((nums[index], 100 - nums[index]))
                index += 1
            }else{
                index += 1
            }
        }
        print(nums,nums2)
        
        return array
    }
    
    
    
    func sort() {
        let nums = [1, 2, 3, 4, 1, 4, 5, 0, 5,]
        //        var nums = [1,2,4,5,7,9,10,34,44,56]
        //        print("冒泡排序", AlgorithmSort.bubbleSortOptimize(nums: &nums))
        //        print("快速排序", AlgorithmSort.quickSort(nums: &nums, low: 0, high: nums.count - 1))
        //        print("插入排序", AlgorithmSort.insertionSort(nums: &nums))
        //        print("希尔排序", AlgorithmSort.shellSort(nums: &nums))
        //        print("选择排序", AlgorithmSort.selectionSort(nums: &nums))
        //        print("堆排序", AlgorithmSort.heapSort(nums: &nums))
        //        print("归并排序", AlgorithmSort.mergeSort(nums))
        //        print("计数排序", AlgorithmSort.countingSort(nums))
        //        print("桶排序", AlgorithmSort.bucketSort(nums, 3))
        //                print("基数排序", AlgorithmSort.bucketSort(nums, 3))
    }
    
    func lcString() {
        //        var chars: [Character] = ["1","2","s","g","#","&","d","m","i"]
        //        LCStringSolution.reverseString(&chars)
        
        //        let num = 1534236469
        //
        //        let nums = LCStringSolution.reverse(num)
        
        //        let s = "leetcode"
        //
        //        let nums = LCStringSolution.firstUniqChar(s)
        //        print(nums)
        
        //        let s = "rst", t = "str"
        //
        //
        //        let nums = LCStringSolution.isAnagram(s, t)
        //        let string = "A man, a plan, a canal: Panama"
        //        let nums = LCStringSolution.isPalindrome(string)
        //        print( nums ? "是": "不是")
        
        //        let string = "20000000000000000000"
        //
        //        let nums = LCStringSolution.myAtoi(string)
        //        print(nums)
//        let haystack = "abc"
//        , needle = "c"
//        let num =  LCStringSolution.strStr(haystack, needle)
//        print(num)
//        let array = ["t1q","tat6981","t345"]
//
//        let num =  LCStringSolution.longestCommonPrefix(array)
//                print("最长公共前缀是:",num)
        
        
        let num =  LCStringSolution.countAndSay(5)
        print("外观数列是:",num)
        
    }
 
    
    func list() {
        let endNode = ListNode.init(0)
        let fourNode = ListNode.init(1)
        fourNode.next = endNode
        let threeNode = ListNode.init(2)
        threeNode.next = fourNode
        let secondNode = ListNode.init(2)
        secondNode.next = threeNode
        let firstNode = ListNode.init(1)
        firstNode.next = secondNode
        let headNode = ListNode.init(0)
        headNode.next = firstNode
        
        //        let node =
        //        ListSolution.reverseListTwo(headNode)
        //
        //        print(node as Any)
        //
        //        let nodeOne =
        //        ListSolution.reverseListOne(node)
        //
        //        print(nodeOne as Any)
        
        print(LCListSolution.isPalindromeOne(headNode))
    }
    
    
}

