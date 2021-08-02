//
//  AlgorithmSort.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/8/2.
//

import Foundation

class AlgorithmSort {
    
    static func bubbleSort(array: inout [Int]){
        for i in 0 ..< array.count {
            for j in 0 ..< array.count - 1 - i {
                if array[j] > array[j + 1] {
                    let tmp = array[j]
                    array[j] = array[j + 1]
                    array[j + 1] = tmp
                }
            }
        }
    }
}
