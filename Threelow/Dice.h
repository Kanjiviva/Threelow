//
//  Dice.h
//  Threelow
//
//  Created by Steve on 2015-08-26.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property (nonatomic) int currentValue;


- (void)getRandomValue;

@end
