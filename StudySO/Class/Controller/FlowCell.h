//
//  FlowCell.h
//  StudySO
//
//  Created by ZhangYiCheng on 12-12-28.
//  Copyright (c) 2012年 ZhangYiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlowItem.h"

@interface FlowCell : UITableViewCell

@property (strong, nonatomic) FlowItem *item;

+ (CGFloat)heightForCell:(FlowItem *)item;
- (void)initCell;

@end
