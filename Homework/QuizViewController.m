//
//  QuizViewController.m
//  Homework
//
//  Created by Leo Wang on 7/19/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

#import "QuizViewController.h"
#import "QuizRecord.h"

@implementation QuizViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Get the height of the status bar

    CGFloat statusBarHeight =
    [UIApplication sharedApplication].statusBarFrame.size.height;
    UIEdgeInsets insets = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0);
    
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
}

#pragma mark - Table View Data Source and Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int rows = [[QuizRecord sharedQuizRecord] count];
    NSLog(@"table: %d", rows);
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // Get a new or recycled cell
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                         forIndexPath:indexPath];

    // Configure the cell with the item's properties
    NSMutableArray *quiz = [QuizRecord sharedQuizRecord];
    
    cell.textLabel.text = [[quiz objectAtIndex:indexPath.row] getQuestion];
    NSString *time = [NSString stringWithFormat:@"%i", [[quiz objectAtIndex:indexPath.row] getTime]];
    cell.detailTextLabel.text = time;

    return cell;
}

@end
