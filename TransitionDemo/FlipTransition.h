//
//  FlipTransition.h
//  TransitionDemo
//
//  Created by mac on 16/5/30.
//  Copyright © 2016年 yms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FlipTransition : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,strong) id transitionContext;

@end
