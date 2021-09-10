//
//  Solution.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/9/10.
//

import Foundation

class Solution {
    var num: [Int] = []
    
    init(_ nums: [Int]) {
        self.num = nums
    }
    
    // 返回原数据
    func reset() -> [Int] {
        return self.num
    }
    // 返回数组随机打乱后的结果
    func shuffle() -> [Int] {
        var array = self.num
        for i in 0 ..< array.count {
            array.swapAt(i, Int.random(in: i ..< array.count))
        }
        return array
    }
}
