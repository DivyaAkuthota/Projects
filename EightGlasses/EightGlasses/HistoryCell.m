//
//  HistoryCell.m
//  EightGlasses
//
//  Created by Divya Munni on 6/14/16.
//  Copyright © 2016 app. All rights reserved.
//

#import "HistoryCell.h"

@implementation HistoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.imageView.frame = CGRectMake(0,0,32,32);
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse
{
    [[self subView] removeFromSuperview];
//    [[self imgView] removeFromSuperview];
    //[self setaSwitch:nil];
    [self setSubView:nil];
//    [self setImgView:nil];
    
}

@end
