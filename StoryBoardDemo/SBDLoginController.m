//
//  SBDLoginController.m
//  StoryBoardDemo
//
//  Created by wwwins on 2014/1/14.
//  Copyright (c) 2014年 wwwins. All rights reserved.
//

#import "SBDLoginController.h"

@interface SBDLoginController ()

@property (nonatomic) BOOL isFirstShowIdHint;

@property (nonatomic) BOOL isFirstShowPwdHint;

@end

@implementation SBDLoginController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view.
  
  _isFirstShowIdHint = _isFirstShowPwdHint = NO;
  self.idTextField.delegate = self;
  self.pwdTextField.delegate = self;
  
  [_loginClickButton addTarget:self action:@selector(loginClicked:) forControlEvents:UIControlEventTouchUpInside];
  
}

- (void)loginClicked:(UIButton *)sender
{
  if ([self checkInput:_idTextField.text pwd:_pwdTextField.text]) {
    
    if ([_idTextField.text isEqualToString:@"first"])
    {
      [self performSegueWithIdentifier:@"firstLogin" sender:sender];
    }
    else
    {
      [self performSegueWithIdentifier:@"gotoHome" sender:sender];
    }
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

// check user input
- (BOOL)checkInput:(NSString *)userid pwd:(NSString *)pwd
{
  BOOL checkStatus = YES;
  
  @try {
    if(userid.length < 4) {
      checkStatus = NO;
      [NSException raise:NSLocalizedString(@"帳號或密碼錯誤！請重新輸入。", nil) format:NSLocalizedString(@"帳號或密碼錯誤！請重新輸入。", nil)];
    }
  }
  @catch (NSException *exception) {
    NSLog(@"login exception=%@", exception);
    
    UIAlertView *uialertview = [[UIAlertView alloc] initWithTitle:nil message:exception.reason delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [uialertview show];
  }
  
  return checkStatus;
}

// hidden keyboard
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
  NSLog(@"touchBegan:");
  [self.view endEditing:YES];
  [super touchesBegan:touches withEvent:event];
}

// clean init text
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
  NSLog(@"shouldBeginEditing");
  if(textField.tag==1 && !_isFirstShowIdHint) {
    self.idTextField.text = @"";
    _isFirstShowIdHint = YES;
  }
  if(textField.tag==2 && !_isFirstShowPwdHint) {
    self.pwdTextField.secureTextEntry = YES;
    self.pwdTextField.text = @"";
    _isFirstShowPwdHint = YES;
  }
  return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
  NSLog(@"shouldEndEditing");
  return YES;
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
  NSLog(@"shouldClear");
  return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
  NSLog(@"shouldReturn:%d",textField.tag);
  // jump to next textfield
  return YES;
}

// get user input
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
  NSLog(@"range:%d,string:%d,out:%@",range.length,string.length,string);
  return YES;
}
@end
