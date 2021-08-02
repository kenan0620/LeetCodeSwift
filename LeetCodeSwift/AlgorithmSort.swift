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
    
    // 快速排序
    static func quickSort(nums: inout [Int], low: Int, high: Int){
        if low > high {
            return
        }
        var i = low
        var j = high
        
        let key = nums[i]
        while i < j {// 如果左指针小于右指针
            while i < j && nums[j] > key {//比较大小,指针移动
                j -= 1
            }
            
            nums[i] = nums[j]
            while i < j && nums[i] <= key {//比较大小,指针移动
                i += 1
            }
            nums[j] = nums[i]
        }
        nums[i] = key//分界值
        quickSort(nums: &nums, low: low, high: i - 1)// 左递归
        quickSort(nums: &nums, low: i + 1, high: high)// 右递归
    }
}





