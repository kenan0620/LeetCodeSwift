//
//  AlgorithmSort.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/8/2.
//

import Foundation

class AlgorithmSort {
    
    // 冒泡排序
    static func bubbleSort(nums: inout [Int]){
        for i in 0 ..< nums.count {
            for j in 0 ..< nums.count - 1 - i {
                if nums[j] > nums[j + 1] {
                    // 系统交换方法
                    nums.swapAt(j, j + 1)
                }
            }
        }
    }
    // 冒泡排序优化
    static func bubbleSortOptimize(nums: inout [Int]){
        // 设置交换标志位
        var flag: Bool
        for i in 0 ..< nums.count {
            flag = false
            for j in 0 ..< nums.count - 1 - i {
                if nums[j] > nums[j + 1] {
                    nums.swapAt(j, j + 1)
                    // 如果发生交换则标志位为true
                    flag = true
                }
            }
            if !flag {
                break
            }
        }
    }
}




