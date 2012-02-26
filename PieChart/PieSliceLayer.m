//
//  PieSliceLayer.m
//  PieChart
//
//  Created by Pavan Podila on 2/20/12.
//  Copyright (c) 2012 Pixel-in-Gene. All rights reserved.
//

#import "PieSliceLayer.h"

@implementation PieSliceLayer

@dynamic startAngle, endAngle;
@synthesize fillColor, strokeColor, strokeWidth;

-(CABasicAnimation *)makeAnimationForKey:(NSString *)key {
	CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:key];
	anim.fromValue = [[self presentationLayer] valueForKey:key];
	anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	anim.duration = 0.5;

	return anim;
}

- (id)init {
    self = [super init];
    if (self) {
		self.fillColor = [UIColor grayColor];
        self.strokeColor = [UIColor blackColor];
		self.strokeWidth = 1.0;
		
		[self setNeedsDisplay];
    }
	
    return self;
}

-(id<CAAction>)actionForKey:(NSString *)event {
	if ([event isEqualToString:@"startAngle"] ||
		[event isEqualToString:@"endAngle"]) {
		return [self makeAnimationForKey:event];
	}
	
	return [super actionForKey:event];
}

- (id)initWithLayer:(id)layer {
	if (self = [super initWithLayer:layer]) {
		if ([layer isKindOfClass:[PieSliceLayer class]]) {
			PieSliceLayer *other = (PieSliceLayer *)layer;
			self.startAngle = other.startAngle;
			self.endAngle = other.endAngle;
			self.fillColor = other.fillColor;

			self.strokeColor = other.strokeColor;
			self.strokeWidth = other.strokeWidth;
		}
	}
	
	return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
	if ([key isEqualToString:@"startAngle"] || [key isEqualToString:@"endAngle"]) {
		return YES;
	}
	
	return [super needsDisplayForKey:key];
}


-(void)drawInContext:(CGContextRef)ctx {
	
	// Create the path
	CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
	CGFloat radius = MIN(center.x, center.y);
	
	CGContextBeginPath(ctx);
	CGContextMoveToPoint(ctx, center.x, center.y);
	
	CGPoint p1 = CGPointMake(center.x + radius * cosf(self.startAngle), center.y + radius * sinf(self.startAngle));
	CGContextAddLineToPoint(ctx, p1.x, p1.y);

	int clockwise = self.startAngle > self.endAngle;
	CGContextAddArc(ctx, center.x, center.y, radius, self.startAngle, self.endAngle, clockwise);

//	CGContextAddLineToPoint(ctx, center.x, center.y);

	CGContextClosePath(ctx);
	
	// Color it
	CGContextSetFillColorWithColor(ctx, self.fillColor.CGColor);
	CGContextSetStrokeColorWithColor(ctx, self.strokeColor.CGColor);
	CGContextSetLineWidth(ctx, self.strokeWidth);

	CGContextDrawPath(ctx, kCGPathFillStroke);
}
@end
