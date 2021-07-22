//
//  ViewController.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/7/20.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        sort()
        
       list()
        
    }
    
   
    func sort() {
        let dataArray = [3,44,38,5,47,15,36,26,27,2,46,4,19,50,48]
        
        print("冒泡排序", bubbleSort(array: dataArray))
        print("选择排序", selectionSort(array: dataArray))
        print("插入排序", insertionSort(array: dataArray))
        print("快速排序", quickSort(array: dataArray))

    }
    
    func list() {
        let endNode = ListNode.init(5)
        let fourNode = ListNode.init(4)
        fourNode.next = endNode
        let threeNode = ListNode.init(3)
        threeNode.next = fourNode
        let secondNode = ListNode.init(2)
        secondNode.next = threeNode
        let firstNode = ListNode.init(1)
        firstNode.next = secondNode
        let headNode = ListNode.init(0)
        headNode.next = firstNode

        let node =
        ListSolution.reverseListTwo(headNode)

        print(node as Any)
        
        let nodeOne =
        ListSolution.reverseListOne(node)
        
        print(nodeOne as Any)
    }
}

