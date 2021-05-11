//
//  YHThread.m
//  YHThread
//
//  Created by FengYinghao on 2021/5/7.
//

#import "YHThread.h"
#import "NSThread+block.h"

@interface YHThread()
@property (nonatomic,strong) NSThread *thread;
@property (nonatomic,assign,getter=isStoped) BOOL stoped;
@end

@implementation YHThread
- (instancetype)init {
    self = [super init];
    if (self) {
        self.stoped = NO;
        __weak typeof(self)weakSelf = self;
        self.thread = [NSThread threadWithBlock:^{
            @autoreleasepool {
                [[NSRunLoop currentRunLoop] addPort:[NSMachPort port]
                                            forMode:NSDefaultRunLoopMode];
                while (weakSelf && !weakSelf.stoped) {
                    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                             beforeDate:[NSDate distantFuture]];
                }
            }
        }];
    }
    return self;
}

- (void)setName:(NSString *)name {
    self.thread.name = name;
}

- (NSString *)name {
    return self.thread.name;
}

- (void)stop {
    if (!self.thread) {
        return;
    }
    [self performSelector:@selector(stopThread)
                 onThread:self.thread
               withObject:nil
            waitUntilDone:YES];
}

- (void)stopThread {
    self.stoped = YES;
    self.thread = nil;
}

- (void)excuteTask:(ThreadTaskAction)action {
    if(!self.thread || !action) {
        return;
    }
    [self performSelector:@selector(taskAction:)
                 onThread:self.thread
               withObject:action
            waitUntilDone:NO];
}

- (void)taskAction:(ThreadTaskAction)action {
    @autoreleasepool {
        if (!action) {
            return;
        }
        action();
    }
}

- (void)dealloc {
    [self stop];
}

@end
