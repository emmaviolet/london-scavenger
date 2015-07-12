//
//  AdventureViewController.m
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "AdventureTabBarViewController.h"
#import "AdventureViewController.h"
#import "Clue.h"
#import "ClueHelpAlertView.h"
#import "LocationTracker.h"
#import "MarginUILabel.h"
#import "User.h"

@interface AdventureViewController ()
@property (nonatomic, strong) NSString *backgroundImageName;
@property (nonatomic, strong) NSString *helpController;
@property (nonatomic, assign) float locationLat;
@property (nonatomic, assign) float locationLng;

@property (nonatomic, assign) int resetDefaults;
@property (nonatomic, assign) int repeatingClue;

@property (nonatomic, assign) NSNumber *clueNumber;

@property (nonatomic, weak) MarginUILabel *titleLabel;
@property (nonatomic, strong) UIImageView *checkmark;
@property (nonatomic, strong) UIButton *eyeButton;

@property (nonatomic, strong) NSTimer *locationTracker;
@property (nonatomic, strong) LocationTracker *locationManager;

@property (strong, nonatomic) IBOutlet MarginUILabel *contentLabel;

@property (strong, nonatomic) NSString *contentText;

@property (strong, nonatomic) Clue *clueModel;

@end

@implementation AdventureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBackgroundImage];
    [self setHoldDownOption];
    [self createSwipeActions];
    [self createCompletedUI];
    [self checkIfCompleted];
    [self addContentLabel];
    [self setupLocationTracker];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBackgroundImage
{
    UIImage *backgroundImage = [UIImage imageNamed:self.backgroundImageName];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    backgroundImageView.contentMode=UIViewContentModeScaleAspectFill;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (void)setHoldDownOption
{
    UILongPressGestureRecognizer *holdDown = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestures:)];
    holdDown.minimumPressDuration = 1.0f;
    holdDown.allowableMovement = 100.0f;
    [self.view addGestureRecognizer:holdDown];
}

- (void)addContentLabel
{
    if (self.contentText)
    {
        NSString *str = self.contentText;
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    
        NSShadow *shadow = [[NSShadow alloc] init];
        [shadow setShadowColor:[UIColor lightGrayColor]];
        [shadow setShadowOffset:CGSizeMake(-1, -1)];
    
        [attributedString addAttribute:NSShadowAttributeName
                             value:shadow
                             range:NSMakeRange(0, [attributedString length])];
    
        self.contentLabel = [[MarginUILabel alloc]initWithFrame:CGRectMake(20, 114, 728, 400)];
    
        [self.contentLabel setAttributedText:attributedString];
    
        self.contentLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:self.contentLabel];
    
        self.contentLabel.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7f];
        self.contentLabel.opaque = YES;
        self.contentLabel.font = [UIFont systemFontOfSize:20];
    }
}

- (void)createSwipeActions
{
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tappedRightButton:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tappedLeftButton:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
}

- (IBAction)tappedRightButton:(id)sender
{
    NSUInteger selectedIndex = [self.tabBarController selectedIndex];
    if (selectedIndex < 7)
    {
        AdventureViewController *currentView = [self.tabBarController.viewControllers objectAtIndex:selectedIndex];
        if ([User clueCompleted:currentView.clueNumber])
        {
            [self.tabBarController setSelectedIndex:(selectedIndex + 1)];
        }
    }
}

- (IBAction)tappedLeftButton:(id)sender
{
    NSUInteger selectedIndex = [self.tabBarController selectedIndex];
    if (selectedIndex > 0)
    { [self.tabBarController setSelectedIndex:selectedIndex - 1]; }
}

- (UIViewController *)instantiateHelpController
{
    if (self.helpController)
    { return [self.storyboard instantiateViewControllerWithIdentifier:self.helpController]; }
    else { return nil; }
}

-(void)checkIfCompleted
{
    if ([User clueCompleted:self.clueNumber]) { [self completeClueUI]; }
    else { [self incompleteClueUI]; }
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
}

- (void)completeClueUI
{
    if (self.helpController)
    {
        [self.titleLabel addSubview:self.checkmark];
        [self.view addSubview:self.eyeButton];
    }
}

- (void)incompleteClueUI
{
    if (self.helpController)
    {
        [self.checkmark removeFromSuperview];
        [self.eyeButton removeFromSuperview];
    }
}

- (void)eyeTap:(UIButton *)sender
{
    if (self.helpController && sender.state == UIGestureRecognizerStateBegan)
    {
        if ([[User cluesSeen] containsObject:self.helpController])
        {
            self.repeatingClue = TRUE;
            ClueHelpAlertView *alertView = [[ClueHelpAlertView alloc] initWithClueRepeated];
            [alertView show];
        }
        else
        {
            self.repeatingClue = FALSE;
            ClueHelpAlertView *alertView = [[ClueHelpAlertView alloc] initWithClueCount:[User cluesSeenCount]];
            [alertView show];
        }
    }
}

- (void)activateNextTab
{
    NSUInteger nextIndex = [self.tabBarController selectedIndex] + 1;
    if (nextIndex <= 7)
    {
        [[[[self.tabBarController tabBar] items] objectAtIndex:nextIndex] setEnabled:true];
    }
}

- (void)handleLongPressGestures:(UILongPressGestureRecognizer *)sender
{
    if (self.resetDefaults && sender.state == UIGestureRecognizerStateBegan)
    {
        NSString *domainName = [[NSBundle mainBundle] bundleIdentifier];
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:domainName];
        [self.tabBarController viewDidLoad];
    }
    
    if (self.helpController && sender.state == UIGestureRecognizerStateBegan)
    {
        [self clueCompleteProcess];
    }
}

- (void)clueCompleteProcess
{
    [User completeClue:self.clueNumber];
    [self completeClueUI];
    [self activateNextTab];
    [self stopLocationTracker];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        if (!self.repeatingClue) { [User addClueToCluesSeen:self.helpController]; }
        [self presentViewController:self.instantiateHelpController animated:YES completion:nil];
    }
}

-(void)setupLocationTracker
{
    if (self.locationLat && self.locationLng && ![User clueCompleted:self.clueNumber])
    {
        self.locationTracker = [NSTimer scheduledTimerWithTimeInterval:10.0
                                target:self
                                selector:@selector(CurrentLocationIdentifier)
                                userInfo:nil
                                repeats:YES];
    }
    
}

-(void)stopLocationTracker
{
    [self.locationTracker invalidate];
    self.locationTracker = nil;
}

-(void)CurrentLocationIdentifier
{ self.locationManager = [[LocationTracker alloc] initWithViewController:self]; }

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self.locationManager stopUpdatingLocation];
    if ([self.locationManager reachedLocationWithLatitude:self.locationLat andLongitude:self.locationLng])
    { [self clueCompleteProcess]; }
}

@end
