//
//  YHThread.h
//  YHThread
//
//  Created by FengYinghao on 2021/5/7.
//

#import <Foundation/Foundation.h>

typedef void(^ThreadTaskAction)(void);

NS_ASSUME_NONNULL_BEGIN

@interface YHThread : NSObject
@property (nonatomic,copy) NSString *name;
- (void)excuteTask:(ThreadTaskAction)action;
@end

NS_ASSUME_NONNULL_END
