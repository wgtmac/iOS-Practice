//
//  ViewController.m
//  Matchismo
//
//  Created by Gang Wu on 7/17/15.
//  Copyright (c) 2015 Gang Wu. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

-(CardMatchingGame *)game{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                usingDeck:[self createDeck]];
    return _game;
}

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
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
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (NSString *)titleForCard: (Card *)card {
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
