//
//  PieView.h
//  PieChart
//
//  Created by Pavan Podila on 2/21/12.
//  Copyright (c) 2012 Pixel-in-Gene. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieView : UIView

@property (nonatomic, strong) NSArray *sliceValues;

-(id)initWithSliceValues:(NSArray *)sliceValues;
@end
