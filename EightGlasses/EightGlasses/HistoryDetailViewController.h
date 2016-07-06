//
//  HistoryDetailViewController.h
//  EightGlasses
//
//  Created by Divya Munni on 6/14/16.
//  Copyright © 2016 app. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DailyWater.h"

@interface HistoryDetailViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UICollectionView *DisplayGlassesCollectionView;
@property (strong, nonatomic) IBOutlet UIView *HistoryDetailUIView;
@property (strong, nonatomic) DailyWater *daily;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@end
