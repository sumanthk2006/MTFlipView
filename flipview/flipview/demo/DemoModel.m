//
//  DemoModel.m
//  flipview
//
//  Created by zrz on 12-7-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DemoModel.h"

@implementation DemoModel

@synthesize data = _data;

- (id)init
{
    self = [super init];
    if (self) {
        [self loadLocal];
    }
    return self;
}

- (void)loadLocal
{
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:
                         [[NSBundle mainBundle] pathForResource:@"DemoData" ofType:@"plist"]];
    NSArray *array = [dic objectForKey:@"datas"];
    _data = array;
}

@end
