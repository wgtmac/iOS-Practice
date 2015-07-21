//
//  ViewController.m
//  Matchismo
//
//  Created by Gang Wu on 7/17/15.
//  Copyright (c) 2015 Gang Wu. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

-(CardMatchingGame *)game{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                                            andMode:[self getMode]
                                                                          usingDeck:[self createDeck]];
    return _game;
}

-(Deck *)createDeck{
    return nil;
}

-(NSUInteger)getMode{
    return 0;
}

// Action: view => controller
// UIButton is needed
- (IBAction)touchCardButton:(UIButton *)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

-(void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [self updateUIForButton:cardButton usingCard:card];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}


- (IBAction)restartButtonTouched:(UIButton *)sender {
    self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                    andMode:[self getMode]
                                                  usingDeck:[self createDeck]];
    [self updateUI];
}


-(void)viewDidLoad{
    [super viewDidLoad];
    [self updateUI];
}

-(void)updateUIForButton:(UIButton *)cardButton usingCard:(Card *)card{
    
}


@end
