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
        lcArray()
    }
    
    func lcArray() -> Void {

//        var duplicatesArray = [0,1,1,1,2,3,4,5,6,7,8,9,9]
//
//        let length = LCArraySolution.removeDuplicates(&duplicatesArray)
//
//        print("删除后的数组长度是",length)
        
//        let maxProfitArray = [1,8,5,9,2,6,4,3,1,7]
//
//        let length = LCArraySolution.maxProfit(maxProfitArray)
//
//        print("最大获益是",length)
        
//        var rotateArray = [1,8,5,9,2,6,4,3,1,7]
//
//         LCArraySolution.rotateFive(&rotateArray, 5)
        
        
        
//        let containsDuplicateArray = [1,8,5,9,2,6,4,3,8,7]
//
//        let result =
//        LCArraySolution.containsDuplicateTwo(containsDuplicateArray)
//
//        print(result ? "存在": "不存在")
        
//        let array = [1,1,2,2,3,4,4,5,6,5,6,7,8,9,8,9,7]
//
//       let num = LCArraySolution.singleNumber(array)
//        print(num)
        
//        let array1 = [1,2,3,4,4,4,5,6,7,8,9]
//        let array2 = [4,4,4,4,6,7,18,19,25,6757,89,23,97,46,67,34,54,889]
//       let num = LCArraySolution.intersectFour(array1, array2)
//        print(num)
        
        let array1 = [2,9,9]

//
       let num = LCArraySolution.plusOneTwo(array1)
        print(num)
    }
   
    func sort() {
        let dataArray = [3,44,38,5,47,15,36,26,27,2,46,4,19,50,48]
        
        print("冒泡排序", bubbleSort(array: dataArray))
        print("选择排序", selectionSort(array: dataArray))
        print("插入排序", insertionSort(array: dataArray))
        print("快速排序", quickSort(array: dataArray))

    }
    
    func list() {
        let endNode = ListNode.init(0)
        let fourNode = ListNode.init(1)
        fourNode.next = endNode
        let threeNode = ListNode.init(2)
        threeNode.next = fourNode
        let secondNode = ListNode.init(2)
        secondNode.next = threeNode
        let firstNode = ListNode.init(1)
        firstNode.next = secondNode
        let headNode = ListNode.init(0)
        headNode.next = firstNode

//        let node =
//        ListSolution.reverseListTwo(headNode)
//
//        print(node as Any)
//
//        let nodeOne =
//        ListSolution.reverseListOne(node)
//
//        print(nodeOne as Any)
        
        print(LCListSolution.isPalindromeOne(headNode))
    }
    
    
}

