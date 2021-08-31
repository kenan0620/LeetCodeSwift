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
    
    // 验证二叉搜索树
    static func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, Int.min, Int.max)
    }
    
    static func isValidBST(_ root: TreeNode? ,_ min: Int, _ max: Int) -> Bool{
        //如果不存在则返回true
        guard let tree = root else {
            return true
        }
        //节点值大于最大值 或者小于最小值(区间)
        if tree.val >= max || tree.val <= min {
            return false
        }
        //归根结底还是需要递归
        return isValidBST(tree.left, min, tree.val) && isValidBST(tree.right, tree.val, max)
    }
}

