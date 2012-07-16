//
//  DemoModel.h
//  flipview
//
//  Created by zrz on 12-7-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoModel : NSObject

//data is a NSArray
@property (nonatomic, strong)   id  data;

- (void)loadLocal;

@end
