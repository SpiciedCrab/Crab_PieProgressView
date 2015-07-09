//
//  PieProgressView.h
//  Crab_PieProgressView
//
//  Created by Harly on 15/7/8.
//  Copyright (c) 2015年 Harly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieProgressView : UIView {
    float _progress;
}

@property (nonatomic,strong) UIColor* pieColor;
@property (nonatomic) CGFloat animationDuration;

- (void)setProgress:(float)progress;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;
@end
