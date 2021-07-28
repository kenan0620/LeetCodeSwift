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
            // 如果两个数相等,则删除第一个
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
            // 如果后一天比前一天价高,我就认为我持有收益
            if prices[i] < prices[i + 1] {
                max = max + prices[i + 1] - prices[i]
            }
        }
        
        return max
    }
    
    /**
     旋转数组
     
     给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
     
     进阶：
     尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
     你可以使用空间复杂度为 O(1) 的 原地 算法解决这个问题吗？
     
     要点: 数学、数组、双指针
     
     */
    static func rotateOne(_ nums: inout [Int], _ k: Int) {
        if k == 0 || nums.count <= 1{
            return
        }
        var arrar = nums
        // 采用新数组去承接,然后求余位置,赋值到新数组
        for i in 0 ..< nums.count {
            arrar[(i + k) % nums.count] = nums[i]
        }
        nums = arrar
    }
    
    static func rotateTwo(_ nums: inout [Int], _ k: Int) {
        if k == 0 || nums.count <= 1{
            return
        }
        /// 旋转整个数组
        nums.reverse()
        /// 获取旋转点
        let length =  k % nums.count
        /// 旋转旋转点前的,这样数据就双旋回正
        nums[0 ..< length].reverse()
        /// 旋转旋转点后到,数据双旋回正
        nums[length ..< nums.count].reverse()
    }
    
    static func rotateThree(_ nums: inout [Int], _ k: Int) {
        if k == 0 || nums.count <= 1{
            return
        }
        /// 获取旋转点,然后数组最后的数据依次添加到前面即可
        for _ in 0 ..< k % nums.count {
            let value = nums.last
            nums.insert(value!, at: 0)
            nums.removeLast()
        }
    }
    /// 环形替换
    static func rotateFour(_ nums: inout [Int], _ k: Int) {
        if k == 0 || nums.count <= 1{
            return
        }
        // rotateOne的另一种写法,思路有了,写作代码会有很多种
        let arrar = Array(nums[(nums.count - k % nums.count) ..< nums.count]) + Array(nums[0 ..< (nums.count - k % nums.count)])
        nums = arrar
    }
    
    static func rotateFive(_ nums: inout [Int], _ k: Int) {
        if k == 0 || nums.count <= 1{
            return
        }
        // 获取需要循环的次数
        let count = gcd(k, nums.count)
        
        for i in 0 ..< count {
            // 获取当前索引
            var current = i
            // 获取当前索引的值
            var prev = nums[i]
            repeat{
                // 获取旋转后的位置
                let next = (current + k) % nums.count
                // 交换位置
                swap(&nums[next], &prev)
                current = next
                
            }while i != current
        }
    }
    
    private  static func gcd(_ a :Int ,_ b :Int) -> Int {
        // 最大公约数
        if a == b {//如果两个数相等.则直接返回
            return a
        }
        let big = max(a, b)
        let small = min(a, b)
        
        var divi = 0
        for i in 1..<small+1 {//选出两个数中较小的那个数将其分解因数
            if small % i  == 0{
                divi = small/i  //分解因子,因为是从1到small遍历.所以i 为较小的那个 ,divi为较大的那个
                if big%divi == 0{//判断divi能否被较大的那个数整除,如果能则divi是最大公约数
                    return divi
                }
            }
        }
        return 1
    }
    
    private static  func swap(_ a: inout Int, _ b: inout Int) -> Void {
        // 交换数据
        let tmp = a
        a = b
        b = tmp
    }
    
    /**
     存在重复元素
     给定一个整数数组，判断是否存在重复元素。
     如果存在一值在数组中出现至少两次，函数返回 true 。如果数组中每个元素都不相同，则返回 false 。
     
     要点: 哈希表、数组、排序
     */
    static func containsDuplicate(_ nums: [Int]) -> Bool {
        /**
         时间复杂度：O(N)，其中 NN 为数组的长度。
         
         空间复杂度：O(N)，其中 NN 为数组的长度。
         */
        if nums.count < 2 {
            return false
        }
        // 不要用数组,因为数组没有字典效率高,会超时
        var dic: [Int: Int] = [:]
        for item in nums {
            let value = dic[item]
            if value != nil {
                return true
            }
            dic.updateValue(item, forKey: item)
        }
        
        return false
    }
    
    static func containsDuplicateTwo(_ nums: [Int]) -> Bool {
        if nums.count < 2 {
            return false
        }
        /**
         时间复杂度：O(N log N)，其中 N 为数组的长度。需要对数组进行排序。
         
         空间复杂度：O(log N)，其中 N 为数组的长度。注意我们在这里应当考虑递归调用栈的深度。
         */
        
        let array = nums.sorted()
        for i in 0 ..< array.count - 1 {
            if array[i] == array [i + 1] {
                return true
            }
        }
        
        return false
    }
    /**
     只出现一次的数字
     给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

     说明：
     你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
     */
    static func singleNumber(_ nums: [Int]) -> Int {
        /**
         时间复杂度：O(n)，其中 n 是数组长度。只需要对数组遍历一次。
         空间复杂度：O(1)。
         */
        if nums.count == 1 {
            return nums.first!
        }
        // 0和任意数据的异或运算都是该数据本身
        var num = 0
        for item in nums {
            // 位运算,异或后,真假为真,理解为二进制即可
            num = num ^ item
        }
        
        return num
    }
}


