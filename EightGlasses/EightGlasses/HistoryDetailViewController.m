//
//  HistoryDetailViewController.m
//  EightGlasses
//
//  Created by Divya Munni on 6/14/16.
//  Copyright © 2016 app. All rights reserved.
//

#import "HistoryDetailViewController.h"
#import "GlassCell.h"
#import "DateFormatter.h"

@interface HistoryDetailViewController ()

@end

@implementation HistoryDetailViewController

NSArray *glass;

- (void)viewDidLoad {
    [super viewDidLoad];
    DateFormatter *dateFormatter = [[DateFormatter alloc]init];
    self.HistoryDetailUIView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bluegrad1.png"]];
    NSString *date = [self.daily valueForKey:@"date"];
//    NSString *fullDate = [dateFormatter date];
    self.dateLabel.text = date;
    
    NSString *status = [NSString stringWithFormat:@"You drank %d glasses of water",[[self.daily valueForKey:@"noofglasses"] intValue]];
    self.statusLabel.text = status;
    //NSLog(str);
    glass = @[@"emptyGlass-1.png" , @"fullglass-4.png"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(80.0, 80.0);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionView *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2.0; // This is the minimum inter item spacing, can be more
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellidentifier = @"historyCellIdentifier";
    
    GlassCell *cell = (GlassCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellidentifier forIndexPath:indexPath];
    NSNumber *fullglasses = [self.daily valueForKey:@"noofglasses"];
    int value = [fullglasses intValue];
    NSString *str = [self.daily valueForKey:@"date"];
    
//    NSLog([NSString stringWithFormat:@"%@ : %d",str, value]);
    
    if(indexPath.item < value){
        cell.glassImage.image = [UIImage imageNamed:[glass objectAtIndex:1]];
    }else{
        cell.glassImage.image = [UIImage imageNamed:[glass objectAtIndex:0]];
    }
//        cell.glassImage.image = [UIImage imageNamed:@"fullGlass-3.png"];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
