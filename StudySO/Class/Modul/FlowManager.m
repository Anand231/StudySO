//
//  FlowManager.m
//  StudySO
//
//  Created by ZhangYiCheng on 12-12-28.
//  Copyright (c) 2012年 ZhangYiCheng. All rights reserved.
//

#import "FlowManager.h"
#import "FlowItem.h"

static FlowManager *manager = nil;

@implementation FlowManager

+ (FlowManager *)shareManager {
    if (!manager) {
        manager = [[FlowManager alloc] init];
    }
    return manager;
}

- (void)getAllFlows {
    NSArray *output = @[];
    
    output = @[@"one", @"two", @"three", @"two", @"three", @"two", @"three", @"two", @"three", @"two", @"three"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_FLOW_SUCCESS object:nil userInfo:@{@"output" : output}];
}

- (void)getMoreFlows {
    NSArray *output = @[];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_MOREFLOW_SUCCESS object:nil userInfo:@{@"output" : output}];
}

@end
