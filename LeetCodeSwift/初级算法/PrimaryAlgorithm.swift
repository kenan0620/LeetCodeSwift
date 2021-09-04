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
}
