//
//  LCArraySolution.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/7/26.
//

import Foundation

class LCArraySolution {
    /**
     删除排序数组中的重复项
     给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。
     
     不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
     不需要考虑数组中超出新长度后面的元素。
     
     要点:数组、双指针
     */
    
    static func removeDuplicates(_ nums: inout[Int]) -> Int {
        /// 先判空
        if nums.count == 0 {
            return 0
        }
        /// 左指针
        var left = 0
        /// 右指针
        for right: Int in 1 ..< nums.count {
            /// 如果左指针数据不等于右指针数据
            if nums[left] != nums[right] {
                /// 左指针右移一位,然后左指针赋值右指针内容
                left += 1
                nums[left] = nums[right];
            }
        }
        
        /// 左指针长度加1,即为新数组的长度,指针后面的数据属于无用数据
        return left + 1
    }
    
    static func removeDuplicatesOne(_ nums: inout[Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        let n = nums.count
        for i: Int in 0 ..< n - 1 {
            let tmp = nums[n - i - 1]
            let tmp1 = nums[n - i - 1 - 1]
            if tmp == tmp1 {
                nums.remove(at: n - i - 1)
            }
        }
        
        return nums.count
    }
    
    /**
     给定一个数组 prices ，其中 prices[i] 是一支给定股票第 i 天的价格。
     设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。
     
     注意：你不能同时参与多笔交易(你必须在再次购买前出售掉之前的股票)
     
     要点: 贪心、数组、动态规划
     算法核心：相邻两天，高抛低吸
     */
    static func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0;
        }
        var max = 0
        
        for i in 0 ..< prices.count - 1 {
            if prices[i] < prices[i + 1] {
                max = max + prices[i + 1] - prices[i]
            }
        }
        
        return max
    }
}


