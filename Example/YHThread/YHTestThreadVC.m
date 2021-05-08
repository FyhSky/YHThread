//
//  YHTestThreadVC.m
//  YHThread_Example
//
//  Created by FengYinghao on 2021/5/7.
//  Copyright © 2021 FyhSky. All rights reserved.
//

#import "YHTestThreadVC.h"
#import <YHThread/YHThread.h>
#import <YHThread/GCDThread.h>
@interface YHTestThreadVC ()
@property (nonatomic,strong) YHThread *thread;
@property (nonatomic,strong) GCDThread *gcdThread;
@end

@implementation YHTestThreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.grayColor;

    _thread = [YHThread new];
    _thread.name = @"YHThread";
    _gcdThread = [[GCDThread alloc] init:@""];
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake((self.view.frame.size.width - 100) / 2.0, (self.view.frame.size.height - 100) / 2.0, 100, 100);
    [self.view addSubview:btn];
    [btn setTitle:@"dismiss" forState:UIControlStateNormal];
    [btn addTarget:self
            action:@selector(poppresentAction)
  forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor redColor]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [_thread excuteTask:^{
//        NSLog(@"111");
//    }];
    [_gcdThread excuteTask:^{
        NSLog(@"111");
    }];
}

- (void)poppresentAction {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
