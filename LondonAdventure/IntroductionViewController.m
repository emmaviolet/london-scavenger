//
//  IntroductionViewController.m
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "IntroductionViewController.h"
#import "Clue0.h"
#import "User.h"

@interface IntroductionViewController ()
@property (nonatomic, strong) UIButton *getStartedButton;
@end

@implementation IntroductionViewController

- (void)viewDidLoad {
    [self insertGetStarted];
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

- (void)insertGetStarted
{
    self.getStartedButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.getStartedButton addTarget:self
               action:@selector(getStarted)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.getStartedButton setTitle:@"Get Started" forState:UIControlStateNormal];
    [self.getStartedButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.getStartedButton.frame = CGRectMake(320, 522, 128, 40);
    self.getStartedButton.backgroundColor = [UIColor redColor];
    self.getStartedButton.titleLabel.font = [UIFont systemFontOfSize:20];
    self.getStartedButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.getStartedButton.layer.borderWidth = 3.0;
    self.getStartedButton.layer.masksToBounds = YES;
    self.getStartedButton.layer.cornerRadius = 8.0;
    
    [self.view addSubview:self.getStartedButton];
}

- (void)getStarted
{
    [User completeClue:self.model.clueNumber];
    [self activateNextTab];
    [self.getStartedButton removeFromSuperview];
    [self startTimer];
    [self presentFirstClue];
}

- (void)activateNextTab
{
    [[[[self.tabBarController tabBar] items] objectAtIndex:1] setEnabled:true];
}

- (void)presentFirstClue
{
    [self.tabBarController setSelectedIndex:1];
}

- (void)startTimer
{
    NSDate *startTime = [NSDate date];
    [User addStartTime:startTime];
}

- (void)handleLongPressGestures:(UILongPressGestureRecognizer *)sender
{
    NSString *domainName = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:domainName];
    for (AdventureViewController *viewController in self.tabBarController.viewControllers)
    { [viewController stopLocationTracker]; }
    
    [self.tabBarController viewDidLoad];
}

- (void)completeClueUI
{
    [self.getStartedButton removeFromSuperview];
}

- (void)incompleteClueUI
{
    [self.view addSubview:self.getStartedButton];
}

- (void)addGoogleMap {}
- (void)createHelpViews {}
- (void)loadHelpView {}
- (void)setupClueCompleteAlert {}

@end
