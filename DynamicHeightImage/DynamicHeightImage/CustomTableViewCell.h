//
//  CustomTableViewCell.h
//  DynamicHeightImage
//
//  Created by Webwerks1 on 10/04/15.
//  Copyright (c) 2015. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

#import "RView.h"

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *nImageView;

// bubbleView is now an "RView" (UIView subclass)
@property (weak, nonatomic) IBOutlet RView *bubbleView;

@property (strong, nonatomic) UIBezierPath *leftMaskPath;
@property (strong, nonatomic) UIBezierPath *rightMaskPath;
@property (strong, nonatomic) CAShapeLayer *maskLayer;


- (void)setupCellWithImageUrl:(NSString *)imageUrl andRow:(NSInteger)row;

// not needed anymore
//- (void)configureBubbleInRow:(NSInteger)row;

@end
