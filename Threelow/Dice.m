//
//  Dice.m
//  Threelow
//
//  Created by Steve on 2015-08-26.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self getRandomValue];
    }
    return self;
}

- (void)getRandomValue {

    self.currentValue = arc4random()%6 + 1;
    
}

@end
