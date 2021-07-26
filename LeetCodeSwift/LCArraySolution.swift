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
}
