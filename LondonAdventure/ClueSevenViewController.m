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
@property (nonatomic, strong) UIButton *plusButton;
@property (nonatomic, strong) UIAlertView *bonusClueAlert;
@end

@implementation ClueSevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBonusClueAlert];
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

- (void)createCompletedUI
{
    self.checkmark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"checkmark.png"]];
    self.checkmark.frame = CGRectMake(20, 20, 50, 50);
    
    self.eyeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.eyeButton.frame = CGRectMake(670, 35, 60, 60);
    UIImage *eyeImage = [UIImage imageNamed:@"eye.png"];
    [self.eyeButton setImage:eyeImage forState:UIControlStateNormal];
    [self.eyeButton addTarget:self action:@selector(eyeTap:) forControlEvents:UIControlEventTouchUpInside];
    
    self.plusButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.plusButton.frame = CGRectMake(620, 35, 60, 60);
    UIImage *plusImage = [UIImage imageNamed:@"plus.png"];
    [self.plusButton setImage:plusImage forState:UIControlStateNormal];
    [self.plusButton addTarget:self action:@selector(plusTap) forControlEvents:UIControlEventTouchUpInside];
}

- (void)completeClueUI
{
    [self.titleLabel addSubview:self.checkmark];
    [self.view addSubview:self.eyeButton];
    [self.view addSubview:self.plusButton];
}

- (void)incompleteClueUI
{
    [self.checkmark removeFromSuperview];
    [self.eyeButton removeFromSuperview];
    [self.plusButton removeFromSuperview];
}

- (void)plusTap
{
    [self.view addSubview:self.distanceLabel];
    [self.bonusClueAlert show];
}

-(void)setupBonusClueAlert
{
    self.bonusClueAlert = [[UIAlertView alloc] initWithTitle:@"Distance Tracker" message:@"A distance tracker has been added on the bottom right. It shows you how far you are from me :-)" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
}

@end
