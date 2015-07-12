//
//  ClueThreeViewController.m
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "ClueThreeViewController.h"
#import "MarginUILabel.h"
#import "Clue3.h"

@interface ClueThreeViewController ()

@end

@implementation ClueThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Clue3*)model
{
    Clue3 *clue = [Clue3 new];
    clue.viewController = self;
    return clue;
}

@end
