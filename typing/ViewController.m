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
        NSInteger Q = arc4random() % 3;
        score++;
        if (score != 2){
        if(Q == 0){
            self.lbl_example.text = @"america";
        }
        if(Q == 1){
            self.lbl_example.text = @"bbb";
        }
        if(Q == 2){
            self.lbl_example.text = @"ccc";
        }
        }
        else{
            self.lbl_example.text = @"";
        }
        self.lbl_result.hidden = NO;
        self.lbl_result.text = @"正解！";
        
        if(score == 2){
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
    NSInteger Q = arc4random() % 50;
    if(Q == 0){
        self.lbl_example.text = @"america";
    }
    if(Q == 1){
        self.lbl_example.text = @"brazil";
    }
    if(Q == 2){
        self.lbl_example.text = @"canada";
    }
    if(Q == 2){
        self.lbl_example.text = @"";
    }
}



UIImage *gu_img;
UIImage *tyoki_img;
UIImage *pa_img;

/*- (void)dealloc
 {
 [super dealloc];
 [gu_img release];
 [tyoki_img release];
 [pa_img release];
 }*/

//スタート画面
- (void)viewDidLoad2
{
    [super viewDidLoad];
    //result.text = @"text";
    result.hidden = YES;
    //enemy.hidden = YES;
    again.hidden = YES;
    
    gu_img = [UIImage imageNamed:@"gu.png"];
    tyoki_img = [UIImage imageNamed:@"tyo.png"];
    pa_img = [UIImage imageNamed:@"pa.png"];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

int record;
int a;
//プレイアーがグーを押した時
- (IBAction)gu_down:(id)sender {
    a = 2;
    //janken.text = [NSString stringWithFormat:@"%d", a];
    gu.hidden = NO;
    tyoki.hidden = YES;
    pa.hidden = YES;
    //enemy.hidden = NO;
    result.hidden = NO;
    
    //対戦結果
    NSInteger Result = arc4random() % 3;
    if (Result == 0){
        //enemy.text = @"✊";
        [enemy_img setImage:gu_img];
        result.text = @"あいこで...";
        tyoki.hidden = NO;
        pa.hidden = NO;
        again.hidden = YES;
        [result setTextColor:[UIColor blackColor]];
    }
    else if (Result == 1){
        //enemy.text = @"✌";
        [enemy_img setImage:tyoki_img];
        result.text = @"You win!";
        again.hidden = NO;
        gu.enabled = NO;
        [result setTextColor:[UIColor redColor]];
        record++;
        if (record == 3){
            result.text = @"Great!";
            [result setTextColor:[UIColor greenColor]];
        }
        
        if (record == 5){
            result.text = @"Congratulations!";
            [result setTextColor:[UIColor greenColor]];
        }
        
    }
    else if (Result == 2){
        //enemy.text = @"✋";
        [enemy_img setImage:pa_img];
        result.text = @"You lose!";
        again.hidden = NO;
        gu.enabled = NO;
        [result setTextColor:[UIColor blueColor]];
        record = 0;
    }
}

//プレイヤ＝がチョキ
- (IBAction)tyoki_down:(id)sender {
    janken.text = @"じゃんけん...ぽん！";
    gu.hidden = YES;
    tyoki.hidden = NO;
    pa.hidden = YES;
    //enemy.hidden = NO;
    result.hidden = NO;
    
    NSInteger Result = arc4random() % 3;
    
    //対戦結果
    if (Result == 0){
        //enemy.text = @"✊";
        [enemy_img setImage:gu_img];
        result.text = @"You lose!";
        again.hidden = NO;
        tyoki.enabled = NO;
        [result setTextColor:[UIColor blueColor]];
        record = 0;
    }
    else if (Result == 1){
        //enemy.text = @"✌";
        [enemy_img setImage:tyoki_img];
        result.text = @"あいこで...";
        gu.hidden = NO;
        pa.hidden = NO;
        again.hidden = YES;
        [result setTextColor:[UIColor blackColor]];
    }
    else if (Result == 2){
        //enemy.text = @"✋";
        [enemy_img setImage:pa_img];
        result.text = @"You win!";
        again.hidden = NO;
        tyoki.enabled = NO;
        [result setTextColor:[UIColor redColor]];
        record++;
        if (record == 3){
            result.text = @"Great!";
            [result setTextColor:[UIColor greenColor]];
        }
        if (record == 5){
            result.text = @"Congratulations!";
            [result setTextColor:[UIColor greenColor]];
        }
    }
    
}

//プレイヤーがパー
- (IBAction)pa_down:(id)sender {
    janken.text = @"じゃんけん...ぽん！";
    gu.hidden = YES;
    tyoki.hidden = YES;
    pa.hidden = NO;
    //enemy.hidden = NO;
    result.hidden = NO;
    
    //対戦結果
    NSInteger Result = arc4random() % 3;
    if (Result == 0){
        //enemy.text = @"✊";
        [enemy_img setImage:gu_img];
        result.text = @"You win!";
        again.hidden = NO;
        pa.enabled = NO;
        [result setTextColor:[UIColor redColor]];
        record++;
        if (record == 3){
            result.text = @"Great!";
            [result setTextColor:[UIColor greenColor]];
        }
        if (record == 5){
            result.text = @"Congratulations!";
            [result setTextColor:[UIColor greenColor]];
        }
    }
    else if (Result == 1){
        //enemy.text = @"✌";
        [enemy_img setImage:tyoki_img];
        result.text = @"You lose!";
        again.hidden = NO;
        pa.enabled = NO;
        [result setTextColor:[UIColor blueColor]];
        record = 0;
    }
    else if (Result == 2){
        //enemy.text = @"✋";
        [enemy_img setImage:pa_img];
        result.text = @"あいこで...";
        gu.hidden = NO;
        tyoki.hidden = NO;
        again.hidden = YES;
        [result setTextColor:[UIColor blackColor]];
    }
    
}

- (IBAction)again_down:(id)sender {
    gu.hidden = NO;
    tyoki.hidden = NO;
    pa.hidden = NO;
    gu.enabled = YES;
    tyoki.enabled = YES;
    pa.enabled = YES;
    
    janken.text = @"じゃんけん...";
    //enemy.text = @"";
    [enemy_img setImage:nil];
    result.text = @"";
    again.hidden = YES;
    
}
@end



