//
//  main.m
//  Threelow
//
//  Created by Steve on 2015-08-26.
//  Copyright (c) 2015 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "UserInput.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL running = YES;
        BOOL nextRollAllowed = YES;
        
        UserInput *userInput = [UserInput new];

        GameController *gameController = [GameController new];
        
        int count = 0;
        
        NSLog(@"rolls taken: %i", count);
        
        while (running) {
            
            if ([gameController.selectedDice count] == 5) {
//                running = NO;
                [gameController win];
                NSLog(@"Done!");
                exit(0);
            }
            
            if (count > 5) {
                NSLog(@"You have rolled more than 5 times! Now starting a new game");
                [gameController resetDice];
            }

            NSString *select = [userInput inputForPrompt:@"Please type select at least one dice by the position of the die (type quit if finished) or type roll to re-roll!\nReset holding dices enter reset: "];
            
            if ([select isEqualToString:@""]) {
                NSLog(@"Please choose a number or type roll first");
            }

            if ([select isEqualToString:@"win"]) {
                [gameController cheats];
            }
            
            if ([select isEqualToString:@"reset"]) {
                [gameController resetDice];
                count = 0;
                nextRollAllowed = YES;
            }
            
            if ([select isEqualToString:@"roll"]) {
                if (nextRollAllowed) {
                    [gameController rollDices];
                    count++;
                    NSLog(@"rolls taken: %i", count);
                    nextRollAllowed = NO;
                }else {
                    NSLog(@"You must select a die");
                }
                
                
            } else if ([select isEqualToString:@"1"]) {
                
                [gameController holdDie:1];
                [gameController showDices];
                nextRollAllowed = YES;
                
            } else if ([select isEqualToString:@"2"]) {
                [gameController holdDie:2];
                [gameController showDices];
                nextRollAllowed = YES;
                
            } else if ([select isEqualToString:@"3"]) {
                [gameController holdDie:3];
                [gameController showDices];
                nextRollAllowed = YES;
                
            } else if ([select isEqualToString:@"4"]) {
                [gameController holdDie:4];
                [gameController showDices];
                nextRollAllowed = YES;
                
            } else if ([select isEqualToString:@"5"]) {
                [gameController holdDie:5];
                [gameController showDices];
                nextRollAllowed = YES;
                
            } else if ([select isEqualToString:@"quit"]){
                exit(0);
            }
            
            NSInteger result = [gameController getCurrentScore];
            NSLog(@"current score is %ld", (long)result);
            
//            [gameController win];
        }
        
    }
    return 0;
}
