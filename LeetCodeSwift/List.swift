//
//  List.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/7/22.
//  链表

import Foundation

/// 节点
class ListNode{
    var val : Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class ListSolution {
    /**
     leetbook 力扣 --> 初级算法--> 链表
     https://leetcode-cn.com/leetbook/read/top-interview-questions-easy/xnarn7/
     */
    
    /**
     1、删除链表中的节点
     请编写一个函数，使其可以删除某个链表中给定的（非末尾）节点。传入函数的唯一参数为 要被删除的节点 。
     现有一个链表 -- head = [4,5,1,9]，
     输入：head = [4,5,1,9], node = 5
     输出：[4,1,9]
     解释：给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.
     */
    static func deleteNode(_ node: ListNode?){
        node?.val = (node?.next!.val)!
        node?.next = node?.next!.next
    }
    
    /**
     给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
     
     */
    
    static func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        return head;
    }
    
    /**
     反转链表
     如果链表不空,临时变量存储next, 然后链表的next指向新节点, 新链表为指向后的链表, 链表再转为临时链表
     重复操作, 直至链表为空结束
     */
    static func reverseList(_ head: ListNode?) -> ListNode? {
 
        var old = head
        var newHead: ListNode? = nil
        while old != nil {
            let tmp = old?.next
            old?.next = newHead
            newHead = old
            old = tmp
        }
        
        return newHead
    }
    
    
}



