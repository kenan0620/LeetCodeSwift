//
//  PrimaryAlgorithm.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/9/4.
//  初级算法

import Foundation

class PrimaryAlgorithm {
    
    //MARK: - 排序和搜索
    
    /// 合并两个有序数组
    static func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1, j = n - 1, res = m + n - 1
        while j >= 0 {
            if i >= 0 && nums1[i] > nums2[j] {
                nums1[res] = nums1[i]
                i -= 1
            } else {
                nums1[res] = nums2[j]
                j -= 1
            }
            res -= 1
        }
    }
    /// 第一个错误的版本
    static func firstBadVersion(_ n: Int) -> Int {
        var start = 1, end = n
        
        while start < end {
            let mid = start + (end - start) / 2
            if !isBadVersion(mid) {
                start = mid + 1
            }else{
                end = mid
            }
        }
        return start
    }
    
    static func isBadVersion(_ v: Int) -> Bool{
        return true
    }
    
    /// 爬楼梯
    static func climbStairs(_ n: Int) -> Int {
        
        if n == 1 || n == 2 {
            return n
        }
        // 超时
        //        return climbStairs(n - 1) + climbStairs(n - 2)
        var fx: Int = 0
        var fy: Int = 1
        var total: Int = fx + fy
        for _ in 2 ..< n + 1 {
            fx = fy
            fy = total
            total = fx + fy
        }
        return total
    }
    
    // 最大字序和
    static func maxSubArray(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: nums.count)
        dp[0] = nums[0]
        var maxSum = dp[0]
        for i in 1..<nums.count {
            dp[i] = max(dp[i-1]+nums[i],nums[i])
            maxSum = max(dp[i], maxSum)
        }
        return maxSum
    }
    
    static func rob(_ nums: [Int]) -> Int {
        // 如果只有一天,则直接偷,然后返回第一天内容即为偷窃最高金额
        if nums.count == 1 {
            return nums[0]
        }
        let count = [Int](repeating: 2, count: nums.count)
        // 定义二维数组存储每天偷和不偷的偷窃金额
        var dp = [[Int]](repeating: count, count: nums.count)
        // 第一天不偷
        dp[0][0] = 0
        // 第一天偷
        dp[0][1] = nums[0]
        
        //循环存储
        for i in 1 ..< nums.count {
            // 当天不偷,前一天偷的最大值
            dp[i][0] = max(dp[i-1][0], dp[i-1][1])
            // 当天偷,前一天不偷
            dp[i][1] = nums[i] + dp[i - 1][0]
        }
        
        return max(dp[nums.count - 1][0], dp[nums.count - 1][1])
    }
}

