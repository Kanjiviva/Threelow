//
//  GameController.h
//  Threelow
//
//  Created by Steve on 2015-08-26.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property (strong, nonatomic) NSMutableArray *allDice;
@property (strong, nonatomic) NSMutableArray *selectedDice;
//@property (strong, nonatomic) NSDictionary *lowestScore;

- (void)holdDie:(NSInteger)selcetedDie;
- (void)instantiateCollections;
- (void)rollDices;
- (void)showDices;
- (void)resetDice;
- (NSInteger)getCurrentScore;
//- (void)lowestScore;
- (void)cheats;
- (void)win;

@end
