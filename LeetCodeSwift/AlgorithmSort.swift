//
//  AlgorithmSort.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/8/2.
//

import Foundation

class AlgorithmSort {
    
    // 冒泡排序 - 交换排序
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
    // 冒泡排序优化 - 交换排序
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
    
    // 快速排序 - 交换排序
    static func quickSort(nums: inout [Int], low: Int, high: Int){
        // 通过循环判断,让小数据添加到分界值左边,大的在右边组成数组数据
        if low > high {
            return
        }
        var i = low
        var j = high
        
        let key = nums[i]//分界值
        while i < j {// 如果左指针小于右指针
            while i < j && nums[j] > key {//先找到第一个右指针比分界值小的数据
                j -= 1
            }
            nums[i] = nums[j] //赋值分界值位置数据为右指针小数据
            while i < j && nums[i] <= key {//再找到左边第一个比分界值大的数据
                i += 1
            }
            nums[j] = nums[i] // 赋值右指针数据为左指针大数据
        }
        nums[i] = key // 恢复分界值位置数据(循环后,分界值位置数据已经被覆盖,随着i的递增,分界位置也发生变化)
        quickSort(nums: &nums, low: low, high: i - 1)// 左递归
        quickSort(nums: &nums, low: i + 1, high: high)// 右递归
    }
    
    // 插入排序 - 插入排序
    static func insertionSort(nums: inout [Int]){
        for i in 0 ..< nums.count {
            for j in 0 ..< i {//将i插入到i-1中
                if nums[i] < nums[j]{
                    nums.swapAt(i, j)//交换,j的位置一直在变
                }
            }
        }
    }
    
    // 希尔排序 - 插入排序
    static func shellSort(nums: inout [Int]){
        // 设置增量
        var increment = nums.count / 2
        
        while increment > 0 {
            for i in increment ..< nums.count {
                var leftIndex = i - increment// 找到增量位置和增量对应位置的索引
                while leftIndex >= 0 {
                    if nums[leftIndex] > nums[leftIndex+increment] {
                        // 如果对应位置数大,则交换
                        nums.swapAt(leftIndex, leftIndex+increment)
                    }
                    leftIndex -= increment
                }
            }
            increment = increment / 2
        }
    }
}





