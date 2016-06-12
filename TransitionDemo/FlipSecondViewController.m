//
//  FlipSecondViewController.m
//  TransitionDemo
//
//  Created by mac on 16/5/30.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "FlipSecondViewController.h"

@interface FlipSecondViewController ()

@end

@implementation FlipSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}
- (void)createUI{
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageV.image = [UIImage imageNamed:@"picture_two.jpg"];
    [self.view addSubview:imageV];
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
