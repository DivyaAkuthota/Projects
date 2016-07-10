//
//  GlassTabBarController.m
//  EightGlasses
//
//  Created by Divya Munni on 6/15/16.
//  Copyright © 2016 app. All rights reserved.
//

#import "GlassTabBarController.h"

@interface GlassTabBarController ()

@end

@implementation GlassTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tabBar.tintColor = [UIColor blueColor];
//    self.tabBar.backgroundImage = [UIImage imageNamed:@"bluegrad1.png"];
    // Do any additional setup after loading the view.
    self.selectedIndex = 1;
    UITabBar *glassTabBar = self.tabBar;
//    glassTabBar.backgroundColor = [UIColor colorWithRed:0.06 green:0.47 blue:0.75 alpha:1.0];
    glassTabBar.backgroundColor = [UIColor colorWithRed:0.07 green:0.08 blue:0.24 alpha:1.0];
    glassTabBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
