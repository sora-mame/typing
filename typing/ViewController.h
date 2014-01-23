//
//  ViewController.h
//  typing
//
//  Created by 高山　育健 on 13/12/12.
//  Copyright (c) 2013年 University of kitakyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{


    
    

}



@property (weak, nonatomic) IBOutlet UILabel *lbl_result;
@property (weak, nonatomic) IBOutlet UITextField *textfield_input;
@property (weak, nonatomic) IBOutlet UILabel *lbl_time;
@property (weak, nonatomic) IBOutlet UILabel *lbl_example;
 

- (IBAction)OnBtn_Clear:(id)sender;
- (IBAction)Did_End_On_Exit:(id)sender;
- (IBAction)Editing_Did_Begin:(id)sender;
-(void)onTimer:(NSTimer*)timer;







@end
