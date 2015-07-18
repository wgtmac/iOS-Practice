//
//  ViewController.m
//  Matchismo
//
//  Created by Gang Wu on 7/17/15.
//  Copyright (c) 2015 Gang Wu. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
// weak because VIEW has a stron-g pointer to it already
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
// private
@property (nonatomic) int flipCount;

@property (nonatomic, strong) Deck* deck;

@end

@implementation ViewController

-(Deck *)deck{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

-(Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}


-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    [self.flipsLabel setText:[NSString stringWithFormat:@"Flips: %d", _flipCount]];
    NSLog(@"Flip count changed to %d", self.flipCount);
}

// Action: view => controller
// UIButton is needed
- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        
        self.flipCount++;
    } else {
        Card *card = [self.deck drawRandomCard];
        if (card){
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            [sender setTitle:[card contents] forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
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
