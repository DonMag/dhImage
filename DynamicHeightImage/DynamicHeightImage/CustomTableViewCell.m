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

}

- (void)setupCellWithImageUrl:(NSString  *)imageUrl andRow:(NSInteger )rowIndex{
	
	// alternate rows
	//		- Orange background with rounded corners on the left
	//		- Green  background with rounded corners on the right
	
	// self.bubbleView is now an "RView" (UIView subclass)
 
	if(rowIndex % 2 == 0) {
		
		self.bubbleView.backgroundColor = [UIColor orangeColor];
		
		self.bubbleView.leftOrRight = MASK_LEFT;
		
	} else {
		
		self.bubbleView.backgroundColor = [UIColor greenColor];
		
		self.bubbleView.leftOrRight = MASK_RIGHT;
		
	}
	
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

// not needed anymore

//- (void)configureBubbleInRow:(NSInteger)row {
//    if(row % 2 == 0) {
//        [self configureBottomBubble];
//    } else {
//        [self configureTopBubble];
//    }
//}
//
//- (void)configureBottomBubble {
//    UIBezierPath *maskPath = [UIBezierPath
//                              bezierPathWithRoundedRect:self.bubbleView.bounds
//                              byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)
//                              cornerRadii:CGSizeMake(20, 20)];
//    
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    
//    maskLayer.frame = self.bubbleView.bounds;
//    maskLayer.path = maskPath.CGPath;
//    
//    self.bubbleView.layer.mask = maskLayer;
//    self.bubbleView.backgroundColor = [UIColor orangeColor];
//    [self.contentView setNeedsLayout];
//    [self.contentView layoutIfNeeded];
//}
//
//- (void)configureTopBubble {
//    UIBezierPath *maskPath = [UIBezierPath
//                              bezierPathWithRoundedRect:self.bubbleView.bounds
//                              byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight)
//                              cornerRadii:CGSizeMake(20, 20)];
//    
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    
//    maskLayer.frame = self.bubbleView.bounds;
//    maskLayer.path = maskPath.CGPath;
//    
//    self.bubbleView.layer.mask = maskLayer;
//
//    self.bubbleView.backgroundColor = [UIColor greenColor];
//    [self.contentView setNeedsLayout];
//    [self.contentView layoutIfNeeded];
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
