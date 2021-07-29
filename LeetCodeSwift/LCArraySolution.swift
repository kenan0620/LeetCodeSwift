//
//  LCArraySolution.swift
//  LeetCodeSwift
//
//  Created by 柯南 on 2021/7/26.
//

import Foundation

class LCArraySolution {
    /**
     删除排序数组中的重复项
     给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。
     
     不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
     不需要考虑数组中超出新长度后面的元素。
     
     要点:数组、双指针
     */
    
    static func removeDuplicates(_ nums: inout[Int]) -> Int {
        /// 先判空
        if nums.count == 0 {
            return 0
        }
        /// 左指针
        var left = 0
        /// 右指针
        for right: Int in 1 ..< nums.count {
            /// 如果左指针数据不等于右指针数据
            if nums[left] != nums[right] {
                /// 左指针右移一位,然后左指针赋值右指针内容
                left += 1
                nums[left] = nums[right];
            }
        }
        
        /// 左指针长度加1,即为新数组的长度,指针后面的数据属于无用数据
        return left + 1
    }
    
    static func removeDuplicatesOne(_ nums: inout[Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        let n = nums.count
        for i: Int in 0 ..< n - 1 {
            let tmp = nums[n - i - 1]
            let tmp1 = nums[n - i - 1 - 1]
            // 如果两个数相等,则删除第一个
            if tmp == tmp1 {
                nums.remove(at: n - i - 1)
            }
        }
        
        return nums.count
    }
    
    /**
     给定一个数组 prices ，其中 prices[i] 是一支给定股票第 i 天的价格。
     设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。
     
     注意：你不能同时参与多笔交易(你必须在再次购买前出售掉之前的股票)
     
     要点: 贪心、数组、动态规划
     算法核心：相邻两天，高抛低吸
     */
    static func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0;
        }
        var max = 0
        
        for i in 0 ..< prices.count - 1 {
            // 如果后一天比前一天价高,我就认为我持有收益
            if prices[i] < prices[i + 1] {
                max = max + prices[i + 1] - prices[i]
            }
        }
        
