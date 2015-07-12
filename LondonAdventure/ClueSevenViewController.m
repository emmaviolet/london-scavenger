//
//  ClueSevenViewController.m
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "ClueSevenViewController.h"
#import "MarginUILabel.h"
#import "Clue7.h"

@interface ClueSevenViewController ()

@end

@implementation ClueSevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Clue7*)model
{
    Clue7 *clue = [Clue7 new];
    clue.viewController = self;
    return clue;
}

@end
