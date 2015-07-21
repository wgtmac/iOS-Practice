//
//  ViewController.h
//  Matchismo
//
//  Created by Gang Wu on 7/17/15.
//  Copyright (c) 2015 Gang Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"

@interface ViewController : UIViewController

// abstract class
-(Deck *)createDeck;
-(void)updateUIForButton:(UIButton*)cardButton usingCard:(Card*)card;
-(NSUInteger)getMode;
@property (strong, nonatomic) CardMatchingGame *game;

@end

