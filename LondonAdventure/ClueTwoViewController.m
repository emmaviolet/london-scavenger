//
//  ClueTwoViewController.m
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "ClueTwoViewController.h"
#import "MarginUILabel.h"
#import "Clue2.h"

@interface ClueTwoViewController ()

@end

@implementation ClueTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Clue2*)model
{
    Clue2 *clue = [Clue2 new];
    clue.viewController = self;
    return clue;
}

@end
