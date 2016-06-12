//
//  FlipTransition.m
//  TransitionDemo
//
//  Created by mac on 16/5/30.
//  Copyright © 2016年 yms. All rights reserved.
//

#import "FlipTransition.h"

@implementation FlipTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 2.0;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    _transitionContext = transitionContext;
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:fromVC.view];
    [containerView addSubview:toVC.view];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1/2000.0;
    toVC.view.layer.transform = transform;
    
    toVC.view.layer.anchorPoint = CGPointMake(1, 0.5);
    toVC.view.center = CGPointMake(CGRectGetMaxX(fromVC.view.frame), CGRectGetMidY(fromVC.view.frame));
//    toVC.view.center = fromVC.view.center;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.duration = [self transitionDuration:transitionContext];
    animation.fromValue = @(M_PI_2);
    animation.toValue = @(0);
    animation.delegate = self;
    [toVC.view.layer addAnimation:animation forKey:@"rotateAnimation"];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        [_transitionContext completeTransition:YES];
        [_transitionContext finishInteractiveTransition];
    }
}


@end
