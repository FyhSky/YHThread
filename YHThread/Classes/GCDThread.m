//
//  GCDThread.m
//  YHThread
//
//  Created by FengYinghao on 2021/5/8.
//

#import "GCDThread.h"

@interface GCDThread()
@property (nonatomic,strong) dispatch_queue_t queue;
@end

@implementation GCDThread
- (instancetype)init:(NSString *)queueName {
    self = [super init];
    if (self) {
        self.queue = dispatch_queue_create(queueName && queueName.length ? [queueName UTF8String] : "GCDThread", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)excuteTask:(TaskAction)action {
    if (!action) {
        return;
    }
    dispatch_async(self.queue, ^{
        @autoreleasepool {
            action();
        }
    });
}

@end
