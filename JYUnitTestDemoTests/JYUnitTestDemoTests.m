//
//  JYUnitTestDemoTests.m
//  JYUnitTestDemoTests
//
//  Created by Jolie_Yang on 2017/2/4.
//  Copyright © 2017年 China Industrial Bank. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AFNetworking.h>
#import "ViewController.h"

@interface JYUnitTestDemoTests : XCTestCase
@property (nonatomic, strong) ViewController *vc;
@end

@implementation JYUnitTestDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.vc = [[ViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.vc = nil;
    
    [super tearDown];
}

// 1. 普通测试
- (void)testGetNum {
    int result = [self.vc getNum];
    XCTAssertEqual(result, 100, @"测试不通过");
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"testExample");
    int a = 0;
    XCTAssertTrue(a == 0, "断言a等于0，不等于则测试没通过");
}

// 2. 性能测试
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{// 可以查看执行时间，测试性能
        // Put the code you want to measure the time of here.
        for (int i = 0; i < 100; i++) {
            NSLog(@"dd");
        }
    }];
}

// 3.异步测试
- (void)testRequest {
    XCTestExpectation *requestExpectation = [self expectationWithDescription:@"send request"];
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    
    [mgr GET:@"https://baidu.com" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject:%@", responseObject);
        XCTAssertNotNil(responseObject, @"返回错误");
        [requestExpectation fulfill];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@", error);
        XCTAssertNil(error, @"请求出错");
        [requestExpectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:3.0 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Timeout Error:%@", error.description);
        }
    }];
}

@end
