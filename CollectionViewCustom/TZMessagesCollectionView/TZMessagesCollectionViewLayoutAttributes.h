//
//  TZMessagesCollectionViewLayoutAttributes.h
//  CollectionViewCustom
//
//  Created by Tony Zeng on 15/5/22.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TZMessagesCollectionViewLayoutAttributes : UICollectionViewLayoutAttributes <NSCopying>

@property (assign, nonatomic) UIEdgeInsets textViewTextContainerInsets;
@property (assign, nonatomic) UIEdgeInsets textViewFrameInsets;
@property (assign, nonatomic) CGFloat topLabelHeight;
@property (strong, nonatomic) UIFont *messageBubbleFont;
@property (assign, nonatomic) CGFloat messageBubbleContainerViewWidth;

@end
