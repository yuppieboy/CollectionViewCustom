//
//  TZMessagesCollectionView.h
//  CollectionViewCustom
//
//  Created by Tony Zeng on 15/5/22.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TZMessagesCollectionViewFlowLayout.h"
#import "TZMessagesCollectionViewDelegateFlowLayout.h"
#import "TZMessagesCollectionViewDataSource.h"
#import "TZMessagesCollectionViewLeftCell.h"
#import "TZMessagesCollectionViewRightCell.h"

@interface TZMessagesCollectionView : UICollectionView

@property (weak, nonatomic) id<TZMessagesCollectionViewDataSource> dataSource;

@property (weak, nonatomic) id<TZMessagesCollectionViewDelegateFlowLayout> delegate;

@property (strong, nonatomic) TZMessagesCollectionViewFlowLayout *collectionViewLayout;

@end
