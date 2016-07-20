//
//  QuestionRecord.h
//  Homework
//
//  Created by Leo Wang on 7/19/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionRecord : NSObject {
    NSString *_question;
    int _time;
    NSDate *_dateCreated;
}

- (QuestionRecord *)initWithQuestion:(NSString *)question time:(int)time;

- (void)setQuestion:(NSString *)question;
- (void)setTime:(int)time;

- (NSString *)getQuestion;
- (int)getTime;

@end
