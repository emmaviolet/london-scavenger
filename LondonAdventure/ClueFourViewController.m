//
//  ClueFourViewController.m
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "ClueFourViewController.h"
#import "MarginUILabel.h"
#import "Clue4.h"

@interface ClueFourViewController ()

@end

@implementation ClueFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Clue4*)model
{
    Clue4 *clue = [Clue4 new];
    clue.viewController = self;
    return clue;
}

@end
