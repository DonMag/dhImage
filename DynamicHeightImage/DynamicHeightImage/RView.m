//
//  RView.m
//  DynamicHeightImage
//
//  Created by DonMag on 3/15/17.
//  MIT License
//

#import "RView.h"

@implementation RView


- (void)layoutSubviews {
	
	[super layoutSubviews];
	
	UIBezierPath *maskPath;
	
	if (_leftOrRight == MASK_LEFT) {
		maskPath = [UIBezierPath
					bezierPathWithRoundedRect:self.bounds
					byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)
					cornerRadii:CGSizeMake(20, 20)];
	} else {
		maskPath = [UIBezierPath
					bezierPathWithRoundedRect:self.bounds
					byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight)
					cornerRadii:CGSizeMake(20, 20)];
	}
	
	CAShapeLayer *maskLayer = [CAShapeLayer layer];
	maskLayer.frame = self.bounds;
	
	maskLayer.path = maskPath.CGPath;
	self.layer.mask = maskLayer;

}

@end
