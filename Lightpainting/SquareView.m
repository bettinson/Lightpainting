//
//  SquareView.m
//  Lightpainting
//
//  Created by Matt Bettinson on 2015-12-06.
//  Copyright © 2015 self. All rights reserved.
//

#import "SquareView.h"

@implementation SquareView

- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
}

@end
