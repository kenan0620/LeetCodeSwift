//
//  LCListSolution.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/7/26.
//

import Foundation
/// 节点
class ListNode: NSObject{
    var val : Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class LCListSolution {
    
    /**
     1、删除链表中的节点
     */
    static func deleteNode(_ node: ListNode?){
        node?.val = (node?.next!.val)!
        node?.next = node?.next!.next
    }
    
    /**
     2、给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
     */
    
    static func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let resultHead = ListNode(-1)
        resultHead.next = head
        var fast = resultHead, slow = resultHead, index = 0
        while fast.next != nil {
            // 让快慢指针同时指向下一个节点,直到链表结束,此时快慢指针相差n个
            
            fast = fast.next!
            index += 1
            if index > n {
                slow = slow.next!
            }
        }
        // 让慢指针指向下一个节点即可
        slow.next = slow.next!.next
        
        return resultHead.next
    }
    static func removeNthFromEndOne(_ head: ListNode?, _ n: Int) -> ListNode? {
        let index = nodeLength(head) - n
        
        if index == 0 {
            // 删除第一个
            return head?.next
        }
        
        var newHead = head
        for _ in 0 ..< index - 1 {
            newHead = newHead?.next
        }
        newHead?.next = newHead?.next?.next
        
        return head;
    }
    static private func nodeLength(_ head: ListNode?) -> Int{
        
        if head == nil {
            return 0
        }
        
        return nodeLength(head?.next) + 1
    }
    
    
    /**
     反转链表 1、迭代
     如果链表不空,临时变量存储next, 然后链表的next指向新节点, 新链表为指向后的链表, 链表再转为临时链表
     重复操作, 直至链表为空结束
     时间复杂度：O(n)
     执行用时：12 ms 内存消耗：14.5 MB
     */
    static func reverseListOne(_ head: ListNode?) -> ListNode? {
        // 返回链表
        var newHead: ListNode? = nil
        // 循环节点
        var old = head
        while old != nil {
            // 先定义临时变量存储next
            let tmp = old?.next
            // 节点指向返回链表(定义新链表承接)
            old?.next = newHead
            // 返回链表等于循环链表
            newHead = old
            // 让循环链表为临时变量,进行继续循环
            old = tmp
        }
        
        return newHead
    }
    
    /**
     反转链表  递归
     时间复杂度：O(n)
     执行用时：16 ms 内存消耗： 15.1 MB
     */
    static func reverseListTwo(_ head: ListNode?) -> ListNode? {
        // 单链表和空链表直接返回
        if head == nil || head?.next == nil{
            return head
        }
        // 递归调用,直到尾节点
        let node : ListNode? = reverseListTwo(head?.next)
        // 直接反转链表节点指向
        head?.next?.next = head
        // 最后next置空
        head?.next = nil
        return node
    }
    
    // 合并两个有序链表
    static func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil{
            return l2 == nil ? l1 : l2
        }
        if l1!.val < l2!.val {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        }else{
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
    
    static func mergeTwoListsTwo(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 链表是否包含空,有空链表则直接返回
        if l1 == nil || l2 == nil{
            return l2 == nil ? l1 : l2
        }
        // 定义返回链表和当前链表
        var resultHead = ListNode(0),curHead = resultHead
        // 定义l1和l2的可变链表(因为l1、l2,不可变,不能进行链表操作)
        var first = l1, second = l2
        // 第一个和第二个链表都不为空的时候执行循环操作
        while first != nil && second != nil {
            // 比较大小
            if first!.val <= second!.val {
                // 当前链表的next指向小的链表
                curHead.next = first
                first = first?.next
            }else if first!.val > second!.val {
                curHead.next = second
                second = second?.next
            }
            // 当前链表指向下一个节点继续循环
            curHead = curHead.next!
        }
        // 当一个链表循环结束的时候,直接拼接另一个链表即可
        curHead.next = first == nil ? second : first
        // 返回next链表
        return resultHead.next
    }
    
    /**
     回文链表
     
     节点(节点值也可以)存数组,对比数组数据是否回文
     O(n) 时间复杂度
     */
    static func isPalindromeOne(_ head:ListNode?) -> Bool{
        if head == nil || head?.next == nil  {
            return true
        }
        var tmp: ListNode? = head
        var list: Array<Int> = []
        
        while tmp != nil {
            list.append((tmp?.val)!)
            tmp = tmp?.next
        }
        
        for i in 0..<list.count/2 {
            if list[i] != list[list.count - 1 - i] {
                return false
            }
        }
        return true
    }
    
    /**
     回文链表
     
     建立快慢指针，通过这两个指针获得两个列表
     O(1) 空间复杂度
     */
    static func isPalindromeTwo(_ head:ListNode?) -> Bool{
        if head == nil || head?.next == nil {
            return true
        }
        var fast: ListNode? = head
        var slow: ListNode? = head
        var nodeArray: [Int] = []
        nodeArray.append(head!.val)
        
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            nodeArray.append(slow!.val)
        }
        
        while slow?.next != nil {
            if nodeArray.count != 0 {
                if nodeArray.removeLast() != slow?.next?.val {
                    return false
                }
            }else{
                return false
            }
            slow = slow?.next
        }
        return true
    }
    
    // 环形链表
    static func hasCycle(_ head: ListNode?) -> Bool {
        //        var node = head
        //        var set  = Set<ListNode>()
        //        while node?.next != nil{
        //            if set.contains(node!) {
        //                return true
        //            }
        //            set.insert(node!)
        //            node = node?.next
        //        }
        //
        //        return false
        
        if head == nil {return false}
        var fast = head
        var slow = head
        while fast != nil && fast?.next != nil && fast?.next?.next != nil {
            fast = fast?.next?.next?.next
            slow = slow?.next
            if fast === slow {
                return true
            }
        }
        return false
        
    }
}





