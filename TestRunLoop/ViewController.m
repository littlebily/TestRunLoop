//
//  ViewController.m
//  TestRunLoop
//
//  Created by Bolu on 16/7/1.
//  Copyright © 2016年 Bolu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    BOOL end;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"start new thread …");
    [NSThread detachNewThreadSelector:@selector(runOnNewThread) toTarget:self withObject:nil];
    while (!end) {
        NSLog(@"runloop…");
        //为什么在这里加了RunLoop之后，while循环里就不会一直跑NSLog方法，可能是因为下面的方式可以阻塞当前线程，在当前主线程的RunLoop里嵌套一个RunLoop，一直轮回检测是否有消息处理
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];

//        NSLog(@"current therd--%@",[NSThread currentThread]);
        NSLog(@"runloop end.");
    }
    NSLog(@"ok.");
    
    
//    NSTimer *timer = [NSTimer timerWithTimeInterval:0 target:self selector:@selector(testTimer) userInfo:nil repeats:NO];
//    [timer fire];
//    [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(testTimer) userInfo:nil repeats:NO];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)testTimer
{
    NSLog(@"testTimer");
}

-(void)runOnNewThread{
    NSLog(@"run for new thread …");
    sleep(1);
    end=YES;
    NSLog(@"end.");
}

//-(void)runOnNewThread{
//    
//    NSLog(@"run for new thread …");
//    sleep(1);
//    [self performSelectorOnMainThread:@selector(setEnd) withObject:nil waitUntilDone:NO];
//    NSLog(@"end.");
//}

-(void)setEnd{
    NSLog(@"end yes");
    end=YES;
}

@end
