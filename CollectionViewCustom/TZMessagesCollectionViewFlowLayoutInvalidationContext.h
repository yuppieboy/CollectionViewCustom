//
//  TZMessagesCollectionViewFlowLayoutInvalidationContext.h
//  CollectionViewCustom
//
//  Created by Tony Zeng on 15/5/22.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TZMessagesCollectionViewFlowLayoutInvalidationContext : UICollectionViewFlowLayoutInvalidationContext

@property (nonatomic, assign) BOOL invalidateFlowLayoutMessagesCache;

+ (instancetype)context;

@end
