//
//  FlowManager.h
//  StudySO
//
//  Created by ZhangYiCheng on 12-12-28.
//  Copyright (c) 2012年 ZhangYiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlowManager : NSObject

+ (FlowManager *)shareManager;

- (void)getAllFlows;
- (void)getMoreFlows;

@end
