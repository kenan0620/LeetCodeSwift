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
        
        sort()
    }
    
   
    func sort() {
        let dataArray = [1,34,65,6,3,87,8,0,9,8]
        
        print("冒泡排序", bubbleSort(array: dataArray))
        print("选择排序", selectionSort(array: dataArray))
        print("插入排序", insertionSort(array: dataArray))

    }
}

