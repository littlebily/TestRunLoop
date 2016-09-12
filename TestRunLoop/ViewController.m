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
    
//    NSLog(@"start new thread …");
//    [NSThread detachNewThreadSelector:@selector(runOnNewThread) toTarget:self withObject:nil];
//    while (!end) {
//        NSLog(@"runloop…");
//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
////        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
//
////        NSLog(@"current therd--%@",[NSThread currentThread]);
//        NSLog(@"runloop end.");
//    }
//    NSLog(@"ok.");
    
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:0 target:self selector:@selector(testTimer) userInfo:nil repeats:NO];
//    [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(testTimer) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)testTimer
{
    NSLog(@"testTimer");
}

//-(void)runOnNewThread{
//    NSLog(@"run for new thread …");
//    sleep(1);
//    end=YES;
//    NSLog(@"end.");
//}

-(void)runOnNewThread{
    
    NSLog(@"run for new thread …");
    sleep(1);
    [self performSelectorOnMainThread:@selector(setEnd) withObject:nil waitUntilDone:NO];
    NSLog(@"end.");
}
-(void)setEnd{
    NSLog(@"end yes");
    end=YES;
}

@end
