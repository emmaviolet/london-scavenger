//
//  ClueSixViewController.m
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "ClueSixViewController.h"
#import "MarginUILabel.h"
#import "Clue6.h"

@interface ClueSixViewController ()

@end

@implementation ClueSixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Clue6*)model
{
    Clue6 *clue = [Clue6 new];
    clue.viewController = self;
    return clue;
}

@end
