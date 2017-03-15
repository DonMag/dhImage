//
//  RView.m
//  DynamicHeightImage
//
//  Created by Don Mini on 3/15/17.
//  Copyright © 2017 Neosoft. All rights reserved.
//

#import "RView.h"

@implementation RView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

 UIBezierPath *	leftMaskPath = [UIBezierPath
					bezierPathWithRoundedRect:self.bounds
					byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)
					cornerRadii:CGSizeMake(20, 20)];
	

	CAShapeLayer *maskLayer = [CAShapeLayer layer];
	maskLayer.frame = self.bounds;
	maskLayer.path = leftMaskPath.CGPath;
	self.layer.mask = maskLayer;
	
}


@end
