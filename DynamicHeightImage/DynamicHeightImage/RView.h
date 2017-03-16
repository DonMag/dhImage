//
//  RView.h
//  DynamicHeightImage
//
//  Created by DonMag on 3/15/17.
//  MIT License
//

#import <UIKit/UIKit.h>

#define MASK_LEFT	0
#define MASK_RIGHT	1

@interface RView : UIView

@property (assign, readwrite) NSInteger leftOrRight;

@end
