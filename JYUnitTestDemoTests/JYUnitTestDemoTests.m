//
//  JYUnitTestDemoTests.m
//  JYUnitTestDemoTests
//
//  Created by Jolie_Yang on 2017/2/4.
//  Copyright © 2017年 China Industrial Bank. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AFNetworking.h>

@interface JYUnitTestDemoTests : XCTestCase

@end

@implementation JYUnitTestDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"testExample");
    int a = 0;
    XCTAssertTrue(a == 0, "断言a等于0，不等于则测试没通过");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testRequest {
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    [mgr GET:@"https://baidu.com" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject:%@", responseObject);
        XCTAssertNotNil(responseObject, @"返回错误");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@", error);
        XCTAssertNil(error, @"请求出错");
    }];
}

@end
