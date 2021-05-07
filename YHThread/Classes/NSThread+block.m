//
//  NSThread+block.m
//  YHThread
//
//  Created by FengYinghao on 2021/5/7.
//

#import "NSThread+block.h"

@implementation NSThread (block)
+ (instancetype)threadWithBlock:(void (^)(void))block {
    NSThread *thread = [[self alloc] initWithTarget:self
                                           selector:@selector(action:)
                                             object:[block copy]];
    [thread start];
    return thread;
}

+ (void)action:(id)block {
    if (block) {
        void (^_block)(void) = block;
        if (_block) {
            _block();
        }
    }
}
@end
