//
//  ViewController.m
//  CollectionViewCustom
//
//  Created by Tony Zeng on 15/5/22.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import "ViewController.h"
#import "TZMessagesCollectionViewFlowLayoutInvalidationContext.h"
#import "TZMessagesCollectionViewLeftCell.h"
#import "TZMessagesCollectionViewRightCell.h"
#import "JSQMessagesTimestampFormatter.h"

@interface ViewController () {
    NSArray *_messageArray;
}

@property (weak, nonatomic) IBOutlet TZMessagesCollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.collectionViewLayout.springinessEnabled = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.view layoutIfNeeded];
    
    _messageArray = @[@"水电费", @"水电费的说法都是", @"水", @"水电费第三方第三方", @"水电费第三方第三方第三方，是的范德萨发生，是的范德萨发，第三方斯蒂芬分，我的好朋友", @"水电费第三方第三方，的说法都是", @"水电费的说法都是，第三方第三方", @"水电费", @"水电费", @"水电费", @"水电费", @"水电费的说法都是", @"水", @"水电费第三方第三方", @"水电费第三方第三方第三方，是的范德萨发生，是的范德萨发，第三方斯蒂芬分，我的好朋友", @"水电费第三方第三方，的说法都是", @"水电费的说法都是，第三方第三方", @"水电费", @"水电费", @"水电费", @"水电费", @"水电费的说法都是", @"水", @"水电费第三方第三方", @"水电费第三方第三方第三方，是的范德萨发生，是的范德萨发，第三方斯蒂芬分，我的好朋友", @"水电费第三方第三方，的说法都是", @"水电费的说法都是，第三方第三方", @"水电费", @"水电费", @"水电费", @"水电费", @"水电费的说法都是", @"水", @"水电费第三方第三方", @"水电费第三方第三方第三方，是的范德萨发生，是的范德萨发，第三方斯蒂芬分，我的好朋友", @"水电费第三方第三方，的说法都是", @"水电费的说法都是，第三方第三方", @"水电费", @"水电费", @"水电费", @"水电费", @"水电费的说法都是", @"水", @"水电费第三方第三方", @"水电费第三方第三方第三方，是的范德萨发生，是的范德萨发，第三方斯蒂芬分，我的好朋友", @"水电费第三方第三方，的说法都是", @"水电费的说法都是，第三方第三方", @"水电费", @"水电费", @"水电费", @"水电费", @"水电费的说法都是", @"水", @"水电费第三方第三方", @"水电费第三方第三方第三方，是的范德萨发生，是的范德萨发，第三方斯蒂芬分，我的好朋友", @"水电费第三方第三方，的说法都是", @"水电费的说法都是，第三方第三方", @"水电费", @"水电费", @"水电费", @"水电费", @"水电费的说法都是", @"水", @"水电费第三方第三方", @"水电费第三方第三方第三方，是的范德萨发生，是的范德萨发，第三方斯蒂芬分，我的好朋友", @"水电费第三方第三方，的说法都是", @"水电费的说法都是，第三方第三方", @"水电费", @"水电费", @"水电费", @"水电费", @"水电费的说法都是", @"水", @"水电费第三方第三方", @"水电费第三方第三方第三方，是的范德萨发生，是的范德萨发，第三方斯蒂芬分，我的好朋友", @"水电费第三方第三方，的说法都是", @"水电费的说法都是，第三方第三方", @"水电费", @"水电费", @"水电费", @"水电费", @"水电费的说法都是", @"水", @"水电费第三方第三方", @"水电费第三方第三方第三方，是的范德萨发生，是的范德萨发，第三方斯蒂芬分，我的好朋友", @"水电费第三方第三方，的说法都是", @"水电费的说法都是，第三方第三方", @"水电费", @"水电费", @"水电费"];
    [self.collectionView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.collectionView.collectionViewLayout.springinessEnabled = NO;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)collectionView:(TZMessagesCollectionView *)collectionView messageDataForItemAtIndexPath:(NSIndexPath *)indexPath {
    return _messageArray[indexPath.row];
}

- (NSAttributedString *)collectionView:(TZMessagesCollectionView *)collectionView attributedTextForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath {
    return [[JSQMessagesTimestampFormatter sharedFormatter] attributedTimestampForDate:[NSDate date]];
}

#pragma mark - Collection view data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _messageArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(TZMessagesCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row % 2 == 0) {
        TZMessagesCollectionViewRightCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[TZMessagesCollectionViewRightCell cellReuseIdentifier] forIndexPath:indexPath];
        
        cell.textView.text = _messageArray[indexPath.row];
        
        if ([[UIDevice currentDevice].systemVersion compare:@"8.0" options:NSNumericSearch] == NSOrderedAscending) {
            //  workaround for iOS 7 textView data detectors bug
            cell.textView.text = nil;
            cell.textView.attributedText = [[NSAttributedString alloc] initWithString:_messageArray[indexPath.row]
                                                                           attributes:@{ NSFontAttributeName : cell.textView.font}];
        }
        
        cell.topLabel.attributedText = [collectionView.dataSource collectionView:collectionView attributedTextForCellTopLabelAtIndexPath:indexPath];
        
        cell.textView.dataDetectorTypes = UIDataDetectorTypeAll;
        
        cell.backgroundColor = [UIColor clearColor];
        cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
        cell.layer.shouldRasterize = YES;
        
        return cell;
    }
    else {
        TZMessagesCollectionViewLeftCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[TZMessagesCollectionViewLeftCell cellReuseIdentifier] forIndexPath:indexPath];
        
        cell.textView.text = _messageArray[indexPath.row];
        
        if ([[UIDevice currentDevice].systemVersion compare:@"8.0" options:NSNumericSearch] == NSOrderedAscending) {
            //  workaround for iOS 7 textView data detectors bug
            cell.textView.text = nil;
            cell.textView.attributedText = [[NSAttributedString alloc] initWithString:_messageArray[indexPath.row]
                                                                           attributes:@{ NSFontAttributeName : cell.textView.font}];
        }
        
        cell.topLabel.attributedText = [collectionView.dataSource collectionView:collectionView attributedTextForCellTopLabelAtIndexPath:indexPath];
        
        cell.textView.dataDetectorTypes = UIDataDetectorTypeAll;
        
        cell.backgroundColor = [UIColor clearColor];
        cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
        cell.layer.shouldRasterize = YES;
        
        return cell;
    }
}

#pragma mark - Collection view delegate flow layout

- (CGSize)collectionView:(TZMessagesCollectionView *)collectionView
                  layout:(TZMessagesCollectionViewFlowLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [collectionViewLayout sizeForItemAtIndexPath:indexPath];
}

- (CGFloat)collectionView:(TZMessagesCollectionView *)collectionView
                   layout:(TZMessagesCollectionViewFlowLayout *)collectionViewLayout heightForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath {
    return 20.0f;
}

@end