        return max
    }
    
    /**
     旋转数组
     
     给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
     
     进阶：
     尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
     你可以使用空间复杂度为 O(1) 的 原地 算法解决这个问题吗？
     
     要点: 数学、数组、双指针
     
     */
    static func rotateOne(_ nums: inout [Int], _ k: Int) {
        if k == 0 || nums.count <= 1{
            return
        }
        var arrar = nums
        // 采用新数组去承接,然后求余位置,赋值到新数组
        for i in 0 ..< nums.count {
            arrar[(i + k) % nums.count] = nums[i]
        }
        nums = arrar
    }
    
    static func rotateTwo(_ nums: inout [Int], _ k: Int) {
        if k == 0 || nums.count <= 1{
            return
        }
        /// 旋转整个数组
        nums.reverse()
        /// 获取旋转点
        let length =  k % nums.count
        /// 旋转旋转点前的,这样数据就双旋回正
        nums[0 ..< length].reverse()
        /// 旋转旋转点后到,数据双旋回正
        nums[length ..< nums.count].reverse()
    }
    
    static func rotateThree(_ nums: inout [Int], _ k: Int) {
        if k == 0 || nums.count <= 1{
            return
        }
        /// 获取旋转点,然后数组最后的数据依次添加到前面即可
        for _ in 0 ..< k % nums.count {
            let value = nums.last
            nums.insert(value!, at: 0)
            nums.removeLast()
        }
    }
    /// 环形替换
    static func rotateFour(_ nums: inout [Int], _ k: Int) {
        if k == 0 || nums.count <= 1{
            return
        }
        // rotateOne的另一种写法,思路有了,写作代码会有很多种
        let arrar = Array(nums[(nums.count - k % nums.count) ..< nums.count]) + Array(nums[0 ..< (nums.count - k % nums.count)])
        nums = arrar
    }
    
    static func rotateFive(_ nums: inout [Int], _ k: Int) {
        if k == 0 || nums.count <= 1{
            return
        }
        // 获取需要循环的次数
        let count = gcd(k, nums.count)
        
        for i in 0 ..< count {
            // 获取当前索引
            var current = i
            // 获取当前索引的值
            var prev = nums[i]
            repeat{
                // 获取旋转后的位置
                let next = (current + k) % nums.count
                // 交换位置
                swap(&nums[next], &prev)
                current = next
                
            }while i != current
        }
    }
    
    private  static func gcd(_ a :Int ,_ b :Int) -> Int {
        // 最大公约数
        if a == b {//如果两个数相等.则直接返回
            return a
        }
        let big = max(a, b)
        let small = min(a, b)
        
        var divi = 0
        for i in 1..<small+1 {//选出两个数中较小的那个数将其分解因数
            if small % i  == 0{
                divi = small/i  //分解因子,因为是从1到small遍历.所以i 为较小的那个 ,divi为较大的那个
                if big%divi == 0{//判断divi能否被较大的那个数整除,如果能则divi是最大公约数
                    return divi
                }
            }
        }
        return 1
    }
    
    private static  func swap(_ a: inout Int, _ b: inout Int) -> Void {
        // 交换数据
        let tmp = a
        a = b
        b = tmp
    }
    
    /**
     存在重复元素
     给定一个整数数组，判断是否存在重复元素。
     如果存在一值在数组中出现至少两次，函数返回 true 。如果数组中每个元素都不相同，则返回 false 。
     
     要点: 哈希表、数组、排序
     */
    static func containsDuplicate(_ nums: [Int]) -> Bool {
        /**
         时间复杂度：O(N)，其中 NN 为数组的长度。
         
         空间复杂度：O(N)，其中 NN 为数组的长度。
         */
        if nums.count < 2 {
            return false
        }
        // 不要用数组,因为数组没有字典效率高,会超时
        var dic: [Int: Int] = [:]
        for item in nums {
            let value = dic[item]
            if value != nil {
                return true
            }
            dic.updateValue(item, forKey: item)
        }
        
        return false
    }
    
    static func containsDuplicateTwo(_ nums: [Int]) -> Bool {
        if nums.count < 2 {
            return false
        }
        /**
         时间复杂度：O(N log N)，其中 N 为数组的长度。需要对数组进行排序。
         
         空间复杂度：O(log N)，其中 N 为数组的长度。注意我们在这里应当考虑递归调用栈的深度。
         */
        
        let array = nums.sorted()
        for i in 0 ..< array.count - 1 {
            if array[i] == array [i + 1] {
                return true
            }
        }
        
        return false
    }
    /**
     只出现一次的数字
     给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
     
     说明：
     你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
     */
    static func singleNumber(_ nums: [Int]) -> Int {
        /**
         时间复杂度：O(n)，其中 n 是数组长度。只需要对数组遍历一次。
         空间复杂度：O(1)。
         */
        if nums.count == 1 {
            return nums.first!
        }
        // 0和任意数据的异或运算都是该数据本身
        var num = 0
        for item in nums {
            // 位运算,异或后,真假为真,理解为二进制即可
            num = num ^ item
        }
        
        return num
    }
    
    
    /**
     两个数组的交集 II
     
     给定两个数组，编写一个函数来计算它们的交集。
     说明：
     
     输出结果中每个元素出现的次数，应与元素在两个数组中出现次数的最小值一致。
     我们可以不考虑输出结果的顺序。
     进阶：
     
     如果给定的数组已经排好序呢？你将如何优化你的算法？
     如果 nums1 的大小比 nums2 小很多，哪种方法更优？
     如果 nums2 的元素存储在磁盘上，内存是有限的，并且你不能一次加载所有的元素到内存中，你该怎么办？
     */
    static func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        /**
         常规办法,第一个数组存储结果,第二三个可变数组存储原始数据.然后进行查找,如果存在,则在查找数组中删除.之后继续遍历,直到没有为止.
         */
        var array: [Int] = []
        var array1: [Int] = nums1
        var array2: [Int] = nums2
        
        if nums1.count > nums2.count{
            for item in array2 {
                if array1.contains(item) {
                    array.append(item)
                    let index = array1.firstIndex(of: item)!
                    array1.remove(at: index)
                }
            }
        }else{
            for item in array1 {
                if array2.contains(item) {
                    array.append(item)
                    let index = array2.firstIndex(of: item)!
                    array2.remove(at: index)
                }
            }
        }
        
        return array
    }
    
    static func intersectTwo(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        /**
         先排序,然后找相同元素的区间,直接根据区间个数进行添加,直到结束,常规办法
         */
        var array: [Int] = []
        let array1 = nums1.sorted()
        let array2 = nums2.sorted()
        
        if nums1.count > nums2.count {
            for item in array2 {
                if array1.contains(item) && !array.contains(item) {
                    let array1FirstIndex = array1.firstIndex(of: item)!
                    let array1LastIndex = array1.lastIndex(of: item)!
                    let array2FirstIndex = array2.firstIndex(of: item)!
                    let array2LastIndex = array2.lastIndex(of: item)!
                    
                    let intervalArray1 = array1LastIndex - array1FirstIndex
                    let intervalArray2 = array2LastIndex - array2FirstIndex
                    array.append(item)
                    
                    if intervalArray1 > intervalArray2  {
                        for _ in 0 ..< intervalArray2 {
                            array.append(item)
                        }
                    }else{
                        for _ in 0 ..< intervalArray1 {
                            array.append(item)
                        }
                    }
                }
            }
        }else{
            for item in array1 {
                if array2.contains(item) && !array.contains(item) {
                    let array1FirstIndex = array1.firstIndex(of: item)!
                    let array1LastIndex = array1.lastIndex(of: item)!
                    let array2FirstIndex = array2.firstIndex(of: item)!
                    let array2LastIndex = array2.lastIndex(of: item)!
                    
                    let intervalArray1 = array1LastIndex - array1FirstIndex
                    let intervalArray2 = array2LastIndex - array2FirstIndex
                    array.append(item)
                    
                    if intervalArray1 > intervalArray2  {
                        for _ in 0 ..< intervalArray2 {
                            array.append(item)
                        }
                    }else{
                        for _ in 0 ..< intervalArray1 {
                            array.append(item)
                        }
                    }
                }
            }
        }
        return array
    }
    
    static func intersectThree(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        /**
         遍历较短数组,然后存储该值和出现次数,再遍历长数组,存在该值则存储到返回数组,并哈希存储该值减一,
         时间16ms, 100% 内存13.7MB, 78.57%
         时间复杂度 M+N,空间复杂度Min(M,N)
         */
        var array: [Int] = []
        var map: [Int: Int] = [:]
        if nums1.count > nums2.count{
            for item in nums2 {
                if map[item] == nil {
                    map.updateValue(1, forKey: item)
                }else{
                    map.updateValue(map[item]! + 1, forKey: item)
                }
            }
            for item in nums1 {
                if map[item] != nil && map[item]! > 0 {
                    array.append(item)
                    map.updateValue(map[item]! - 1, forKey: item)
                }
            }
        }else{
            for item in nums1 {
                if map[item] == nil {
                    map.updateValue(1, forKey: item)
                }else{
                    map.updateValue(map[item]! + 1, forKey: item)
                }
            }
            for item in nums2 {
                if map[item] != nil && map[item]! > 0 {
                    array.append(item)
                    map.updateValue(map[item]! - 1, forKey: item)
                }
            }
        }
        
        return array
    }
    
    static func intersectFour(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        /**
         双指针方式
         时间32ms, 58.67% 内存13.9MB, 35.2%
         总时间复杂度 O(mlogm + n logn),排序时间是O(mlogm + n logn)遍历是O(M + N),空间复杂度Min(M,N)
         */
        var array: [Int] = []
        let array1 = nums1.sorted()
        let array2 = nums2.sorted()
        
        var i = 0
        var j = 0
        while i != nums1.count && j != nums2.count {
            if array1[i] == array2[j] {
                array.append(array1[i])
                i += 1
                j += 1
            }else if array1[i] > array2[j]{
                j += 1
            }else{
                i += 1
            }
        }
        return array
    }
    
    /**
     加一
     给定一个由 整数 组成的 非空 数组所表示的非负整数，在该数的基础上加一。
     
     最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
     
     你可以假设除了整数 0 之外，这个整数不会以零开头。
     
     */
    static func plusOne(_ digits: [Int]) -> [Int] {
        /**
         先定义变量是否进一,然后根据当前值判断是否继续进一,如果进一,则加0,不进一则直接加.对首位和末尾做判断处理
         */
        var array: [Int] = []
        var isAdd: Bool = (digits.last! == 9)
        
        for i in 0 ..< digits.count {
            let tmp = digits[digits.count - 1 - i]
            if isAdd {
                array.insert((tmp + 1) % 10, at: 0)
                isAdd = (tmp + 1) > 9
                if isAdd && i == digits.count - 1{
                    array.insert(1, at: 0)
                }
            }else{
                if i != 0 {
                    array.insert(tmp, at: 0)
                }else{
                    array.insert(tmp + 1, at: 0)
                }
            }
        }
        
        return array
        
    }
    
    static func plusOneTwo(_ digits: [Int]) -> [Int] {
        /**
         先定义可变数组,然后判断是否为9,如果是则该数据为0,继续循环,不是则加1返回.如果全部为9则在返回前加一.
         
         时间0ms, 100% 内存13.8MB, 20.2%
         
         */
        var array: [Int] = digits
        
        for i in 0 ..< digits.count {
            if array[digits.count - 1 - i] == 9 {
                array[digits.count - 1 - i] = 0
            }else{
                array[digits.count - 1 - i] += 1
                return array
            }
        }
        
        array.insert(1, at: 0)
        return array
        
    }
}
