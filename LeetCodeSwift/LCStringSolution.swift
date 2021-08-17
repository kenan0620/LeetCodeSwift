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
        var map:[Character : Int] = [:]
        for item in s {
            map[item, default: 0] += 1
        }
        
        let array = Array(s)
        
        for i in 0 ..< s.count {
            let char = array[i]
            
            if map[char]! == 1{
                return i
            }
        }
        
        return -1
    }
    
    static func firstUniqCharTwo(_ s: String) -> Int {
        for item in s {
            // 通过找到第一个出现和最后一次出现的索引进行对比
            let start = s.firstIndex(of: item)
            let last = s.lastIndex(of: item)
            if start == last {
                // 索引一致,说明只出现一次,找到位置返回
                let range: Range = s.range(of: "\(item)")!
                let location = s.distance(from: s.startIndex, to: range.lowerBound)
                return location
            }
        }
        return -1
    }
    
    static func firstUniqCharThree(_ s: String) -> Int {
        var map:[Character : Int] = [:]
        for item in s {
            map[item, default: 0] += 1
        }
        
        var firstIndex = -1
        for (key, value) in map {
            if value == 1 {
                let range: Range = s.range(of: "\(key)")!
                let location = s.distance(from: s.startIndex, to: range.lowerBound)
                if firstIndex == -1  || firstIndex > location{
                    firstIndex = location
                }
            }
        }
        
        return firstIndex
    }
    //有效的字母异位词
    static func isAnagram(_ s: String, _ t: String) -> Bool {
        
        if s.count != t.count {
            return false
        }
        
        return Array(s).sorted() == Array(t).sorted()
    }
    
    static func isAnagramTwo(_ s: String, _ t: String) -> Bool {
        
        if s.count != t.count {
            return false
        }
        
        var map:[Character : Int] = [:]
        for item in s {
            map[item, default: 0] += 1
        }
        
        for item in t {
            if map[item] == nil {
                return false
            }else{
                map[item]! -= 1
                
                if map[item]! < 1 {
                    map.removeValue(forKey: item)
                }
            }
        }
        
        if map.count < 1 {
            return true
        }
        
        return false
    }
    
    // 验证回文串
    static func isPalindrome(_ s: String) -> Bool {
        // 在初始化的就进行转换,再采用双指针相较于在对比的时候转换效率更高
        let array:[Character] = Array(s.lowercased())
        var left = 0, right = array.count - 1
        
        var result = true
        
        while left < right {
            if !array[left].isLetter && !array[left].isNumber {
                left += 1
                continue
            }
            if !array[right].isLetter && !array[right].isNumber {
                right -= 1
                continue
            }
            if array[left] != array[right] {
                result = false
                break
            }
            left += 1
            right -= 1
        }
        
        return result
    }
    
    static func isPalindromeSix(_ s: String) -> Bool {
        
        let str = s.filter { $0.isLetter || $0.isNumber }.lowercased()
        
        return str  == String(str.reversed())
    }
    
    static func isPalindromeFive(_ s: String) -> Bool {
        
        var charArray:[Character] = []
        
        for item in s.lowercased() {
            if ( item >= "0" && item <= "9") || (item >= "a" && item <= "z")  {
                charArray.append(item)
            }
        }
        for i in 0 ..< charArray.count / 2 {
            if charArray[i] != charArray[charArray.count - 1 - i] {
                return false
            }
        }
        return true
    }
    static func isPalindromeFour(_ s: String) -> Bool {
        
        let targetStr = deleteSpecialCharacters(s.lowercased())
        
        return Array(targetStr) == Array(targetStr.reversed())
    }
    
    static func isPalindromeThree(_ s: String) -> Bool {
        
        let targetStr = deleteSpecialCharacters(s.lowercased())
        let sArray = Array(targetStr)
        
        var index = 0
        
        while index < sArray.count / 2 {
            if sArray[index] != sArray[sArray.count - 1 - index] {
                return false
            }
            index += 1
        }
        
        return true
    }
    
    static func isPalindromeTwo(_ s: String) -> Bool {
        
        let targetStr = deleteSpecialCharacters(s.lowercased())
        
        let sArray = Array(targetStr)
        
        for i in  0 ..< sArray.count / 2 {
            if sArray[i] != sArray[sArray.count - 1 - i] {
                return false
            }
        }
        
        return true
    }
    
    static private  func deleteSpecialCharacters(_ str: String) -> String {
        let pattern: String = "[^a-zA-Z0-9\u{4e00}-\u{9fa5}]"
        let express = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        return express.stringByReplacingMatches(in: str, options: [], range: NSMakeRange(0, str.count), withTemplate: "")
    }
    
    //字符串转换整数 (atoi)
    static func myAtoi(_ s: String) -> Int {
        let array = s.split(separator: " ")
        
        guard let string = array.first else {
            return 0
        }
        var result: String = ""
        var hasSymbol = false
        if string.hasPrefix("+") || string.hasPrefix("-"){
            hasSymbol = true
        }
        for item in string {
            if item.isNumber || (hasSymbol && (item == "-" || item == "+") && result == "") {
                result.append(item)
            }else{
                break
            }
        }
        
        let value: Double = Double(result) ?? 0
        if value > Double(Int(powl(2, 31)) - 1) {
            return Int(powl(2, 31)) - 1
        }
        if value < Double(Int(powl(-2, 31))) {
            return Int(powl(-2, 31))
        }
        if  Int(value) < Int(powl(-2, 31)) {
            return Int(powl(-2, 31))
        } else if Int(value) > Int(powl(2, 31)) - 1 {
            return Int(powl(2, 31)) - 1
        }
        return Int(value)
    }
}
