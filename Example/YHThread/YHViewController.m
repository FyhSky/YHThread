//
//  YHViewController.m
//  YHThread
//
//  Created by FyhSky on 05/07/2021.
//  Copyright (c) 2021 FyhSky. All rights reserved.
//

#import "YHViewController.h"
#import "YHTestThreadVC.h"

@interface YHViewController ()

@end

@implementation YHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake((self.view.frame.size.width - 100) / 2.0, (self.view.frame.size.height - 100) / 2.0, 100, 100);
    [self.view addSubview:btn];
    [btn setTitle:@"present" forState:UIControlStateNormal];
    [btn addTarget:self
            action:@selector(presentAction)
  forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor redColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)presentAction {
     YHTestThreadVC *vc = [YHTestThreadVC new];
     [self presentViewController:vc
                        animated:true
                      completion:nil];
}

@end
