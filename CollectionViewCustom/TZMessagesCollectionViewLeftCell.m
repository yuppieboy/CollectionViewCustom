//
//  TZMessagesCollectionViewLeftCell.m
//  CollectionViewCustom
//
//  Created by Tony Zeng on 15/7/8.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import "TZMessagesCollectionViewLeftCell.h"

@implementation TZMessagesCollectionViewLeftCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.textView.textAlignment = NSTextAlignmentLeft;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
