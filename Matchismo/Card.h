//
//  Card.h
//  Matchismo
//
//  Created by Gang Wu on 7/17/15.
//  Copyright (c) 2015 Gang Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen)  BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

//-(int)match:(Card *)card;
-(int)match:(NSArray *)otherCards;


@end
