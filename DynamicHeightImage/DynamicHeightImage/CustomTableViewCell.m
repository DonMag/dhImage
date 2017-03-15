//
//  CustomTableViewCell.m
//  DynamicHeightImage
//
//  Created by Webwerks1 on 10/04/15.
//  Copyright (c) 2015. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell
@synthesize nImageView;


- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
//    self.nImageView.layer.mask = nil;
//    self.nImageView.layer.masksToBounds = NO;

	self.leftMaskPath = [UIBezierPath
				bezierPathWithRoundedRect:self.bubbleView.bounds
				byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)
				cornerRadii:CGSizeMake(20, 20)];
	
	self.rightMaskPath = [UIBezierPath
				bezierPathWithRoundedRect:self.bubbleView.bounds
				byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight)
				cornerRadii:CGSizeMake(20, 20)];

	self.maskLayer = [CAShapeLayer layer];
	
}

//- (void) layoutSubviews {
//	
//	self.maskLayer.frame = self.bubbleView.bounds;
//	self.bubbleView.layer.mask = self.maskLayer;
//
//}
//- (void) layoutSublayersOfLayer:(CALayer *)layer {
//	[super layoutSublayersOfLayer:layer];
//	self.maskLayer.frame = self.bubbleView.bounds;
//	self.bubbleView.layer.mask = self.maskLayer;
//}

//- (void)drawRect:(CGRect)rect
//{
////	[super drawRect:rect];
//	
//
//	CAShapeLayer *maskLayer = [CAShapeLayer layer];
//	maskLayer.frame = self.bubbleView.bounds;
//	maskLayer.path = self.leftMaskPath.CGPath;
//	self.bubbleView.layer.mask = maskLayer;
//	
//}

- (void)setupCellWithImageUrl:(NSString  *)imageUrl andRow:(NSInteger )rowIndex{
	
	if(rowIndex % 2 == 0) {
		self.bubbleView.backgroundColor = [UIColor orangeColor];
		
		self.maskLayer.path = self.leftMaskPath.CGPath;
		
	} else {
		self.bubbleView.backgroundColor = [UIColor greenColor];
		
		self.maskLayer.path = self.rightMaskPath.CGPath;
		
	}

//	self.bubbleView.layer.mask = self.maskLayer;

//	self.bubbleView.layer.mask = maskLayer;

	NSLog(@"r %d f: %@ b: %@", rowIndex, [NSValue valueWithCGRect:self.bubbleView.frame], [NSValue valueWithCGRect:self.bubbleView.bounds]);
	
	
    [self.nImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        id view = [self superview];
        
        while (view && [view isKindOfClass:[UITableView class]] == NO) {
            view = [view superview];
        }
        
        UITableView *tableView = (UITableView *)view;
        
        NSIndexPath *currentIndexPath = [tableView indexPathForCell:self];
        if(currentIndexPath) {
            NSBlockOperation *reloadCellOperation = [NSBlockOperation blockOperationWithBlock:^{
                [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:currentIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            }];
            [reloadCellOperation performSelectorOnMainThread:@selector(start) withObject:nil waitUntilDone:NO];
        }

    }];
}

- (void)configureBubbleInRow:(NSInteger)row {
    if(row % 2 == 0) {
        [self configureBottomBubble];
    } else {
        [self configureTopBubble];
    }
}

- (void)configureBottomBubble {
    UIBezierPath *maskPath = [UIBezierPath
                              bezierPathWithRoundedRect:self.bubbleView.bounds
                              byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)
                              cornerRadii:CGSizeMake(20, 20)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    
    maskLayer.frame = self.bubbleView.bounds;
    maskLayer.path = maskPath.CGPath;
    
    self.bubbleView.layer.mask = maskLayer;
    self.bubbleView.backgroundColor = [UIColor orangeColor];
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
}

- (void)configureTopBubble {
    UIBezierPath *maskPath = [UIBezierPath
                              bezierPathWithRoundedRect:self.bubbleView.bounds
                              byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight)
                              cornerRadii:CGSizeMake(20, 20)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    
    maskLayer.frame = self.bubbleView.bounds;
    maskLayer.path = maskPath.CGPath;
    
    self.bubbleView.layer.mask = maskLayer;

    self.bubbleView.backgroundColor = [UIColor greenColor];
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
