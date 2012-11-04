//
//  C4WorkSpace.m
//  CollisionTimer
//
//  Created by moi on 12-11-04.
//  Copyright (c) 2012 moi. All rights reserved.
//

#import "C4WorkSpace.h"

@implementation C4WorkSpace {
    C4Timer *t;
    C4Shape *s1, *s2;
    NSInteger frame;
}

-(void)setup {
    frame = 0;
    s1 = [C4Shape rect:CGRectMake(0, 0, 100, 100)];
    s2 = [C4Shape rect:CGRectMake(0, 0, 80, 80)];
    s2.center = self.canvas.center;
    [s2 addGesture:PAN name:@"pan" action:@"move:"];
    
    t = [C4Timer automaticTimerWithInterval:0.1 target:self method:@"checkCollisions" repeats:YES];
    [self.canvas addShape:s1];
    [self.canvas addShape:s2];
}

-(void)checkCollisions {
    if(CGRectContainsRect(s1.frame, s2.frame)) {
        s2.fillColor = C4RED;
    } else if(CGRectIntersectsRect(s1.frame, s2.frame)) {
        s2.fillColor = C4GREY;
    } else {
        s2.fillColor = C4BLUE;
    }
    C4Log(@"checkCollisions %d", frame++);
}

@end
