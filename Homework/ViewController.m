//
//  ViewController.m
//  Homework
//
//  Created by Leo Wang on 7/16/16.
//  Copyright © 2016 Big Nerd Ranch. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
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

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.currentQuestionIndex = 0;
    self.totalQuestions = 50;
    
    [self.nextButton setTitle:@"Start" forState:UIControlStateNormal];
    
    // Draw button boarder
    [[self.nextButton layer] setBorderWidth:2.0f];
    [[self.nextButton layer] setBorderColor:[UIColor blueColor].CGColor];
}

- (void)prepareNextQuestion {
    if (self.currentQuestionIndex == 0) {
        self.startTime = [NSDate date];
        
        // Start timer and progress bar
        self.timer = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                                    target: self
                                                    selector:@selector(onTick:)
                                                    userInfo:nil
                                                    repeats:YES];
        _progressView.progress = 0.0;
        self.totalCorrectAnswers = 0;
        self.answerIsWrong = NO;
    }
    
    if (self.currentQuestionIndex >= self.totalQuestions) {
        self.currentQuestionIndex = 0;
        _progressView.progress = 0.0;
        [self.timer invalidate];
        self.timer = nil;
        
        [self.nextButton setTitle:@"Excellent! Restart?" forState:UIControlStateNormal];
        self.questionLabel.text = [NSString stringWithFormat:@"Wrong: %@", [self toString:(self.totalQuestions - self.totalCorrectAnswers)]];
        self.answerText.text = @"";
        self.answer = 0;
        return;
    }
    
    [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
    
    int operation = [self getRandomNumberBetween:1 to:4];
    if (operation == 1) {
        self.a = [self getRandomNumberBetween:0 to:50];
        self.b = [self getRandomNumberBetween:1 to:50];
        int sum = self.a + self.b;
        self.answer = sum;
        self.questionLabel.text = [NSString stringWithFormat:@"%d %@ %d =", self.a, [NSString stringWithFormat:@"%C", 0x002B], self.b];
    } else if (operation == 2) { // -
        self.a = [self getRandomNumberBetween:0 to:50];
        self.b = [self getRandomNumberBetween:1 to:100];
        int sum = self.b + self.a;
        self.answer = self.a;
        self.questionLabel.text = [NSString stringWithFormat:@"%d %@ %d =", sum,  @"\u2212", self.b];
    } else if (operation == 3) { // multiplication11
        self.a = [self getRandomNumberBetween:1 to:45];
        self.b = [self getRandomNumberBetween:0 to:10];
        int result = self.a * self.b;
        self.answer = result;
        self.questionLabel.text = [NSString stringWithFormat:@"%d %@ %d =", self.a,  @"\u00D7", self.b];
    } else if (operation == 4) { // division
        self.a = [self getRandomNumberBetween:1 to:10];
        self.b = [self getRandomNumberBetween:1 to:10];
        int result = self.a * self.b;
        self.answer = self.b;
        self.questionLabel.text = [NSString stringWithFormat:@"%d %@ %d =", result, @"\u00F7", self.a];
    }
    
    NSLog(@"%d [%d] %d answer:%d progress:%f", self.a, operation, self.b, self.answer, self.progressView.progress);
    
    self.numberLabel.text = [self toString:self.currentQuestionIndex+1];
    self.progressView.progress = 1.0 * (self.currentQuestionIndex + 1) / self.totalQuestions;
    
    self.currentQuestionIndex++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showNextQuestion:(id)sender {
    
    int answered = [self toInt:self.answerText.text];
    int expected = self.answer;
    
    if (answered == expected) {
        if (self.answerIsWrong) {
            self.answerIsWrong = NO;
        } else {
            self.totalCorrectAnswers++;
        }
        self.answerText.text = @"";
        
        [self prepareNextQuestion];
        self.answerText.backgroundColor = [UIColor whiteColor];
    } else {
        self.answerText.text = @"";
        self.answerText.backgroundColor = [UIColor redColor];
        self.answerIsWrong = YES;
    }
}

- (int)toInt:(NSString*)in {
    return (int)in.integerValue;
}

- (NSString*)toString:(int)in {
    return [NSString stringWithFormat:@"%i", in];
}

-(int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}

-(void)onTick:(NSTimer*)timer
{
    NSTimeInterval timeInterval = [self.startTime timeIntervalSinceNow];
    self.timerLabel.text = [self stringFromTimeInterval:timeInterval];
}

- (NSString *)stringFromTimeInterval:(NSTimeInterval)interval {
    NSInteger ti = (NSInteger)interval;
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600);
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld", (long)hours, (long)minutes, (long)seconds];
}

- (IBAction)dismissKeyboard:(id)sender {
    [self.answerText resignFirstResponder];
}

@end
