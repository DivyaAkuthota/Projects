//
//  ViewController.m
//  EightGlasses
//
//  Created by Divya Munni on 6/11/16.
//  Copyright © 2016 app. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "HistoryCell.h"
#import "HistoryDetailViewController.h"
#import "DateFormatter.h"

@interface ViewController ()
{
    NSManagedObjectContext *context;
}
@end

@implementation ViewController

NSArray *matchingData;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate =[[UIApplication sharedApplication]delegate];
    context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"DailyWater" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDesc];
    
    // predicate is not needed if you want to get all the  values from the table
    NSError *error;
    matchingData = [context executeFetchRequest:request error:&error];
    
    if(matchingData.count == 0){
        NSLog(@"no Data");
    }
    self.HistoryTableView.backgroundColor = [UIColor clearColor];
    self.HistoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIImageView *tableImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pattern-bg-2.png"]];
    [tableImage setFrame:self.HistoryTableView.frame];
    self.HistoryTableView.backgroundView = tableImage;
    // Do any additional setup after loading the view, typically from a nib.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"historyTable";
    
    HistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[HistoryCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSManagedObject *obj = [matchingData objectAtIndex:indexPath.row];
    NSString *dateString = (NSString *)[obj valueForKey:@"date"];
    
    NSNumber *count = (NSNumber *)[obj valueForKey:@"noofglasses"];
    int value = [count intValue];
 
    cell.textLabel.text = [NSString stringWithFormat:@"%d glasses", value];
    cell.textLabel.font = [UIFont fontWithName:@"American Typewriter" size:17];
    // set the color for textlabel and detail text
    cell.detailTextLabel.text = dateString;
    cell.detailTextLabel.textColor = [UIColor blackColor];
    cell.detailTextLabel.font = [UIFont fontWithName:@"American Typewriter" size:17];
    cell.imageView.image = [UIImage imageNamed:@"cellGlass.png"];
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryView.tintColor = [UIColor blackColor];

//    UIImageView *glassImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"justFullGlass-2.png"]];
    
    UIView  *whiteRoundedView = [[UIView alloc]initWithFrame:CGRectMake(12, 12, self.view.frame.size.width-18, 60)];
    CGFloat colors[]={1.0,1.0,1.0,1.0};  //cell color white
    //- (UIColor *)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
//    UIColor *blue = [UIColor colorWithRed:0.06 green:0.47 blue:0.75 alpha:1.0];
    whiteRoundedView.layer.backgroundColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), colors);
//    whiteRoundedView.layer.backgroundColor = blue.CGColor;
    whiteRoundedView.layer.opacity = 0.65;
    whiteRoundedView.layer.masksToBounds = false;
    whiteRoundedView.layer.cornerRadius = 10.0;
    whiteRoundedView.layer.shadowOffset = CGSizeMake(-1, 1);
    whiteRoundedView.layer.shadowOpacity = 0.8;
    [cell.contentView addSubview:whiteRoundedView];
    [cell.contentView sendSubviewToBack:whiteRoundedView];
    [cell setSubView:whiteRoundedView];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return matchingData.count;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"SampleModal" sender:indexPath];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"SampleModal"]){
        HistoryDetailViewController *detail = (HistoryDetailViewController *)segue.destinationViewController;
        NSIndexPath *currentIndex = (NSIndexPath *)sender;
        NSManagedObject *obj = [matchingData objectAtIndex:currentIndex.item];
        detail.daily = (DailyWater *)obj;
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
