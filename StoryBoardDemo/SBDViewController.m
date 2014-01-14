//
//  SBDViewController.m
//  StoryBoardDemo
//
//  Created by wwwins on 13/10/28.
//  Copyright (c) 2013年 wwwins. All rights reserved.
//

#import "SBDViewController.h"

@interface SBDViewController ()

@end

@implementation SBDViewController

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
    NSLog(@"output:%@", self.dataString);
    _textField.text = self.dataString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
