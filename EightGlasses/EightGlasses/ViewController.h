//
//  ViewController.h
//  EightGlasses
//
//  Created by Divya Munni on 6/11/16.
//  Copyright © 2016 app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *HistoryTableView;
@property (strong, nonatomic) IBOutlet UIView *HistoryView;

@property (nonatomic, strong) NSArray *historyArray;

@end

