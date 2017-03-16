
//
//  ViewController.m
//  DynamicHeightImage
//
//  Created by Webwerks1 on 10/04/15.
//  Copyright (c) 2015. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    imageUrlArray = [[NSArray alloc] initWithObjects:
					 @"https://media1.giphy.com/media/26xBDugwcg9fn27tu/giphy.gif",
					 @"http://placehold.it/350x200",
					 @"http://placehold.it/150x350",
					 @"http://lorempixel.com/350/200",
					 @"http://placehold.it/350x150",
					 @"http://placehold.it/350x150",
					 @"http://lorempixel.com/350/250",
					 @"http://placehold.it/350x150",
					 @"http://placehold.it/250x450",
					 @"http://lorempixel.com/350/300",
					 @"http://placehold.it/350x150",
					 @"http://lorempixel.com/350/310",
					 @"http://lorempixel.com/350/320",
					 @"http://lorempixel.com/350/330",
					 @"http://placehold.it/350x150",
					 nil];

    _nTableView.rowHeight = UITableViewAutomaticDimension;
    _nTableView.estimatedRowHeight = 150;
    [_nTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - table Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return imageUrlArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }

    [cell setupCellWithImageUrl:[imageUrlArray objectAtIndex:indexPath.row] andRow:indexPath.row];
	
	// Don't need a separate call to configure - everything is handled in setupCellWithImageUrl
//    [cell configureBubbleInRow:indexPath.row];
	
	return cell;
}


@end
