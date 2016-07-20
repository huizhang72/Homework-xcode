//
//  QuizRecord.h
//  Homework
//
//  Created by Leo Wang on 7/19/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QuestionRecord.h"
#import "QuizRecord.h"

@interface QuizRecord : NSObject {
    NSString *_name;
    NSDate *_dateCreated;
}

+(NSMutableArray *)sharedQuizRecord;

-(void)setQuestion:(int)index question:(QuestionRecord *)question;
+(void)addQuestion:(QuestionRecord *)question;
-(QuestionRecord *)getQuestion:(int)index;
-(void)removeAllQuestions;

@end