//
//  TZMessagesCollectionViewDataSource.h
//  CollectionViewCustom
//
//  Created by Tony Zeng on 15/5/22.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TZMessagesCollectionView;

@protocol TZMessagesCollectionViewDataSource <UICollectionViewDataSource>

@required

- (NSString *)collectionView:(TZMessagesCollectionView *)collectionView messageDataForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional

- (NSAttributedString *)collectionView:(TZMessagesCollectionView *)collectionView attributedTextForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath;

@end
