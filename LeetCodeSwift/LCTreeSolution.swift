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
    
    // 对称二叉树
    static func isSymmetric(_ root: TreeNode?) -> Bool {
        
        guard let tree = root else {
            return true
        }
        
        return isSymmetric(tree.left, tree.right)
    }
    
    static func isSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        // 左右节点是否存在,都不存在则返回true
        if left == nil && right == nil {
            return true
        }
        // 如果其中一个节点不存则返回false,或者节点值不相等
        guard let leftTree = left , let rightTree = right else {
            return false
        }
        if leftTree.val != rightTree.val{
            return false
        }
        // 返回左右节点的字节点是否对称相应节点
        return isSymmetric(leftTree.left, rightTree.right) && isSymmetric(leftTree.right, rightTree.left)
    }
    
    //二叉树的层序遍历
    static func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let tree = root else { return [] }
        var array: [TreeNode] = [tree]
        var result: [[Int]] = []
        //临时存储数组
        var nextLevelArray: [TreeNode] = []
        while array.count != 0 {
            var temp: [Int] = []
            for node in array {
                temp.append(node.val)
                if let left = node.left {
                    nextLevelArray.append(left)
                }
                if let right = node.right {
                    nextLevelArray.append(right)
                }
            }
            result.append(temp)
            array.removeAll()
            array = nextLevelArray
            nextLevelArray.removeAll()
        }
        return result
    }
    
    //将有序数组转换为二叉搜索树
    static func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return sortedArrayToBST(0, nums.count - 1, nums)
    }
    
    static func sortedArrayToBST(_ start: Int, _ end: Int, _ num: [Int]) -> TreeNode?{
        if start > end {
            return nil
        }
        let mid = (start + end) / 2
        let root = TreeNode.init(num[mid])
        root.left = sortedArrayToBST(start, mid - 1, num)
        root.right = sortedArrayToBST(mid + 1, end, num)
        return root
    }
}

 func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    return sortedArrayToBST(0, nums.count - 1, nums)
}

 func sortedArrayToBST(_ start: Int, _ end: Int, _ num: [Int]) -> TreeNode?{
    if start > end {
        return nil
    }
    // 取中
    let mid = (start + end) / 2
    let root = TreeNode.init(num[mid])
    // 继续取中
    root.left = sortedArrayToBST(start, mid - 1, num)
    // 继续取中
    root.right = sortedArrayToBST(mid + 1, end, num)
    return root
}
