//
//  TZMessageCollectionViewCell.h
//  CollectionViewCustom
//
//  Created by Tony Zeng on 15/5/22.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

static CGFloat const textViewRadius = 20.0f;

@interface TZMessagesCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic, readonly) UITextView *textView;
@property (weak, nonatomic, readonly) UILabel *topLabel;
@property (copy, nonatomic) void (^tappedBlock)(TZMessagesCollectionViewCell *cell);
@property (copy, nonatomic) void (^addButtonPressedBlock)(TZMessagesCollectionViewCell *cell);
@property (copy, nonatomic) void (^prefixButtonPressedBlock)(TZMessagesCollectionViewCell *cell);

#pragma mark - Class methods
+ (UINib *)nib;
+ (NSString *)cellReuseIdentifier;

@end
