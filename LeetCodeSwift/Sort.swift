//
//  LCListSolution.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/7/20.
// 排序

import Foundation

/**
 冒泡排序
 
 冒泡排序是一种简单的排序算法。它重复地走访过要排序的数列，一次比较两个元素，如果它们的顺序错误就把它们交换过来。走访数列的工作是重复地进行直到没有再需要交换，也就是说该数列已经排序完成。这个算法的名字由来是因为越小的元素会经由交换慢慢“浮”到数列的顶端。
 
 算法描述
 比较相邻的元素。如果第一个比第二个大，就交换它们两个；
 对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对，这样在最后的元素应该会是最大的数；
 针对所有的元素重复以上的步骤，除了最后一个；
 重复步骤1~3，直到排序完成。
 */
func bubbleSort(array: Array<Int>) -> Array<Int> {
    var sortArray = array
    for i in 0 ..< sortArray.count {
        for j in 0 ..< sortArray.count - i - 1 {
            if sortArray[j] > sortArray[j + 1] {
                let tempValue = sortArray[j]
                sortArray[j] = sortArray[j + 1]
                sortArray[j + 1] = tempValue
            }
        }
    }
    
    return sortArray
}

/**
 选择排序(Selection-sort)是一种简单直观的排序算法。它的工作原理：首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置，然后，再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。以此类推，直到所有元素均排序完毕。
 
 
 
 算法描述
 n个记录的直接选择排序可经过n-1趟直接选择排序得到有序结果。具体算法描述如下：
 
 初始状态：无序区为R[1..n]，有序区为空；
 第i趟排序(i=1,2,3…n-1)开始时，当前有序区和无序区分别为R[1..i-1]和R(i..n）。该趟排序从当前无序区中-选出关键字最小的记录 R[k]，将它与无序区的第1个记录R交换，使R[1..i]和R[i+1..n)分别变为记录个数增加1个的新有序区和记录个数减少1个的新无序区；
 n-1趟结束，数组有序化了。
 
 算法分析
 表现最稳定的排序算法之一，因为无论什么数据进去都是O(n2)的时间复杂度，所以用到它的时候，数据规模越小越好。唯一的好处可能就是不占用额外的内存空间了吧。理论上讲，选择排序可能也是平时排序一般人想到的最多的排序方法了吧。
 */
func selectionSort(array: Array<Int>) -> Array<Int> {
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


/**
 插入排序
 插入排序（Insertion-Sort）的算法描述是一种简单直观的排序算法。它的工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。
 
 算法描述
 一般来说，插入排序都采用in-place在数组上实现。具体算法描述如下：
 
 从第一个元素开始，该元素可以认为已经被排序；
 取出下一个元素，在已经排序的元素序列中从后向前扫描；
 如果该元素（已排序）大于新元素，将该元素移到下一位置；
 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置；
 将新元素插入到该位置后；
 重复步骤2~5。
 
 算法分析
 插入排序在实现上，通常采用in-place排序（即只需用到O(1)的额外空间的排序），因而在从后向前扫描过程中，需要反复把已排序元素逐步向后挪位，为最新元素提供插入空间。
 */
func insertionSort(array: Array<Int>) -> Array<Int> {
    var sortArray = array
    
    for i in 0 ..< array.count {
        let tempValue = sortArray[i]
        var insertIndex: Int = 0
        
        for j in 0 ..< i {
            insertIndex = i - 1 - j
            if tempValue > sortArray[insertIndex] {
                insertIndex = i - j
                break
            }
            
            sortArray[insertIndex + 1] = sortArray[insertIndex]
        }
        
        sortArray[insertIndex] = tempValue
    }
    
    return sortArray
}

/**
 快速排序
 */
func quickSort(array: Array<Int>) -> Array<Int> {
    var sortArray = array
    
    if sortArray.count <= 1 {
        return sortArray
    }
    quickSortPrivateMethod(array: &sortArray, leftIndex: 0, rightIndex: sortArray.count - 1)
    return sortArray
}

func quickSortPrivateMethod(array: inout Array<Int>, leftIndex: Int, rightIndex: Int) -> Void {
    var left = leftIndex, right = rightIndex, baseLineIndex = 0
    if left < right {
        baseLineIndex = partition(array: &array, leftIndex: leftIndex, rightIndex: rightIndex)
        quickSortPrivateMethod(array: &array, leftIndex: leftIndex, rightIndex: baseLineIndex - 1)
        quickSortPrivateMethod(array: &array, leftIndex: baseLineIndex + 1, rightIndex: rightIndex)
        
    }
}

func partition(array: inout Array<Int>, leftIndex: Int, rightIndex: Int) -> Int{
    var pivot = leftIndex, index = pivot + 1
    
    var i = index
    while i <= rightIndex {
        if array[i] < array[pivot] {
            swap(array: &array, leftIndex: i, rightIndex: index)
            index += 1
        }
        i += 1
    }
    swap(array: &array, leftIndex: pivot, rightIndex: index - 1)
    
    return index - 1
}

func swap(array: inout Array<Int>, leftIndex: Int, rightIndex: Int) -> Void {
    let temp = array[leftIndex]
    array[leftIndex] = array[rightIndex]
    array[rightIndex] = temp
}
