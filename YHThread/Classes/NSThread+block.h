//
//  NSThread+block.h
//  YHThread
//
//  Created by FengYinghao on 2021/5/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSThread (block)
+ (instancetype)threadWithBlock:(void (^)(void))block;
@end

NS_ASSUME_NONNULL_END
