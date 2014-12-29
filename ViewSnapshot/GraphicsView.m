//
//  GraphicsView.m
//  ViewSnapshot
//
//  Created by SalCat on 12/29/14.
//  Copyright (c) 2014 SalCat. All rights reserved.
//

#import "GraphicsView.h"

@implementation GraphicsView


- (void)drawRect:(CGRect)rect {
    NSLog(@"drawRect:%@", NSStringFromCGRect(rect));
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    [self fillView:rect];
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithRect:rect];
    [clipPath addClip];
    
    [self fillView:rect];
    
    
    [[UIColor whiteColor] setStroke];
    
    UIBezierPath *rectangle = [UIBezierPath bezierPath];
    [rectangle setLineWidth:2];
    
    CGPoint origin = rect.origin;
    origin.x += 10;
    origin.y += 10;
    [rectangle moveToPoint:origin];
    
    [rectangle addLineToPoint:CGPointMake(rect.origin.x + rect.size.width -10, rect.origin.y + 10)];
    
    [rectangle addLineToPoint:CGPointMake(rect.origin.x + rect.size.width -10, rect.origin.y + rect.size.height -10)];
    
    [rectangle addLineToPoint:CGPointMake(rect.origin.x +10, rect.origin.y + rect.size.height -10)];
    [rectangle closePath];
    [rectangle stroke];
    CGContextRestoreGState(ctx);
    
}
- (void)fillView: (CGRect)rect {
    UIBezierPath *r = [UIBezierPath bezierPathWithRect:rect];
    [[UIColor blueColor] setFill];
    [r fill];
}
@end

