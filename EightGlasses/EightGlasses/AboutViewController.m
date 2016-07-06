//
//  AboutViewController.m
//  EightGlasses
//
//  Created by Divya Munni on 6/11/16.
//  Copyright © 2016 app. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.AboutView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern-bg-2.png"]];
    self.AboutView.alpha = 2.0;
    
    // Do any additional setup after loading the view.
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
