//
//  ViewController.h
//  Homework
//
//  Created by Leo Wang on 7/16/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionViewController : UIViewController

@property (nonatomic) IBOutlet UILabel *questionLabel;
@property (nonatomic) IBOutlet UILabel *numberLabel;
@property (nonatomic) IBOutlet UITextField *answerText;
@property (nonatomic) IBOutlet UILabel *timerLabel;
@property (nonatomic) IBOutlet UIButton *nextButton;

@property (nonatomic) NSString *question;

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic) int a;
@property (nonatomic) int b;
@property (nonatomic) int x;
@property (nonatomic) int answer;

@property (nonatomic) IBOutlet UIProgressView *progressView;
@property (nonatomic) IBOutlet NSTimer *timer;
@property (nonatomic) int totalQuestions;
@property (nonatomic) int totalCorrectAnswers;
@property (nonatomic) BOOL answerIsWrong;

@property (nonatomic) NSDate *startTime;

@end

