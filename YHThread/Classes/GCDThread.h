//
//  GCDThread.h
//  YHThread
//
//  Created by FengYinghao on 2021/5/8.
//

#import <Foundation/Foundation.h>

typedef void(^TaskAction)(void);
NS_ASSUME_NONNULL_BEGIN

@interface GCDThread : NSObject
- (instancetype)init:(NSString *)queueName;
- (void)excuteTask:(TaskAction)action;
@end

NS_ASSUME_NONNULL_END
