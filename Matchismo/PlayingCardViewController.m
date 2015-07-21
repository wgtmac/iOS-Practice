//
//  PlayingCardViewController.m
//  Matchismo
//
//  Created by Gang Wu on 7/20/15.
//  Copyright (c) 2015 Gang Wu. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "HistoryViewController.h"

@implementation PlayingCardViewController

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

-(NSUInteger)getMode{
    return 2;
}

-(void)updateUIForButton:(UIButton*)cardButton usingCard:(Card*)card{
    [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
    [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
}

-(UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (NSString *)titleForCard: (Card *)card {
    return card.isChosen ? card.contents : @"";
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"PlayingCardSegue"]) {
        if ([segue.destinationViewController isKindOfClass:[HistoryViewController class]]) {
            HistoryViewController *hvc = (HistoryViewController *)segue.destinationViewController;
            hvc.historyArray = self.game.history;
        }
    }
}

@end
