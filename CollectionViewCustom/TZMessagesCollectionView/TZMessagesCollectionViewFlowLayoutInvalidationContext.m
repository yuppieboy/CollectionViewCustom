//
//  TZMessagesCollectionViewFlowLayoutInvalidationContext.m
//  CollectionViewCustom
//
//  Created by Tony Zeng on 15/5/22.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import "TZMessagesCollectionViewFlowLayoutInvalidationContext.h"

@interface TZMessagesCollectionViewFlowLayoutInvalidationContext ()

@end

@implementation TZMessagesCollectionViewFlowLayoutInvalidationContext

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        self.invalidateFlowLayoutDelegateMetrics = NO;
        self.invalidateFlowLayoutAttributes = NO;
        _invalidateFlowLayoutMessagesCache = NO;
    }
    return self;
}

+ (instancetype)context {
    TZMessagesCollectionViewFlowLayoutInvalidationContext *context = [[TZMessagesCollectionViewFlowLayoutInvalidationContext alloc] init];
    context.invalidateFlowLayoutDelegateMetrics = YES;
    context.invalidateFlowLayoutAttributes = YES;
    return context;
}

#pragma mark - NSObject

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: invalidateFlowLayoutDelegateMetrics=%@, invalidateFlowLayoutAttributes=%@, invalidateDataSourceCounts=%@, invalidateFlowLayoutMessagesCache=%@>",
            [self class], @(self.invalidateFlowLayoutDelegateMetrics), @(self.invalidateFlowLayoutAttributes), @(self.invalidateDataSourceCounts), @(self.invalidateFlowLayoutMessagesCache)];
}

@end
