//
//  SinglyLinkedListTests.m
//  SinglyLinkedListTests
//
//  Created by Wenru Dong on 2018/10/6.
//  Copyright © 2018年 Wenru Dong. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ListNode.h"
#import "SinglyLinkedList.h"

@interface SinglyLinkedListTests : XCTestCase

@end

@implementation SinglyLinkedListTests
{
    SinglyLinkedList* _list;
    NSArray* _nodes;
    NSArray* _stringNodes;
    SinglyLinkedList* _stringList;
}
- (void)setUp {
    [super setUp];
    ListNode* node1 = [ListNode nodeWithValue:1];
    ListNode* node2 = [ListNode nodeWithValue:2];
    ListNode* node3 = [ListNode nodeWithValue:3];
    ListNode* node4 = [ListNode nodeWithValue:4];
    ListNode* node5 = [ListNode nodeWithValue:5];
    ListNode* node6 = [ListNode nodeWithValue:6];
    node1.next = node2;
    node2.next = node3;
    node3.next = node4;
    node4.next = node5;
    node5.next = node6;
    
    _list = [[SinglyLinkedList alloc] init];
    _list.head = node1;
    _nodes = [NSArray arrayWithObjects:node1, node2, node3, node4, node5, node6, nil];
    
    
    ListNode* char1 = [ListNode nodeWithCharacter:'a'];
    ListNode* char2 = [ListNode nodeWithCharacter:'a'];
    ListNode* char3 = [ListNode nodeWithCharacter:'b'];
    ListNode* char4 = [ListNode nodeWithCharacter:'b'];
    ListNode* char5 = [ListNode nodeWithCharacter:'a'];
    ListNode* char6 = [ListNode nodeWithCharacter:'a'];

    char1.next = char2;
    char2.next = char3;
    char3.next = char4;
    char4.next = char5;
    char5.next = char6;
    _stringList = [[SinglyLinkedList alloc] init];
    _stringList.head = char1;
    _stringNodes = [NSArray arrayWithObjects:char1, char2, char3, char4, char5, char6,nil];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNodeWithValue {
    XCTAssertEqualObjects([_list getNodeWithValue:1], _list.head);
    XCTAssertNil([_list getNodeWithValue:10]);
}

- (void)testNodeAtIndex {
    XCTAssertEqualObjects([_list nodeAtIndex:4], _nodes[4]);
    XCTAssertNil([_list nodeAtIndex:10]);
}

- (void)testInsertNodeWithValue {
    [_list insertNodeWithValue:9];
    XCTAssertEqual(_list.head.value, 9);
    XCTAssertEqual(_list.head.next.value, 1);
}

- (void)testInsertNode {
    ListNode* aNode = [ListNode nodeWithValue:7];
    [_list insertNode:aNode];
    XCTAssertEqualObjects(_list.head, aNode);
}

- (void)testInsertNodeWithValueAfterNode {
    [SinglyLinkedList insertNodeWithValue:12 afterNode:_nodes[3]];
    XCTAssertEqual([[_list nodeAtIndex:4] value], 12);
}

- (void)testInsertNodeAfterNode {
    ListNode* aNode = [ListNode nodeWithValue:28];
    [SinglyLinkedList insertNode:aNode afterNode:_nodes[5]];
    ListNode* prevNode = (ListNode *)_nodes[5];
    XCTAssertEqualObjects(aNode, prevNode.next);
}

- (void)testContainsNode{
    ListNode* aNode = [ListNode nodeWithValue:28];
    XCTAssertTrue(![_list containsNode:aNode]);
    XCTAssertTrue([_list containsNode:_nodes[1]]);

    [_list insertNode:aNode];
    XCTAssertTrue([_list containsNode:aNode]);
    
    XCTAssertTrue(![[SinglyLinkedList new] containsNode:aNode]);
    
    aNode = nil;
    XCTAssertTrue(![_list containsNode:aNode]);
}

- (void)testInsertNodeBeforeNode {
    ListNode* aNode = [ListNode nodeWithValue:27];
    ListNode* prevNode = (ListNode *)_nodes[3];
    [_list insertNode:aNode beforeNode:_nodes[4]];
    XCTAssertEqualObjects(aNode, prevNode.next);
    
    ListNode* anotherNode = [ListNode nodeWithValue:27];
    ListNode* outsideNode = [ListNode nodeWithValue:100];
    [_list insertNode:anotherNode beforeNode:outsideNode];
    //TODO: 插入不在list的node之前的 case，应该插入失败
    XCTAssertTrue(![_list containsNode:anotherNode]);
    
}


- (void)testInsertNodeBeforeUnconnectedNode {
    ListNode* aNode = [ListNode nodeWithValue:27];
    ListNode* floatingNode = [ListNode nodeWithValue:36];
    [_list insertNode:aNode beforeNode:floatingNode];
    for (NSUInteger i = 0; i < 6; i++) {
        XCTAssertEqualObjects([_list nodeAtIndex:i], _nodes[i]);
    }
}

- (void)testDeleteNode {
    [_list deleteNode:_nodes[0]];
    XCTAssertEqual(_list.head.value, 2);
    [_list deleteNode:_nodes[5]];
    ListNode* lastNode = (ListNode *)_nodes[4];
    XCTAssertNil(lastNode.next);
}

- (void)testDeleteNodesWithValue {
    ListNode* firstNode = [ListNode nodeWithValue:1];
    ListNode* secondNode = [ListNode nodeWithValue:1];
    [_list insertNode:firstNode];
    [_list insertNode:secondNode];
    [_list deleteNodesWithValue:1];
    for (NSUInteger i = 1; i < 6; i++) {
        XCTAssertEqualObjects([_list nodeAtIndex:i-1], _nodes[i]);
    }
}

- (void)testDebugDescription {
    XCTAssertEqualObjects(_list.debugDescription, @"1->2->3->4->5->6");
}

- (void)testInverseLinkList {
    ListNode *node = [SinglyLinkedList inverseLinkList:_list.head];
    SinglyLinkedList *inversed = [[SinglyLinkedList alloc]init];
    inversed.head = node; XCTAssertEqualObjects(inversed.debugDescription, @"6->5->4->3->2->1");

}

- (void)testPalindrome {
    XCTAssertTrue(![_list palindrome]);
    XCTAssertTrue([_stringList palindrome]);
//    XCTAssertTrue([_list palindrome]);
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
