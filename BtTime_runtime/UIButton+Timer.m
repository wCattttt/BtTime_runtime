//
//  UIButton+Timer.m
//  BtTime_runtime
//
//  Created by 魏唯隆 on 2017/6/5.
//  Copyright © 2017年 魏唯隆. All rights reserved.
//

#import "UIButton+Timer.h"
#import <objc/runtime.h>
#import <objc/message.h>

static NSTimer *_timer;
static NSInteger _second;

@implementation UIButton (Timer)

- (NSString *)time {
    return objc_getAssociatedObject(self, @selector(time));
}

- (void)setTime:(NSString *)time {
    objc_setAssociatedObject(self, @selector(time), time, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)color {
    return objc_getAssociatedObject(self, @selector(color));
}

- (void)setColor:(UIColor *)color {
    objc_setAssociatedObject(self, @selector(color), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.backgroundColor = color;
}

- (void)startTime {
    _second = self.time.integerValue;
    
    [self setTitle:[NSString stringWithFormat:@"倒计时%ld s", (long)_second] forState:UIControlStateNormal];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    self.backgroundColor = [UIColor grayColor];
    self.enabled = NO;
    
}

- (void)timerMethod {
    if(_second <= 0){
        [_timer invalidate];
        _timer = nil;
        [self setTitle:@"重新获取验证码" forState:UIControlStateNormal];
        self.enabled = YES;
        self.backgroundColor = self.color;
    }else {
        _second --;
        [self setTitle:[NSString stringWithFormat:@"倒计时%ld s", (long)_second] forState:UIControlStateNormal];
    }
    
}

/*
- (void)stopTime {
    [_timer setFireDate:[NSDate distantFuture]];
    self.enabled = YES;
}
 */

@end
