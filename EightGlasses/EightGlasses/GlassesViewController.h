//
//  GlassesViewController.h
//  EightGlasses
//
//  Created by Divya Munni on 6/11/16.
//  Copyright © 2016 app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GlassesViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *GlassCollectionView;
@property (strong, nonatomic) IBOutlet UIView *GlassesUIView;
@property (strong, nonatomic) IBOutlet UILabel *todayDateLabel;
@property (nonatomic, strong) NSArray *glasses;
@end
