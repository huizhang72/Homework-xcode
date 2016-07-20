//
//  QuizRecord.m
//  Homework
//
//  Created by Leo Wang on 7/19/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

#import "QuizRecord.h"

static NSMutableArray *quiz;

@implementation QuizRecord

- (void)setName:(NSString *)name {
    _name = name;
}

- (NSDate *)dateCreated {
    return _dateCreated;
}

- (NSString *)getName {
    return _name;
}

+(NSMutableArray *)sharedQuizRecord {
    if (!quiz) {
        quiz = [[NSMutableArray alloc] init];
    }
    return quiz;
}

+(void)addQuestion:(QuestionRecord *)question {
    int rows = [[QuizRecord sharedQuizRecord] count];
    NSLog(@"now %d", rows);
    [quiz addObject:question];
}

-(QuestionRecord *)getQuestion:(int)index {
    return [quiz objectAtIndex:index];
}

-(void)setQuestion:(int)index question:(QuestionRecord*)question {
    
}

@end