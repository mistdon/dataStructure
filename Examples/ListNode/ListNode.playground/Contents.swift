//: Playground - noun: a place where people can play

import UIKit

//用Swift声明一个链表
class ListNode{
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class List {
    var head: ListNode?
    var tail: ListNode?
    // 尾插
    func appendToTail(_ val: Int) {
        if tail == nil{
            tail = ListNode(val)
            head = tail
        }else{
            tail!.next = ListNode(val)
            tail = tail!.next
        }
    }
    // 头插
    func appendToHead(_ val: Int) {
        if head == nil {
            head = ListNode(val)
            tail = head
        }else{
            let temp = ListNode(val)
            temp.next = head
            head = temp
        }
    }
    
}

/*  检查链表中是否有环
    用两个指针同时访问链表，其中一个的速度是另一个的两倍，如果他们变成相等的了，就证明这个链表是有环的
 */
func hasCycle(_ head: ListNode?) -> Bool{
    var slow = head
    var fast = head
    while fast != nil && fast!.next != nil {
        slow = slow!.next
        fast = fast!.next!.next
        if slow === fast{
            return true
        }
    }
    return false
}
/*
  反转链表
  传入一个头节点，返回一个翻转后的头节点
 */
func reverseList(_ head: ListNode) -> ListNode{
    var last: ListNode?
    var next: ListNode?
    var nodeH: ListNode? = head
    while nodeH != nil {
        next = nodeH?.next
        nodeH?.next = last
        last = nodeH
        nodeH = next
    }
    return last!
}

// test code
let alist = ListNode(1)
let blist = ListNode(2)
let clist = ListNode(3)
let dlist = ListNode(4)

alist.next = blist
blist.next = clist
clist.next = dlist

let res = hasCycle(alist)
let res2 = reverseList(alist)

let res3 = (res2.val == 4)
let res4 = (res2.next?.next?.val == 2)

