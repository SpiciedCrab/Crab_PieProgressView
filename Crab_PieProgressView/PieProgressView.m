//
//  PieProgressView.m
//  Crab_PieProgressView
//
//  Created by Harly on 15/7/8.
//  Copyright (c) 2015年 Harly. All rights reserved.
//

#import "PieProgressView.h"

@interface PieProgressView ()
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic) CFTimeInterval animationStartTime;
@property (nonatomic) CGFloat animationFromValue;
@property (nonatomic) CGFloat animationToValue;
@property (nonatomic, strong) CADisplayLink *displayLink;

@end

@implementation PieProgressView

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _progress = 0;
        self.animationDuration = 1;
        
        _progressLayer = [CAShapeLayer layer];
        _progressLayer.backgroundColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:_progressLayer];
    }
    return self;
}

-(void)setPieColor:(UIColor *)pieColor
{
    _pieColor = pieColor;
    [self.progressLayer setFillColor:[pieColor CGColor]];
}

-(void)drawPie
{
    [self drawProgress];
}

- (void)drawProgress
{
    float arc = _progress;
    if(arc==0)
        arc =1;

    CGRect bounds = self.bounds;
    float startAngle = - M_PI_2;
    float endAngle = startAngle + (2.0 * M_PI * arc);
    CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    double radius=CGRectGetWidth(bounds)/2;
    
    //Draw path
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:center];
    [path addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:NO];
    [path closePath];
    
    //Set the path
    [_progressLayer setPath:path.CGPath];
}

- (void)setProgress:(float)progress
{
    _progress = 1-progress;
    [self drawPie];
}


- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    if (!animated) {
        if (_displayLink) {
            //Kill running animations
            [_displayLink invalidate];
            _displayLink = nil;
        }
        
        [self setProgress:progress];
    } else {
        _animationStartTime = CACurrentMediaTime();
        _animationFromValue = _progress;
        _animationToValue = progress;
        if (!_displayLink) {
            //Create and setup the display link
            [self.displayLink invalidate];
            self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(animateProgress:)];
            [self.displayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];
        }
    }
}

- (void)animateProgress:(CADisplayLink *)displayLink
{
    dispatch_async(dispatch_get_main_queue(), ^{
        CGFloat dt = (displayLink.timestamp - _animationStartTime) / self.animationDuration;
        
        if (dt >= 1.0) {
            [self.displayLink invalidate];
            self.displayLink = nil;
            [self setProgress:_animationToValue];
            return;
        }
        //Set progress
        [self setProgress:_animationFromValue + dt * (_animationToValue - _animationFromValue)];
    });
}


@end
