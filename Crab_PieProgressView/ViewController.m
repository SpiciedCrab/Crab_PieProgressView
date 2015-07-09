//
//  ViewController.m
//  Crab_PieProgressView
//
//  Created by Harly on 15/7/9.
//  Copyright (c) 2015年 Harly. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PieProgressView *pieProgress;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.pieProgress setAnimationDuration:1.0];
    [self.pieProgress setPieColor:[UIColor brownColor]];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)gogoCrab:(id)sender {
    [self.pieProgress setProgress:1.0 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
