//
//  HudView.h
//  MyLocations
//
//  Created by jfl913 on 14/7/16.
//  Copyright (c) 2014年 jfl913. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HudView : UIView

@property (nonatomic, strong) NSString *text;

+ (instancetype)hudInView:(UIView *)view animated:(BOOL)animated;

@end
