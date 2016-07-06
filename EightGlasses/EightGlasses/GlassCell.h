//
//  GlassCell.h
//  EightGlasses
//
//  Created by Divya Munni on 6/11/16.
//  Copyright © 2016 app. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GlassCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *glassImage;
@property (nonatomic, assign) BOOL isFull;
@end
