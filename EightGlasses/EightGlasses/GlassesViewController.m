//
//  GlassesViewController.m
//  EightGlasses
//
//  Created by Divya Munni on 6/11/16.
//  Copyright © 2016 app. All rights reserved.
//

#import "GlassesViewController.h"
#import "GlassCell.h"
#import "AppDelegate.h"
#import "ImageUITapGestureRecognizer.h"
#import "DailyWater.h"
#import "DateFormatter.h"

@interface GlassesViewController ()
{
    NSManagedObjectContext *context;
}
@end

@implementation GlassesViewController
bool flip;
NSArray *glassStatus;
DateFormatter *dateFormatter;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.GlassCollectionView.layer.cornerRadius = 15;
    self.GlassCollectionView.layer.masksToBounds = YES;
    self.GlassCollectionView.backgroundColor = [UIColor clearColor];
    
//    UIImageView *glassImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pattern-bg-2.png"]];
//    [glassImage setFrame:self.GlassesUIView.frame];
//    self.GlassesUIView
//
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pattern-bg-2.png"]];
    [imageView setFrame:self.GlassesUIView.frame];
    [self.GlassesUIView addSubview: imageView];
    [self.GlassesUIView sendSubviewToBack:imageView];
//    self.GlassesUIView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern-bg-2.png"]];
    
    self.glasses = @[@"emptyGlass-1.png" , @"fullglass-4.png"];
    AppDelegate *appDelegate =[[UIApplication sharedApplication]delegate];
    context = [appDelegate managedObjectContext];
    flip = YES;
    dateFormatter = [[DateFormatter alloc]init];
    self.todayDateLabel.text = [dateFormatter getFullMonth:[NSDate date]];
    
//    
//    NSDate *today = [NSDate date];
//    NSDate *yesterday = [today dateByAddingTimeInterval: -86400.0];
//    NSString *yestDate = [self dateToString:yesterday];
//      yestDate = @"2016-06-08";
//    NSArray *yestMatchingData = [self fetchWaterDetails:@"DailyWater" forDate:yesterday fromContext:context];
//    
//    if(yestMatchingData.count == 0){
//        NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"DailyWater" inManagedObjectContext:context];
//        NSManagedObject *newWater = [[NSManagedObject alloc]initWithEntity:entityDesc insertIntoManagedObjectContext:context];
//        
//        [newWater setValue:yestDate forKey:@"date"];
//        [newWater setValue:@0 forKey:@"noofglasses"];
//        [newWater setValue:@NO forKey:@"drankmin"];
//        
//        NSError *error;
//        [context save:&error];
//    }
//
    
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

//-(UICollectionViewCell *)setupCell:(UICollectionViewCell *)cell withImage:(NSString *)imageName interaction:(boolean)interaction

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDate *today = [NSDate date];
    
    
    NSArray *matchingData = [self fetchWaterDetails:@"DailyWater" forDate:today fromContext:context];
    GlassCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GlassCell" forIndexPath:indexPath];
    
    if(matchingData.count == 0){
        cell.glassImage.image = [UIImage imageNamed:[self.glasses objectAtIndex:0]];
        //cell.glassImage.tag = indexPath;
        cell.glassImage.userInteractionEnabled = YES;
        cell.isFull = false;
        cell.contentView.backgroundColor = [UIColor clearColor];
        //[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(respondToTapGesture:) withObject:indexPath];
        ImageUITapGestureRecognizer *tapRecognizer = [[ImageUITapGestureRecognizer alloc]initWithTarget:self action:@selector(respondToTapGesture:)];
        tapRecognizer.isFull = cell.isFull;
        [cell.glassImage addGestureRecognizer:tapRecognizer];
        
    }else {
        NSManagedObject *obj = [matchingData objectAtIndex:0];
        
        NSNumber *count = (NSNumber *)[obj valueForKey:@"noofglasses"];
        int value = [count intValue];
        
        if(indexPath.item < value){
            cell.glassImage.image = [UIImage imageNamed:[self.glasses objectAtIndex:1]];
            //cell.glassImage.tag = indexPath;
            cell.glassImage.userInteractionEnabled = YES;
            cell.isFull = TRUE;
            ImageUITapGestureRecognizer *tapRecognizer = [[ImageUITapGestureRecognizer alloc]initWithTarget:self action:@selector(respondToTapGesture:)];
            tapRecognizer.isFull = cell.isFull;
            [cell.glassImage addGestureRecognizer:tapRecognizer];
        } else {
            cell.glassImage.image = [UIImage imageNamed:[self.glasses objectAtIndex:0]];
            //cell.glassImage.tag = indexPath;
            cell.glassImage.userInteractionEnabled = YES;
            cell.isFull = FALSE;
            ImageUITapGestureRecognizer *tapRecognizer = [[ImageUITapGestureRecognizer alloc]initWithTarget:self action:@selector(respondToTapGesture:)];
            tapRecognizer.isFull = cell.isFull;
            [cell.glassImage addGestureRecognizer:tapRecognizer];
        }
        
    }
