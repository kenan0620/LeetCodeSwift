//
//  MinStack.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/9/10.
//

import Foundation

class MinStack {
    /// 栈数据存储
    var data: [Int] = []
    /// 最小值
    var minNum: Int?

    init() {
    }
    
    func push(_ val: Int) {
        /// 入栈,数组加操作,然后对比最小值
        self.data.append(val)
        minNum = min(minNum ?? .max, val)
    }
    
    func pop() {
        /// 出栈
        let last = self.data.popLast()
        /// 最小值判断
        if last == minNum {
            minNum = self.data.min()
        }
    }
    
    func top() -> Int {
        return self.data.last!
    }
    
    func getMin() -> Int {
        return minNum!
    }
}
