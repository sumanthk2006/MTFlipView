//
//  DemoViewController.m
//  flipview
//
//  Created by zrz on 12-7-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DemoViewController.h"
#import "MTDragFlipView.h"
#import "DemoShowView.h"
#import "DemoAnimationView.h"
#import "DemoMenuViewController.h"

@interface DemoViewController ()
<MTDragFlipViewDelegate>

@end

@implementation DemoViewController {
    DemoMenuViewController  *_menuController;
    MTDragFlipView  *_flipView;
    DemoShowView    *_showerView;
    NSArray *_views;
}

@synthesize model = _model;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.model = [[DemoModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _flipView = [[MTDragFlipView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    _flipView.delegate = self;
    _flipView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_flipView];
    
    
    _showerView = [[DemoShowView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [_flipView reloadData];
    _flipView.loadAll = YES;
    
    _menuController = [[DemoMenuViewController alloc] initWithStyle:UITableViewStylePlain];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    _flipView = nil;
    _views = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (UIView*)flipView:(MTDragFlipView*)flipView subViewAtIndex:(NSInteger)index
{
    _showerView.label.text = [_model.data objectAtIndex:index];
    return _showerView;
}

- (UIView*)flipView:(MTDragFlipView*)flipView backgroudView:(NSInteger)index left:(BOOL)isLeft
{
    if (isLeft) {
        return _menuController.view;
    }
    return nil;
}

- (NSInteger)numberOfFlipViewPage:(MTDragFlipView*)flipView
{
    return [_model.data count];
}

- (MTFlipAnimationView*)flipView:(MTDragFlipView*)flipView dragingView:(NSInteger)index
{
    static NSString *indentify = @"demoView";
    DemoAnimationView *view = (DemoAnimationView*)[flipView viewByIndentify:indentify];
    if (!view) {
        view = [[DemoAnimationView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
        view.indentify = indentify;
    }
    view.text = [_model.data objectAtIndex:index];
    return view;
}

@end
