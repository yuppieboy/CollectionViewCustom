//
//  TZMessagesCollectionViewDelegateFlowLayout.h
//  CollectionViewCustom
//
//  Created by Tony Zeng on 15/5/22.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TZMessagesCollectionView;
@class TZMessagesCollectionViewFlowLayout;
@class TZMessagesCollectionViewCell;


@protocol TZMessagesCollectionViewDelegateFlowLayout <UICollectionViewDelegateFlowLayout>

@optional

- (CGFloat)collectionView:(TZMessagesCollectionView *)collectionView
                   layout:(TZMessagesCollectionViewFlowLayout *)collectionViewLayout heightForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath;

@end
