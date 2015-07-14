//
//  TZMessagesCollectionView.m
//  CollectionViewCustom
//
//  Created by Tony Zeng on 15/5/22.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import "TZMessagesCollectionView.h"

@implementation TZMessagesCollectionView

@dynamic dataSource;
@dynamic delegate;
@dynamic collectionViewLayout;

#pragma mark - Initialization

- (void)configureCollectionView {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.backgroundColor = [UIColor clearColor];
    self.keyboardDismissMode = UIScrollViewKeyboardDismissModeNone;
    self.alwaysBounceVertical = YES;
    self.bounces = YES;
    
    [self registerNib:[TZMessagesCollectionViewLeftCell nib] forCellWithReuseIdentifier:[TZMessagesCollectionViewLeftCell cellReuseIdentifier]];
    [self registerNib:[TZMessagesCollectionViewRightCell nib] forCellWithReuseIdentifier:[TZMessagesCollectionViewRightCell cellReuseIdentifier]];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self configureCollectionView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configureCollectionView];
}

@end
