//
//  DemoAnimationView.m
//  flipview
//
//  Created by zrz on 12-7-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DemoAnimationView.h"
#import <QuartzCore/QuartzCore.h>

@implementation DemoAnimationView {
    UIImageView     *_topShadow,
                    *_downShadow;
}

static UIImage  *__image;
static UILabel  *__label;

@synthesize text = _text;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        if (!__image) {
            __image = [UIImage imageNamed:@"bg_detail_panelshadow"];
        }
        _topShadow = [[UIImageView alloc] initWithImage:__image];
        _topShadow.layer.transform = CATransform3DMakeRotation(- M_PI / 2, 0, 0, 1);
        _topShadow.frame = CGRectMake(0, -15, frame.size.width, 15);
        [self addSubview:_topShadow];
        
        _downShadow = [[UIImageView alloc] initWithImage:__image];
        _downShadow.layer.transform = CATransform3DMakeRotation(M_PI / 2, 0, 0, 1);
        _downShadow.frame = CGRectMake(0, frame.size.height, frame.size.width, 15);
        [self addSubview:_downShadow];
        
        self.backgroundColor = [UIColor blueColor];
        
        if (!__label) {
            __label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 220, 300)];
            __label.backgroundColor = [UIColor clearColor];
            __label.numberOfLines = 0;
            __label.textColor = [UIColor whiteColor];
        }
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)setAnimationPercent:(CGFloat)percent
{
    CGRect bounds = self.bounds;
    if (percent == -1) {
        percent = -1.1;
    }
    self.frame = (CGRect){0, bounds.size.height * percent, bounds.size};
}

- (void)setText:(NSString *)text
{
    _text = text;
    void (^block)(CGContextRef context) = ^(CGContextRef context){
        CGContextTranslateCTM(context, __label.frame.origin.x, __label.frame.origin.y);
        __label.text = text;
        [__label.layer renderInContext:context];
    };
    [self startRender:block];
}

@end