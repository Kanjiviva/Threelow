//
//  GameController.m
//  Threelow
//
//  Created by Steve on 2015-08-26.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import "GameController.h"
#import "UserInput.h"
#import "Dice.h"

@interface GameController ()

@property (nonatomic, strong) Dice *dice1;
@property (nonatomic, strong) Dice *dice2;
@property (nonatomic, strong) Dice *dice3;
@property (nonatomic, strong) Dice *dice4;
@property (nonatomic, strong) Dice *dice5;

@end

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self instantiateCollections];
    }
    return self;
}

- (void)instantiateCollections {
    self.allDice = [NSMutableArray new];
    self.selectedDice = [NSMutableArray new];
    
    self.dice1 = [[Dice alloc] init];
    NSLog(@"%i", self.dice1.currentValue);
    
    self.dice2 = [[Dice alloc] init];
    NSLog(@"%i", self.dice2.currentValue);
    
    self.dice3 = [[Dice alloc] init];
    NSLog(@"%i", self.dice3.currentValue);
    
    self.dice4 = [[Dice alloc] init];
    NSLog(@"%i", self.dice4.currentValue);
    
    self.dice5 = [[Dice alloc] init];
    NSLog(@"%i", self.dice5.currentValue);
    
    [self.allDice addObject:self.dice1];
    [self.allDice addObject:self.dice2];
    [self.allDice addObject:self.dice3];
    [self.allDice addObject:self.dice4];
    [self.allDice addObject:self.dice5];
    
}

- (void)holdDie:(NSInteger)selcetedDie {
    Dice *dice = self.allDice[selcetedDie-1];
    if ([self.selectedDice containsObject:dice]) {
        [self.selectedDice removeObject:dice];
    } else {
        [self.selectedDice addObject:dice];
    }

    
}

- (NSInteger)getCurrentScore {
    int result = 0;
    for (Dice *diceScore in self.selectedDice) {
        if (diceScore.currentValue != 3) {
            result += diceScore.currentValue;
        }
    }
    return result;
}

- (void)showDices {
    for (Dice *dice in self.selectedDice) {
        NSLog(@"holding dice %i", dice.currentValue);
    }
}

- (void)rollDices {
    for (Dice *dice in self.allDice) {
        if (![self.selectedDice containsObject:dice]) {
            [dice getRandomValue];
        }
        
        
        NSLog(@"%i", dice.currentValue);;
    }
    
}

- (void)resetDice {
    [self.selectedDice removeAllObjects];
}

- (void)cheats {
    [self.selectedDice addObject:self.dice1];
    [self.selectedDice addObject:self.dice2];
    [self.selectedDice addObject:self.dice3];
    [self.selectedDice addObject:self.dice4];
    [self.selectedDice addObject:self.dice5];
    
    self.dice1.currentValue = 3;
    self.dice2.currentValue = 3;
    self.dice3.currentValue = 3;
    self.dice4.currentValue = 3;
    self.dice5.currentValue = 3;
    
    
}

-(void)win {
    if (self.dice1.currentValue == 3 && self.dice2.currentValue == 3 && self.dice3.currentValue == 3 && self.dice4.currentValue == 3 && self.dice5.currentValue == 3) {
        NSLog(@"You Win!");
    }
    
    [self resetDice];
    
}

@end
