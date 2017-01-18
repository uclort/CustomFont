//
//  ViewController.m
//  ChangeFont
//
//  Created by 侯猛 on 2017/1/18.
//  Copyright © 2017年 侯猛. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()
@property (nonatomic, weak) IBOutlet UILabel *labelThree;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = false;
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    
    UILabel * labelOne = [[UILabel alloc] init];
    labelOne.frame = CGRectMake(15, 64, width, 50);
    labelOne.text = @"init创建label";
    labelOne.font = [UIFont systemFontOfSize:25];
    
    
    UILabel * labelTwo = [[UILabel alloc] initWithFrame:CGRectMake(15, (labelOne.frame.origin.y + labelOne.frame.size.height + 30), width, 50)];
    labelTwo.text = @"initWithFrame创建label";
    labelTwo.font = [UIFont systemFontOfSize:25];
    
    
    [self.view addSubview:labelOne];
    [self.view addSubview:labelTwo];
    
    
    _labelThree.frame = CGRectMake(15, (labelTwo.frame.origin.y + labelTwo.frame.size.height + 30), width, 50);
    NSLog(@"%f",labelOne.frame.origin.x);
    NSLog(@"%f",labelTwo.frame.origin.x);
    NSLog(@"%f",_labelThree.frame.origin.x);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
