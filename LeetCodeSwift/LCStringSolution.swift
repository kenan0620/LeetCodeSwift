//
//  LCStringSolution.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/8/4.
//

import Foundation

class LCStringSolution {
    // 反转字符串
    static func reverseString(_ s: inout [Character]) {
        // 递归、双指针
        var index = 0
        while index < s.count / 2 {
            s.swapAt(index, s.count - 1 - index)
            index += 1
        }
    }
    
    static func reverseStringTwo(_ s: inout [Character]) {
        // 反转
        s.reverse()
    }
    static func reverseStringThree(_ s: inout [Character]) {
        // 循环、双指针
        for i in 0 ..< s.count / 2 {
            s.swapAt(i, s.count - 1 - i)
        }
    }
}
