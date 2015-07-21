//
//  HistoryViewController.m
//  Matchismo
//
//  Created by Gang Wu on 7/20/15.
//  Copyright (c) 2015 Gang Wu. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation HistoryViewController

-(void)display:(NSArray *)historyArray {
    if (historyArray) {
        NSString *message = [historyArray componentsJoinedByString:@"\n"];
        [self.textView setText:message];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self display:[self historyArray]];
}

@end
