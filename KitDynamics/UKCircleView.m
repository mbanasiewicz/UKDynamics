//
//  UKCircleView.m
//  KitDynamics
//
//  Created by Maciej Banasiewicz on 26.10.2013.
//  Copyright (c) 2013 Maciej Banasiewicz. All rights reserved.
//

#import "UKCircleView.h"

@implementation UKCircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    CGPathRef circle = CGPathCreateWithEllipseInRect(bounds, NULL);
    
    // Draw the border
    CGContextSaveGState(ctx); {
        CGContextBeginPath(ctx);
        CGContextAddPath(ctx, circle);
        [[UIColor blueColor] setFill];
        CGContextFillPath(ctx);
    } CGContextRestoreGState(ctx);
    
    CGPathRelease(circle);
    CGContextRestoreGState(ctx);
}

@end
