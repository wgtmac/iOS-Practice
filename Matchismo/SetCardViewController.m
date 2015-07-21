//
//  SetCardViewController.m
//  Matchismo
//
//  Created by Gang Wu on 7/20/15.
//  Copyright (c) 2015 Gang Wu. All rights reserved.
//

#import "SetCardViewController.h"
#import "HistoryViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardViewController

-(Deck *)createDeck{
    return [[SetCardDeck alloc] init];
}

-(NSUInteger)getMode{
    return 3;
}

-(void)updateUIForButton:(UIButton*)cardButton usingCard:(Card*)card{
    if ([card isKindOfClass:[SetCard class]]) {
        SetCard *setCard = (SetCard *)card;
        [cardButton setTitle:[self titleForCard:setCard] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:setCard] forState:UIControlStateNormal];
        [cardButton setTitleColor:[self colorForCard:setCard] forState:UIControlStateNormal];
        [cardButton setAlpha:[self shadingForCard:setCard]];
    }
   
}

-(CGFloat)shadingForCard: (SetCard *)card {
    if (card.isChosen){
        if ([card.shading isEqualToString:@"Solid"]){
            return 1.0;
        } else if([card.shading isEqualToString:@"Striped"]){
            return 0.6;
        } else if([card.shading isEqualToString:@"Open"]){
            return 0.3;
        }
    }
    return 1.0;
}

-(UIColor *)colorForCard: (SetCard *)card {
    if ([card.color isEqualToString:@"Red"]){
        return [UIColor redColor];
    } else if([card.color isEqualToString:@"Green"]){
        return [UIColor greenColor];
    } else if([card.color isEqualToString:@"Purple"]){
        return[UIColor purpleColor];
    }
    return nil;
}

- (NSString *)titleForCard: (SetCard *)card {
    if (card.isChosen){
        NSMutableString *str = [[NSMutableString alloc] init];
        for (int i = 0; i < card.number; ++i) {
            [str appendString:card.symbol];
        }
        return str;
    }
    return @"";
}

-(UIImage *)backgroundImageForCard:(SetCard *)card {
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SetCardSegue"]) {
        if ([segue.destinationViewController isKindOfClass:[HistoryViewController class]]) {
            HistoryViewController *hvc = (HistoryViewController *)segue.destinationViewController;
            hvc.historyArray = self.game.history;
        }
    }
}

@end
