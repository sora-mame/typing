//
//  ViewController.m
//  typing
//
//  Created by 高山　育健 on 13/12/12.
//  Copyright (c) 2013年 University of kitakyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lbl_result;
@synthesize textfield_input;
@synthesize lbl_time;
@synthesize lbl_example;

NSDate *start_date;
BOOL timeflg=FALSE;

NSTimer *timer;

- (void)onTimer:(NSTimer*)timer {
    if(timeflg){
        NSDate *now = [NSDate date];
        self.lbl_time.text = [NSString stringWithFormat:@"%.2f",
                              [now timeIntervalSinceDate:start_date]];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.lbl_time.text = @"0.00";
    self.lbl_example.text = @"テキストボックスをタップ！";
    self.lbl_result.hidden = YES;
    timer = [NSTimer scheduledTimerWithTimeInterval:(0.01)
                                             target:self selector:@selector(onTimer:)
                                           userInfo:nil repeats:YES];
}

- (void)viewDidUnload
{
    [self setLbl_example:nil];
    [self setLbl_time:nil];
    [self setTextfield_input:nil];
    [self setLbl_result:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)OnBtn_Clear:(id)sender {
    timeflg = FALSE;
	self.lbl_time.text = @"0.00";
    self.lbl_example.text = @"テキストボックスをタップ！";
    self.textfield_input.text = nil;
    self.lbl_result.text = @"";
    score = 0;
}

int score;
int Q;

- (IBAction)Did_End_On_Exit:(id)sender {
    NSString *strExample = self.lbl_example.text;
    NSString *strInput = self.textfield_input.text;
    if ([strExample isEqualToString:strInput]) {
        // 例題と入力した文章が一致！
        self.textfield_input.text = nil;
        NSInteger Q = arc4random() % 26;
        score++;
        if (score != 5){
            if(Q == 0){
                self.lbl_example.text = @"America";
            }
            if(Q == 1){
                self.lbl_example.text = @"Brazil";
            }
            if(Q == 2){
                self.lbl_example.text = @"Canada";
            }
            if(Q == 3){
                self.lbl_example.text = @"Djibouti";
            }
            if(Q == 4){
                self.lbl_example.text = @"Equatorial Guinea";
            }
            if(Q == 5){
                self.lbl_example.text = @"Fiji";
            }
            if(Q == 6){
                self.lbl_example.text = @"Germany";
            }
            if(Q == 7){
                self.lbl_example.text = @"Honduras";
            }
            if(Q == 8){
                self.lbl_example.text = @"Iraq";
            }
            if(Q == 9){
                self.lbl_example.text = @"Jordan";
            }
            if(Q == 10){
                self.lbl_example.text = @"Kazakhstan";
            }
            if(Q == 11){
                self.lbl_example.text = @"Liechtenstein";
            }
            if(Q == 12){
                self.lbl_example.text = @"Mexico";
            }
            if(Q == 13){
                self.lbl_example.text = @"New Zealand";
            }
            if(Q == 14){
                self.lbl_example.text = @"Oman";
            }
            if(Q == 15){
                self.lbl_example.text = @"Philippines";
            }
            if(Q == 16){
                self.lbl_example.text = @"Qatar";
            }
            if(Q == 17){
                self.lbl_example.text = @"Russian Federation";
            }
            if(Q == 18){
                self.lbl_example.text = @"St. Vincent & the Grenadines";
            }
            if(Q == 19){
                self.lbl_example.text = @"Turkey";
            }
            if(Q == 20){
                self.lbl_example.text = @"Uzbekistan";
            }
            if(Q == 21){
                self.lbl_example.text = @"Viet Nam";
            }
            if(Q == 22){
                self.lbl_example.text = @"Western Sahara";
            }
            if(Q == 23){
                self.lbl_example.text = @"X Japan";
            }
            if(Q == 24){
                self.lbl_example.text = @"Yemen";
            }
            if(Q == 25){
                self.lbl_example.text = @"Zimbabwe";
            }
        }
        else {
            self.lbl_example.text = @"clear!!!";
        }
        if (score == 6){self.lbl_example.text = @"もうやめて";}
        
        self.lbl_result.hidden = NO;
        self.lbl_result.text = @"正解！";
        
        if(score == 5){
            timeflg = FALSE;
        }
    } else {
        // 入力ミス
        //　タイマーを止めない。
        self.lbl_result.hidden = NO;
        self.lbl_result.text = @"ミス！";
    }
}

- (IBAction)Editing_Did_Begin:(id)sender {
    self.lbl_result.hidden = YES;
    if (timeflg == FALSE){
        timeflg = TRUE;
        start_date = [NSDate date];
        
    }
    NSInteger Q = arc4random() % 3;
    if(Q == 0){
        self.lbl_example.text = @"America";
    }
    if(Q == 1){
        self.lbl_example.text = @"Brazil";
    }
    if(Q == 2){
        self.lbl_example.text = @"Canada";
    }
    if(Q == 3){
        self.lbl_example.text = @"Djibouti";
    }
    if(Q == 4){
        self.lbl_example.text = @"Equatorial Guinea";
    }
    if(Q == 5){
        self.lbl_example.text = @"Fiji";
    }
    if(Q == 6){
        self.lbl_example.text = @"Germany";
    }
    if(Q == 7){
        self.lbl_example.text = @"Honduras";
    }
    if(Q == 8){
        self.lbl_example.text = @"Iraq";
    }
    if(Q == 9){
        self.lbl_example.text = @"Jordan";
    }
    if(Q == 10){
        self.lbl_example.text = @"Kazakhstan";
    }
    if(Q == 11){
        self.lbl_example.text = @"Liechtenstein";
    }
    if(Q == 12){
        self.lbl_example.text = @"Mexico";
    }
    if(Q == 13){
        self.lbl_example.text = @"New Zealand";
    }
    if(Q == 14){
        self.lbl_example.text = @"Oman";
    }
    if(Q == 15){
        self.lbl_example.text = @"Philippines";
    }
    if(Q == 16){
        self.lbl_example.text = @"Qatar";
    }
    if(Q == 17){
        self.lbl_example.text = @"Russian Federation";
    }
    if(Q == 18){
        self.lbl_example.text = @"St. Vincent & the Grenadines";
    }
    if(Q == 19){
        self.lbl_example.text = @"Turkey";
    }
    if(Q == 20){
        self.lbl_example.text = @"Uzbekistan";
    }
    if(Q == 21){
        self.lbl_example.text = @"Viet Nam";
    }
    if(Q == 22){
        self.lbl_example.text = @"Western Sahara";
    }
    if(Q == 23){
        self.lbl_example.text = @"X Japan";
    }
    if(Q == 24){
        self.lbl_example.text = @"Yemen";
    }
    if(Q == 25){
        self.lbl_example.text = @"Zimbabwe";
    }
}



@end



