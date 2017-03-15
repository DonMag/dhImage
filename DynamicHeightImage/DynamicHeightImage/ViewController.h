//
//  ViewController.h
//  DynamicHeightImage
//
//  Created by Webwerks1 on 10/04/15.
//  Copyright (c) 2015. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *imageUrlArray;
}

@property (weak, nonatomic) IBOutlet UITableView *nTableView;


@end
