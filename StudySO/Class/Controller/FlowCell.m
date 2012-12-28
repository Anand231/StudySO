//
//  FlowCell.m
//  StudySO
//
//  Created by ZhangYiCheng on 12-12-28.
//  Copyright (c) 2012年 ZhangYiCheng. All rights reserved.
//

#import "FlowCell.h"

@implementation FlowCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"FlowCell initWithStyle");
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)heightForCell:(FlowItem *)item {
    return 0;
}

- (void)initCell {
    
}

- (void)setItem:(FlowItem *)item {
    _item = item;
    
}

@end
