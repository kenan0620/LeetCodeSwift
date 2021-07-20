//
//  Sort.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/7/20.
//

import Foundation

/// 冒泡排序
func bubbleSort(array: Array<Int>) -> Array<Int> {
    /**
     采用遍历 双层循环
     比较相邻的两个,如果大就交换,直到最后最大的排最后
     再次内循环,依次类推 j会越来约小,因为已经排好了i前面部分的,
     */
    var sortArray = array
    for i in 0 ..< array.count {
        for j in 0 ..< array.count - i - 1 {
            if sortArray[j] > sortArray[j + 1] {
                let tempValue = sortArray[j]
                sortArray[j] = sortArray[j + 1]
                sortArray[j + 1] = tempValue
            }
//            print(i,j, sortArray[j], sortArray[j + 1], sortArray)
        }
    }
    
    return sortArray
}

/// 选择排序
func selectionSort(array: Array<Int>) -> Array<Int> {
    /**
     选择排序 也是双层循环
     拿到数组的第一个数据,然后跟剩下的数据对比,找到最小的然后与第一个进行替换,
     以此类推,第二个替换,etc 
     */
    var sortArray = array
    var minIndex : Int
    var temp : Int
    for i in 0 ..< array.count - 1 {
        minIndex = i
        for  j in minIndex + 1 ..< array.count {
            if sortArray[j] < sortArray[minIndex] {
                minIndex = j
            }
        }
        
        temp = sortArray[i]
        sortArray[i] = sortArray[minIndex]
        sortArray[minIndex] = temp
    }

    return sortArray;
}
