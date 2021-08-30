//
//  LCTreeSolution.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/8/30.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
    init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class LCTreeSolution {
    // 二叉树的最大深度
   static func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }

    let left = maxDepth(root?.left)
    let right = maxDepth(root?.right)
    return left > right ? left + 1 : right + 1
    }
}

