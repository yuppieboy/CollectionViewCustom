//
//  TZMessageCollectionViewCell.m
//  CollectionViewCustom
//
//  Created by Tony Zeng on 15/5/22.
//  Copyright (c) 2015年 Tony. All rights reserved.
//

#import "TZMessagesCollectionViewCell.h"
#import "TZMessagesCollectionViewLayoutAttributes.h"

static CGFloat const textViewStrokeWidth = 1.0f;

@interface TZMessagesCollectionViewCell () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIView *smallBubbleView;
@property (weak, nonatomic) IBOutlet UIView *middleBubbleView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLabelHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewTrailingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewLeadingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewBottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewWidthConstraint;

@property (assign, nonatomic) UIEdgeInsets textViewFrameInsets;


- (IBAction)addButtonPressed:(UIButton *)sender;
- (IBAction)prefixButtonPressed:(UIButton *)sender;


@end

@implementation TZMessagesCollectionViewCell


+ (UINib *)nib {
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:[NSBundle bundleForClass:[self class]]];
}

+ (NSString *)cellReuseIdentifier {
    return NSStringFromClass([self class]);
}

#pragma mark - Initialization

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.topLabelHeightConstraint.constant = 0.0f;
    
    self.topLabel.textAlignment = NSTextAlignmentCenter;
    self.topLabel.font = [UIFont boldSystemFontOfSize:12.0f];
    self.topLabel.textColor = [UIColor lightGrayColor];
    self.topLabel.backgroundColor = [UIColor clearColor];
    
    self.textView.textColor = self.smallBubbleView.backgroundColor;
    self.textView.backgroundColor = [UIColor colorWithRed:250.0f / 255.0f green:255.0f / 255.0f blue:251.0f / 255.0f alpha:1.0f];
    self.textView.layer.cornerRadius = textViewRadius;
    self.textView.layer.borderWidth = textViewStrokeWidth;
    self.textView.layer.borderColor = self.smallBubbleView.backgroundColor.CGColor;
    self.textView.layer.masksToBounds = YES;
    self.textView.scrollEnabled = NO;
    self.textView.editable = NO;
    self.textView.selectable = NO;
    self.textView.userInteractionEnabled = YES;
    self.textView.showsHorizontalScrollIndicator = NO;
    self.textView.showsVerticalScrollIndicator = NO;
    self.textView.contentInset = UIEdgeInsetsZero;
    self.textView.scrollIndicatorInsets = UIEdgeInsetsZero;
    self.textView.contentOffset = CGPointZero;
    self.textView.textContainerInset = UIEdgeInsetsZero;
    self.textView.textContainer.lineFragmentPadding = 0;
    self.textView.textAlignment = NSTextAlignmentJustified;
    
    self.smallBubbleView.layer.cornerRadius = self.smallBubbleView.bounds.size.width / 2.0f;
    self.smallBubbleView.layer.masksToBounds = YES;
    
    self.middleBubbleView.layer.cornerRadius = self.middleBubbleView.bounds.size.width / 2.0f;
    self.middleBubbleView.layer.masksToBounds = YES;
    
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    tapped.delegate = self;
    [self.textView addGestureRecognizer:tapped];
}

- (void)dealloc {
    _topLabel = nil;
    _textView = nil;
    _smallBubbleView = nil;
    _middleBubbleView = nil;
}

#pragma mark - Collection view cell

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.topLabel.text = nil;
    
    self.textView.dataDetectorTypes = UIDataDetectorTypeNone;
    self.textView.text = nil;
    self.textView.attributedText = nil;
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    return layoutAttributes;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    
    TZMessagesCollectionViewLayoutAttributes *customAttributes = (TZMessagesCollectionViewLayoutAttributes *)layoutAttributes;
    
    if (self.textView.font != customAttributes.messageBubbleFont) {
        self.textView.font = customAttributes.messageBubbleFont;
    }
    
    if (!UIEdgeInsetsEqualToEdgeInsets(self.textView.textContainerInset, customAttributes.textViewTextContainerInsets)) {
        self.textView.textContainerInset = customAttributes.textViewTextContainerInsets;
    }
    
    self.textViewFrameInsets = customAttributes.textViewFrameInsets;
    
    [self updateConstraint:self.textViewWidthConstraint
                  withConstant:customAttributes.messageBubbleContainerViewWidth];
    
    [self updateConstraint:self.topLabelHeightConstraint withConstant:customAttributes.topLabelHeight];
}

- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    
    if ([[UIDevice currentDevice].systemVersion compare:@"8.0" options:NSNumericSearch] == NSOrderedAscending) {
        self.contentView.frame = bounds;
    }
}

#pragma - Setters

- (void)setTextViewFrameInsets:(UIEdgeInsets)textViewFrameInsets {
    if (UIEdgeInsetsEqualToEdgeInsets(textViewFrameInsets, self.textViewFrameInsets)) {
        return;
    }
    
    [self updateConstraint:self.textViewTopConstraint withConstant:textViewFrameInsets.top];
    [self updateConstraint:self.textViewBottomConstraint withConstant:textViewFrameInsets.bottom];
    [self updateConstraint:self.textViewLeadingConstraint withConstant:textViewFrameInsets.right];
    [self updateConstraint:self.textViewTrailingConstraint withConstant:textViewFrameInsets.left];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        self.textView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    }
    else {
        self.textView.backgroundColor = [UIColor colorWithRed:250.0f / 255.0f green:255.0f / 255.0f blue:251.0f / 255.0f alpha:1.0f];
    }
}

#pragma mark - Getters

- (UIEdgeInsets)textViewFrameInsets {
    return UIEdgeInsetsMake(self.textViewTopConstraint.constant,
                            self.textViewTrailingConstraint.constant,
                            self.textViewBottomConstraint.constant,
                            self.textViewLeadingConstraint.constant);
}

#pragma mark - Utilities

- (void)updateConstraint:(NSLayoutConstraint *)constraint withConstant:(CGFloat)constant {
    if (constraint.constant == constant) {
        return;
    }
    
    constraint.constant = constant;
}

- (IBAction)addButtonPressed:(UIButton *)sender {
    if (self.addButtonPressedBlock != nil) {
        self.addButtonPressedBlock(self);
    }
}

- (IBAction)prefixButtonPressed:(UIButton *)sender {
    if (self.prefixButtonPressedBlock != nil) {
        self.prefixButtonPressedBlock(self);
    }
}

- (void)tapped:(UITapGestureRecognizer *)sender {
    [self setSelected:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setSelected:NO];
        if (self.tappedBlock != nil) {
            self.tappedBlock(self);
        }
    });
}

@end
