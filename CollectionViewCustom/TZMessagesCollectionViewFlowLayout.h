//
//  TZMessagesCollectionViewFlowLayout.h
//  CollectionViewCustom
//
//  Created by Tony Zeng on 15/5/22.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TZMessagesCollectionView;

FOUNDATION_EXPORT const CGFloat TZMessagesCollectionViewCellLabelHeightDefault;

@interface TZMessagesCollectionViewFlowLayout : UICollectionViewFlowLayout

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincompatible-property-type"
@property (readonly, nonatomic) TZMessagesCollectionView *collectionView;
#pragma clang diagnostic pop

@property (assign, nonatomic) BOOL springinessEnabled;
@property (assign, nonatomic) NSUInteger springResistanceFactor;
@property (strong, nonatomic) UIFont *messageBubbleFont;
@property (readonly, nonatomic) CGFloat itemWidth;
@property (assign, nonatomic) NSUInteger cacheLimit;
@property (assign, nonatomic) UIEdgeInsets messageBubbleTextViewFrameInsets;
@property (assign, nonatomic) UIEdgeInsets messageBubbleTextViewTextContainerInsets;

- (CGSize)messageBubbleSizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end
