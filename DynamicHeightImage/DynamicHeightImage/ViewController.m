
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
    imageUrlArray = [[NSArray alloc] initWithObjects:@"http://placehold.it/350x200", @"http://placehold.it/150x350", @"http://placehold.it/350x150", @"http://placehold.it/350x150", @"http://placehold.it/350x150", @"http://placehold.it/250x450", @"http://placehold.it/350x250", @"https://media1.giphy.com/media/26xBDugwcg9fn27tu/giphy.gif", nil];

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
//    [cell configureBubbleInRow:indexPath.row];
    return cell;
}


@end
