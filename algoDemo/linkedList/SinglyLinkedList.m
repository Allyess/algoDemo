//
//  SinglyLinkedList.m
//  algo
//
//  Created by Wenru Dong on 2018/10/6.
//  Copyright © 2018年 Wenru Dong. All rights reserved.
//

#import "SinglyLinkedList.h"

@implementation SinglyLinkedList

- (ListNode*)getNodeWithValue:(int)value {
    ListNode* current = _head;
    while (current && current.value != value) {
        // 当 value 不在链表中时 current.next == nil
        current = current.next;
    }
    return current;
}

- (ListNode*)nodeAtIndex:(NSUInteger)index {
    ListNode* current = _head;
    NSUInteger position = 0;
    while (current && position != index) {
        current = current.next;
        position++;
    }
    return current;
}

- (void)insertNodeWithValue:(int)value {
    ListNode* aNode = [ListNode nodeWithValue:value];
    [self insertNode:aNode];
}

- (void)insertNode:(nonnull ListNode *)node {
    node.next = _head;
    _head = node;
}

+ (void)insertNodeWithValue:(int)value afterNode:(nonnull ListNode *)node {
    ListNode* aNode = [ListNode nodeWithValue:value];
    [SinglyLinkedList insertNode:aNode afterNode:node];
}

+ (void)insertNode:(nonnull ListNode *)aNode afterNode:(nonnull ListNode *)node {
    aNode.next = node.next;
    node.next = aNode;
}

- (void)insertNodeWithValue:(int)value beforeNode:(nonnull ListNode *)node {
    ListNode* aNode = [ListNode nodeWithValue:value];
    [self insertNode:aNode beforeNode:node];
}

- (void)insertNode:(nonnull ListNode *)aNode beforeNode:(nonnull ListNode *)node {
    ListNode* fakeHead = [ListNode nodeWithValue:0];
    fakeHead.next = _head;
    ListNode* current = fakeHead;
    while (current.next && current.next != node) {
        current = current.next;
    }
    if (current.next == nil) {
        return;
    }
    aNode.next = node;
    current.next = aNode;
}

- (void)deleteNode:(nonnull ListNode *)node {
    if (node.next) {
        node.value = node.next.value;
        node.next = node.next.next;
        return;
    }
    if (_head == nil) return;
    ListNode* current = _head;
    while (current.next && current.next != node) {
        current = current.next;
    }
    current.next = nil;
}

-(BOOL)containsNode:(ListNode *)node {
    if (!node) {
        return NO;
    }
    ListNode* current = _head;
    while (current) {
        if (current == node) {
            return YES;
        }
        current = current.next;
    }
    return NO;
}

- (void)deleteNodesWithValue:(int)value {
    ListNode* fakeHead = [ListNode nodeWithValue:value+1];
    fakeHead.next = _head;
    ListNode* prev = fakeHead;
    ListNode* current = _head;
    while (current) {
        if (current.value != value) {
            prev.next = current;
            prev = prev.next;
        }
        current = current.next;
    }
    if (prev.next) {
        prev.next = nil;
    }
    _head = fakeHead.next;
}


- (NSString*)debugDescription {
    NSMutableString* info = [[NSMutableString alloc] init];
    ListNode* current = _head;
    if (current) {
        [info appendString:current.debugDescription];
    }
    current = current.next;
    while (current) {
        [info appendString:@"->"];
        [info appendString:current.debugDescription];
        current = current.next;
    }
    return [NSString stringWithString:info];
}


- (BOOL)palindrome{
    if (!_head) {
        return NO;
    }
    
    // 只有一个元素
    if (!_head.next) {
        return YES;
    }
    
    // 查找中间节点
    ListNode *fast = _head;
    ListNode *slow = _head;
    
    while (fast.next && fast.next.next) {
        slow = slow.next;
        fast = fast.next.next;
    }
    
    NSLog(@"中间节点的值%d",slow.value);
    
    ListNode *left;
    ListNode *right;
    // 如果 fast.next 不存在，链表个数为奇数，slow 是链表的中点
    if (!fast.next) {
        right = slow.next;
        left = [self inverseLinkListToNode:slow].next;
    } else {
        right = slow.next;
        left = [self inverseLinkListToNode:slow];
    }
    return [self isEquelLinkedListA:left LinkedListB:right] ;
}

- (BOOL)isEquelLinkedListA:(ListNode *)linkedListA LinkedListB:(ListNode *)linkedListB {
    
    while (linkedListA && linkedListB) {
        if (linkedListA.value == linkedListB.value) {
            linkedListA = linkedListA.next;
            linkedListB = linkedListB.next;
        }else{
            break;
        }
    }
    
    if (!linkedListA && !linkedListB) {
        return YES;
    }else{
        return NO;
    }
}

- (ListNode *)inverseLinkListToNode:(ListNode *)node {
    ListNode *cur = _head;
    ListNode *pre;
    
    while (cur) {
        ListNode *next = cur.next;
        cur.next = pre;
        pre = cur;
        cur = next;
        if (pre == node) {
            break;
        }
    }
    return pre;
}

+ (ListNode *)inverseLinkList:(ListNode *)head {
    ListNode *cur = head;
    ListNode *pre;
    
    while (cur) {
        ListNode *next = cur.next;
        cur.next = pre;
        pre = cur;
        cur = next;
    }
    return pre;
}


@end
  
