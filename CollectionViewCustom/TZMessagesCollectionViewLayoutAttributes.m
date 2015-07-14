//
//  TZMessagesCollectionViewLayoutAttributes.m
//  CollectionViewCustom
//
//  Created by Tony Zeng on 15/5/22.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import "TZMessagesCollectionViewLayoutAttributes.h"

@interface TZMessagesCollectionViewLayoutAttributes ()

- (CGSize)correctedSizeFromSize:(CGSize)size;
- (CGFloat)correctedHeightForHeight:(CGFloat)height;

@end

@implementation TZMessagesCollectionViewLayoutAttributes

#pragma mark - Lifecycle

- (void)dealloc {
    _messageBubbleFont = nil;
}

#pragma mark - Setters

- (void)setMessageBubbleFont:(UIFont *)messageBubbleFont {
    NSParameterAssert(messageBubbleFont != nil);
    _messageBubbleFont = messageBubbleFont;
}

- (void)setTopLabelHeight:(CGFloat)topLabelHeight {
    NSParameterAssert(topLabelHeight >= 0.0f);
    _topLabelHeight = [self correctedHeightForHeight:topLabelHeight];
}

- (void)setMessageBubbleContainerViewWidth:(CGFloat)messageBubbleContainerViewWidth {
    NSParameterAssert(messageBubbleContainerViewWidth > 0.0f);
    _messageBubbleContainerViewWidth = ceilf(messageBubbleContainerViewWidth);
}

#pragma mark - Utilities

- (CGSize)correctedSizeFromSize:(CGSize)size {
    return CGSizeMake(ceilf(size.width), ceilf(size.height));
}

- (CGFloat)correctedHeightForHeight:(CGFloat)height {
    return ceilf(height);
}

#pragma mark - NSObject

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    
    if (self.representedElementCategory == UICollectionElementCategoryCell) {
        TZMessagesCollectionViewLayoutAttributes *layoutAttributes = (TZMessagesCollectionViewLayoutAttributes *)object;
        
        if (![layoutAttributes.messageBubbleFont isEqual:self.messageBubbleFont]
            ||!UIEdgeInsetsEqualToEdgeInsets(layoutAttributes.textViewFrameInsets, self.textViewFrameInsets)
            || !UIEdgeInsetsEqualToEdgeInsets(layoutAttributes.textViewTextContainerInsets, self.textViewTextContainerInsets)
            || (int)layoutAttributes.topLabelHeight != (int)self.topLabelHeight
            || (int)layoutAttributes.messageBubbleContainerViewWidth != (int)self.messageBubbleContainerViewWidth) {
            
            return NO;
        }
    }
    
    return [super isEqual:object];
}

- (NSUInteger)hash {
    return [self.indexPath hash];
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone {
    TZMessagesCollectionViewLayoutAttributes *copy = [super copyWithZone:zone];
    
    if (copy.representedElementCategory != UICollectionElementCategoryCell) {
        return copy;
    }
    
    copy.messageBubbleFont = self.messageBubbleFont;
    copy.messageBubbleContainerViewWidth = self.messageBubbleContainerViewWidth;
    copy.textViewFrameInsets = self.textViewFrameInsets;
    copy.textViewTextContainerInsets = self.textViewTextContainerInsets;
    copy.topLabelHeight = self.topLabelHeight;
    
    return copy;
}

@end
