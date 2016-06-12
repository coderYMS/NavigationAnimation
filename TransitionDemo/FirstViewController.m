//
//  FirstViewController.m
//  TransitionDemo
//
//  Created by mac on 16/5/30.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "FirstViewController.h"
#import "FlipSecondViewController.h"
#import "FlipTransition.h"

@interface FirstViewController ()<UINavigationControllerDelegate>
{
    UIScreenEdgePanGestureRecognizer *pan;
    
    UIPercentDrivenInteractiveTransition *interaction;
    
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
    self.navigationController.delegate = self;
    
    pan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePan:)];
    pan.edges = UIRectEdgeRight;
    [self.view addGestureRecognizer:pan];

}

- (void)createUI{
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageV.image = [UIImage imageNamed:@"picture_one.jpg"];
    [self.view addSubview:imageV];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 0, 100, 50);
    [btn setTitle:@"pushToNext" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick{
    FlipSecondViewController *flipSecondVC = [[FlipSecondViewController alloc] init];
    [self.navigationController pushViewController:flipSecondVC animated:YES];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        return [[FlipTransition alloc] init];
    }
    return nil;
}
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    return interaction;
}

- (void)edgePan:(UIScreenEdgePanGestureRecognizer *)recognizer{
    
    CGFloat progress =(-1 * [recognizer translationInView:self.view].x)/CGRectGetWidth(self.view.frame);
    FlipSecondViewController *flipSecondVC = [[FlipSecondViewController alloc] init];

    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            interaction = [[UIPercentDrivenInteractiveTransition alloc] init];
            [self.navigationController pushViewController:flipSecondVC animated:YES];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            [interaction updateInteractiveTransition:progress];
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            NSLog(@"end");
        }
            break;
        case UIGestureRecognizerStateCancelled:
        {
            NSLog(@"cancle");

            if (progress > 0.5) {
                [interaction finishInteractiveTransition];
            }else{
                [interaction cancelInteractiveTransition];
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
            interaction = nil;
        }
            break;
            
        default:
            break;
    }
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
