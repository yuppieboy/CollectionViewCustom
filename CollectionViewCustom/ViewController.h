//
//  ViewController.h
//  CollectionViewCustom
//
//  Created by Tony Zeng on 15/5/22.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TZMessagesCollectionView.h"
#import "TZMessagesCollectionViewFlowLayout.h"

@interface ViewController : UIViewController <TZMessagesCollectionViewDataSource, TZMessagesCollectionViewDelegateFlowLayout>


@end