//    CGFloat colors[]={1.0,1.0,1.0,1.0};
//    cell.layer.backgroundColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), colors);
//    cell.layer.opacity = 0.65;
//    cell.layer.cornerRadius = 10.0;
    return cell;
}

- (NSString *)platformRawString {
    size_t size;
   // sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    // sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionView *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
   // NSString *platform = [self platformRawString];
    return 2.0; // This is the minimum inter item spacing, can be more
}


-(NSArray *)fetchWaterDetails:(NSString *)entity forDate:(NSDate *)today fromContext:(NSManagedObjectContext *)context{
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:entity inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDesc];

    NSString *todayString = (NSString *)[dateFormatter dateToString:today];
//    NSString *todayString = @"2016-06-06";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"date like %@",todayString];
    [request setPredicate:predicate];

    NSError *error;
    NSArray *matchingData = [context executeFetchRequest:request error:&error];
    
    return matchingData;
}

-(void)respondToTapGesture:(UITapGestureRecognizer *)sender{
    UIImageView *tappedImage = (UIImageView *)sender.view;
    ImageUITapGestureRecognizer *tap = (ImageUITapGestureRecognizer *)sender;
    
    if(!tap.isFull) {
    NSLog(@"Tap recognized");
    
    NSDate *today = [NSDate date];
    NSString *dateString = (NSString *)[dateFormatter dateToString:today];
//        NSString *dateString = @"2016-06-06";
        
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"DailyWater" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDesc];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"date like %@",dateString];
    [request setPredicate:predicate];
    NSError *errorFetching;
    
    NSArray *matchingData = [context executeFetchRequest:request error:&errorFetching];
    
    if(matchingData.count == 0){
        
        NSManagedObject *newWater = [[NSManagedObject alloc]initWithEntity:entityDesc insertIntoManagedObjectContext:context];
    
        [newWater setValue:dateString forKey:@"date"];
        [newWater setValue:@1 forKey:@"noofglasses"];
        [newWater setValue:@NO forKey:@"drankmin"];
    
        NSError *error;
        [context save:&error];
    
    //UIImageView *tappedImage = (UIImageView *)sender.view;
        tappedImage.image = [UIImage imageNamed:[self.glasses objectAtIndex:1]];
//        tappedImage.image = [UIImage imageNamed:@"fullglass.png"];
        tap.isFull = YES;
    }
    else if(matchingData.count == 1 ){
        NSManagedObject *obj = [matchingData objectAtIndex:0];
        
        NSNumber *count = (NSNumber *)[obj valueForKey:@"noofglasses"];
        int value = [count intValue];
        
        count = [NSNumber numberWithInt:value + 1];
        if(value == 8){
            NSLog(@"You are done for the day");
        }
        
        [obj setValue:count forKey:@"noofglasses"];
        
        NSError *error;
        [context save:&error];
        tappedImage.image = [UIImage imageNamed:[self.glasses objectAtIndex:1]];
        tap.isFull = YES;
        }
    } // enters this loop only if the glass is empty
    else {
    NSLog(@"Glass already full");
        UIAlertController *fullGlassAlert = [UIAlertController alertControllerWithTitle:@"Glass is Full" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 //Do some thing here
                                 NSLog(@"Full Glass OK");
                                 
                             }];
        [fullGlassAlert addAction:ok];
        [self presentViewController:fullGlassAlert animated:YES completion:nil];
        
    }
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(80.0, 80.0);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
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
