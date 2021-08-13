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
    
    // 整数反转
    static func reverse(_ x: Int) -> Int {
        // 先判断输入内容是否超限
        if x < Int(powl(-2, 31)) || x > Int(powl(2, 31)) - 1 {
            return 0
        }
        var num = x
        var result: Int = 0
        // 递归
        while num != 0 {
            // 求余
            let mod = num % 10
            // 返回数据 = 上一步的返回数据 乘以 10 加上这次循环余数
            result = result * 10 + mod
            // 不断减小num,跳出循环
            num = num / 10
        }
        // 判断结果内容是否超限
        if result < Int(powl(-2, 31)) || result > Int(powl(2, 31)) - 1 {
            return 0
        }
        return result
    }
    
    //字符串中的第一个唯一字符
    static func firstUniqChar(_ s: String) -> Int {
        print(s)
        
        return 0
    }
}

