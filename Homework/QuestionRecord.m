//
//  QuestionRecord.m
//  Homework
//
//  Created by Leo Wang on 7/19/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

#import "QuestionRecord.h"

@implementation QuestionRecord

- (QuestionRecord *)initWithQuestion:(NSString *)question time:(int)time {
    QuestionRecord *q = [[QuestionRecord alloc] init];
    [q setQuestion:question];
    [q setTime:time];
    return q;
}

- (void)setQuestion:(NSString *)question {
    _question = question;
}

- (NSString *)getQuestion {
    return _question;
}

- (void)setTime:(int)time {
    _time = time;
}

- (int)getTime {
    return _time;
}



@end
