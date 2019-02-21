//
//  SinglyLinkedList.h
//  algo
//
//  Created by Wenru Dong on 2018/10/6.
//  Copyright © 2018年 Wenru Dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListNode.h"

@interface SinglyLinkedList : NSObject 

@property ListNode* head;

/**
 获取 value 等于传入值的 node

 @param value 传入的值
 @return 与传入值相等的第一个 ListNode
 */
- (nullable ListNode*)getNodeWithValue:(int)value;

/**
 获取链表的第 n 个节点

 @param index 节点的偏移量
 @return ListNode
 */
- (ListNode*)nodeAtIndex:(NSUInteger)index;

/**
 根据传入的值插入一个节点

 @param value 节点的 value
 */
- (void)insertNodeWithValue:(int)value;

/**
 插入一个节点

 @param node 要插入的节点
 */
- (void)insertNode:(nonnull ListNode*)node;

/**
 在某节点之后插入一个节点

 @param value 要插入的节点的值
 @param node 在该节点之后插入一个新节点
 */
+ (void)insertNodeWithValue:(int)value afterNode:(nonnull ListNode*)node;


/**
 在某节点之后插入一个节点

 @param aNode 要插入的节点
 @param node 在该节点之后插入一个新节点
 */
+ (void)insertNode:(nonnull ListNode*)aNode afterNode:(nonnull ListNode*)node;

/**
 在某节点之前插入一个节点

 @param value 要插入的节点的值
 @param node 在该节点之前插入一个新节点
 */
- (void)insertNodeWithValue:(int)value beforeNode:(nonnull ListNode*)node;

/**
 在某节点之前插入一个节点

 @param aNode 要插入的节点
 @param node 在该节点之前插入一个新节点
 */
- (void)insertNode:(nonnull ListNode*)aNode beforeNode:(nonnull ListNode*)node;

/**
 删除节点

 @param node 要删除的节点
 */
- (void)deleteNode:(nonnull ListNode*)node;

/**
 删除 value 为特定值的节点

 @param value 要删除的节点的值
 */
- (void)deleteNodesWithValue:(int)value;

/**
 判断是否包含节点

 @param node 节点
 @return YES if contains
 */
- (BOOL)containsNode:(ListNode *)node;

/**
 判断是否回文链表

 @return YES 如果是回文链表
 */
- (BOOL)palindrome;


/**
 反转链表

 @param head 要反转的链表
 @return 反转后的链表
 */
+ (ListNode *)inverseLinkList:(ListNode *)head;
@end
