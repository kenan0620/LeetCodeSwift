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
    
    // 买卖股票的最佳时机
    static func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 1 {
            return 0
        }
        // 第一天不持有和持有的收益
        var maxProfit0 = 0 ,maxProfit1 = -prices[0]
        for i in 0 ..< prices.count {
            // 第i天不持有和持有的收益
            maxProfit0 = max(maxProfit0, maxProfit1 + prices[i])
            maxProfit1 = max(maxProfit1,  -prices[i])
        }
        // 最后需要卖出,所以是不持有
        return maxProfit0
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
    
    /// Fizz Buzz
    static func fizzBuzz(_ n: Int) -> [String] {
        
        var array:[String] = [String](repeating: "", count: n + 1)
        
        if n == 1 {
            return ["1"]
        }
        
        for i in 1 ..< n + 1 {
            let mod15 = i % 15
            let mod3 = i % 3
            let mod5 = i % 5
            
            if mod15 == 0 {
                array[i] = "FizzBuzz"
            }else if  mod3 == 0{
                array[i] = "Fizz"
            }else if  mod5 == 0{
                array[i] = "Buzz"
            }else{
                array[i] = "\(i)"
            }
        }
        array.remove(at: 0)
        return array
    }
    
    /// 计数质数
    static func countPrimes(_ n: Int) -> Int {
        if n < 3 {
            return 0
        }
        var count: Int = 0
        var isPrimes = [Bool](repeating: true, count: n)
        
        for index in 2 ..< n {
            if isPrimes[index] {
                //步长为index，即：每次都是index的倍数
                var i = 2*index
                while i < n {
                    //将index的倍数设置为合数
                    isPrimes[i] = false
                    i += index
                }
            }
        }
        for index in 2 ..< n {
            if isPrimes[index] {
                count += 1
            }
        }
        
        return count
        
    }
    
    static func isPrimes(_ n: Int) -> Int {
        
        for i in 2 ..< n {
            if n % i == 0 {
                return 0
            }
        }
        
        print("质数" + "\(n)")
        return 1
    }
    
}

func countPrimes(_ n: Int) -> Int {
    var count = 0
    if n == 0 || n == 1 || n == 2{
        return count
    }
    for i in 2 ..< n {
        count += isPrimes(i)
    }
    
    return count
}

func isPrimes(_ n: Int) -> Int {
    
    for i in 2 ..< n {
        if n % i == 0 {
            return 0
        }
    }
    
    return 1
}
