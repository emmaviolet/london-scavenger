//
//  IntroductionViewController.m
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "IntroductionViewController.h"
#import "Clue0.h"

@interface IntroductionViewController ()

@end

@implementation IntroductionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)resetDefaults
{
    return TRUE;
}

- (Clue0*)model
{
    Clue0 *clue = [Clue0 new];
    clue.viewController = self;
    return clue;
}

@end
