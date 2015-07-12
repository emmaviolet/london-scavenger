//
//  ClueFiveViewController.m
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "ClueFiveViewController.h"
#import "MarginUILabel.h"
#import "Clue5.h"

@interface ClueFiveViewController ()

@end

@implementation ClueFiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Clue5*)model
{
    Clue5 *clue = [Clue5 new];
    clue.viewController = self;
    return clue;
}

@end
