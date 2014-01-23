//
//  ViewController.h
//  typing
//
//  Created by 高山　育健 on 13/12/12.
//  Copyright (c) 2013年 University of kitakyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{


    
    __weak IBOutlet UILabel *janken;
    //__weak IBOutlet UILabel *enemy;
    __weak IBOutlet UILabel *result;
    __weak IBOutlet UIButton *gu;
    __weak IBOutlet UIButton *tyoki;
    __weak IBOutlet UIButton *pa;
    __weak IBOutlet UIButton *again;
    __weak IBOutlet UIImageView *enemy_img;

}



@property (weak, nonatomic) IBOutlet UILabel *lbl_result;
@property (weak, nonatomic) IBOutlet UITextField *textfield_input;
@property (weak, nonatomic) IBOutlet UILabel *lbl_time;
@property (weak, nonatomic) IBOutlet UILabel *lbl_example;
 
- (IBAction)gu_down:(id)sender;
- (IBAction)tyoki_down:(id)sender;
- (IBAction)pa_down:(id)sender;
- (IBAction)again_down:(id)sender;
- (IBAction)OnBtn_Clear:(id)sender;
- (IBAction)Did_End_On_Exit:(id)sender;
- (IBAction)Editing_Did_Begin:(id)sender;
-(void)onTimer:(NSTimer*)timer;







@end
