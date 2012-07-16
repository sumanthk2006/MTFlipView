//
//  DemoAnimationView.h
//  flipview
//
//  Created by zrz on 12-7-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MTFlipAnimationView.h"

@interface DemoAnimationView : MTFlipAnimationView

- (void)setAnimationPercent:(CGFloat)percent;

@property (nonatomic, strong)   NSString *text;

@end
