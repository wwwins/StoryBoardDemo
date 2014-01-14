//
//  SBDLoginController.h
//  StoryBoardDemo
//
//  Created by wwwins on 2014/1/14.
//  Copyright (c) 2014年 wwwins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBDLoginController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *loginClickButton;
@property (weak, nonatomic) IBOutlet UITextField *idTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;

@end
