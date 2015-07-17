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
#import "MarginUIImageView.h"
#import "ScaledImage.h"
#import "User.h"

@import GoogleMaps;

@interface AdventureViewController ()
@property (nonatomic, assign) int resetDefaults;

@property (strong, nonatomic) IBOutlet MarginUILabel *contentLabel;
@property (strong, nonatomic) IBOutlet MarginUILabel *helpLabel;

@property (strong, nonatomic) IBOutlet GMSMapView *mapView;
@property (strong, nonatomic) IBOutlet MarginUILabel *helpImageLabel;
@property (strong, nonatomic) IBOutlet UIImageView *helpImageView;

@property (nonatomic, strong) LocationTracker *locationManager;

@property (strong, nonatomic) IBOutlet MarginUILabel *timerLabel;

@property (nonatomic, strong) NSTimer *locationTracker;
@property (strong, nonatomic) NSTimer *countdownTimer;

@property (nonatomic, strong) UIAlertView *clueCompleteAlert;
@end

@implementation AdventureViewController

{
    GMSMapView *mapView_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self CurrentLocationIdentifier];
    [self setBackgroundImage];
    [self addTitleLabel];
    [self addContentLabel];
    [self addGoogleMap];
    [self addTimer];
    [self timeSinceStart];
    
    [self createHelpViews];
    
    [self setHoldDownOption];
    [self createSwipeActions];
    [self createCompletedUI];
    [self checkIfCompleted];
    
    [self setupCountdownTimer];
    [self setupLocationTracker];
    
    [self setupClueCompleteAlert];
    [self addTracker];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBackgroundImage
{
    UIImage *backgroundImage = [UIImage imageNamed:self.model.backgroundImageName];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    backgroundImageView.contentMode=UIViewContentModeScaleAspectFill;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (void)setHoldDownOption
{
    UILongPressGestureRecognizer *holdDown = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestures:)];
    holdDown.minimumPressDuration = 10.0f;
    holdDown.allowableMovement = 100.0f;
    [self.view addGestureRecognizer:holdDown];
}

- (void)addContentLabel
{
    self.contentLabel = [[MarginUILabel alloc]initWithFrame:CGRectMake(20, 114, 728, 400)];
    [self.contentLabel assignText:self.model.contentText];
    [self.view addSubview:self.contentLabel];
    [self.contentLabel setFontSize:20];
}

- (void)addGoogleMap
{
    CGRect viewRect = CGRectMake(20, 522, 728, 398);
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:self.model.locationLat
                                                            longitude:self.model.locationLng
                                                                 zoom:15];
    
    self.mapView = [GMSMapView mapWithFrame:viewRect camera:camera];
    self.mapView.myLocationEnabled = YES;
    self.mapView.myLocationEnabled = YES;
    self.mapView.layer.masksToBounds = YES;
    self.mapView.layer.cornerRadius = 8.0;
    self.mapView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.mapView.layer.borderWidth = 3.0;
    [self.view addSubview:self.mapView];
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(self.model.locationLat, self.model.locationLng);
    marker.title = self.model.titleText;
    marker.map = self.mapView;
}

- (void)createHelpViews
{
    self.helpLabel = [[MarginUILabel alloc]initWithFrame:CGRectMake(20, 114, 728, 400)];
    [self.helpLabel assignText:self.model.helpText];
    [self.helpLabel setFontSize:20];
    
    self.helpImageLabel = [[MarginUILabel alloc]initWithFrame:CGRectMake(20, 522, 728, 398)];
    [self.helpImageLabel setFontSize:20];
    
    self.helpImageView = [[UIImageView alloc]initWithFrame:CGRectMake(25, 527, 718, 388)];
    self.helpImageView.image = [UIImage imageNamed:self.model.helpImage];
    self.helpImageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)addTitleLabel
{
    self.titleLabel = [[MarginUILabel alloc]initWithFrame:CGRectMake(20, 20, 728, 86)];
    [self.titleLabel assignText:self.model.titleText];
    [self.view addSubview:self.titleLabel];
    [self.titleLabel setFontSize:60];
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
    if (selectedIndex < [self.tabBarController.viewControllers count] - 1)
    {
        AdventureViewController *currentView = [self.tabBarController.viewControllers objectAtIndex:selectedIndex];
        if ([User clueCompleted:currentView.model.clueNumber])
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

-(void)checkIfCompleted
{
    if ([User clueCompleted:self.model.clueNumber]) { [self completeClueUI]; }
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
    [self.titleLabel addSubview:self.checkmark];
    [self.view addSubview:self.eyeButton];
}

- (void)incompleteClueUI
{
    [self.checkmark removeFromSuperview];
    [self.eyeButton removeFromSuperview];
}

- (void)eyeTap:(UIButton *)sender
{
    if([self.helpLabel isDescendantOfView:self.view])
    {
        [self.helpLabel removeFromSuperview];
        [self.view addSubview:self.contentLabel];
        [self.helpImageLabel removeFromSuperview];
        [self.helpImageView removeFromSuperview];
        [self.view addSubview:self.mapView];
    }
    else
    {
        if (self.model.helpText && sender.state == UIGestureRecognizerStateBegan)
        {
            if ([[User cluesSeen] containsObject:self.model.clueNumber])
            { [self loadHelpView]; }
            else
            {
                ClueHelpAlertView *alertView = [[ClueHelpAlertView alloc] initWithClueCount:[User cluesSeenCount] andDelegateTo:self];
                [alertView show];
            }
        }
    }
}

- (void)activateNextTab
{
    NSUInteger nextIndex = [self.tabBarController selectedIndex] + 1;
    if (nextIndex <= [self.tabBarController.viewControllers count] - 1)
    { [[[[self.tabBarController tabBar] items] objectAtIndex:nextIndex] setEnabled:true]; }
}

- (void)handleLongPressGestures:(UILongPressGestureRecognizer *)sender
{
    [self clueCompleteProcess];
    [self completeClueUI];
    [self activateNextTab];
    [self.clueCompleteAlert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        { [User addClueToCluesSeen:self.model.clueNumber]; }
        [self loadHelpView];
    }
}

- (void)loadHelpView
{
    [self.contentLabel removeFromSuperview];
    [self.view addSubview:self.helpLabel];
    [self.mapView removeFromSuperview];
    [self.view insertSubview:self.helpImageLabel atIndex:1];
    [self.view insertSubview:self.helpImageView atIndex:2];
}

-(void)addTimer
{
    self.timerLabel = [[MarginUILabel alloc]initWithFrame:CGRectMake(20, 928, 180, 40)];
    [self.view addSubview:self.timerLabel];
    [self.timerLabel setFontSize:20];
}

-(void)setupCountdownTimer
{
    self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                           target:self
                                                         selector:@selector(timeSinceStart)
                                                         userInfo:nil
                                                          repeats:YES];
}

-(void)timeSinceStart
{
    NSDate *currentTime = [NSDate date];
    NSDate *startTime = [User startTime];
    
    if (startTime)
    {
        NSTimeInterval intervalNow = [currentTime timeIntervalSince1970];
        NSTimeInterval intervalStart = [startTime timeIntervalSince1970];
        NSInteger timeNow = round(intervalNow);
        NSInteger timeStart = round(intervalStart);
        NSInteger timePassed = timeNow - timeStart;
        NSInteger timeRemaining = 5400 - timePassed;
        
        if (timeRemaining < 0)
        {
            self.timerLabel.backgroundColor = [UIColor redColor];
            NSInteger timeOver = timeRemaining * -1;
            NSInteger minutesRemaining = timeOver / 60;
            NSInteger secondsRemaining = timeOver % 60;
            NSString *countdownString = [NSString stringWithFormat:@"-%02d:%02d mins", minutesRemaining, secondsRemaining];
            [self.timerLabel assignText:countdownString];
        }
        else
        {
            NSInteger minutesRemaining = timeRemaining / 60;
            NSInteger secondsRemaining = timeRemaining % 60;
            NSString *countdownString = [NSString stringWithFormat:@"%02d:%02d mins", minutesRemaining, secondsRemaining];
            [self.timerLabel assignText:countdownString];
        }
    }
    else
    {
        [self.timerLabel assignText:@"90:00 mins"];
    }
}

-(void)stopLocationTracker
{
    [self.locationTracker invalidate];
    self.locationTracker = nil;
    self.locationManager = nil;
}

-(void)setupLocationTracker
{
    self.locationTracker = [NSTimer scheduledTimerWithTimeInterval:3.0
                                                            target:self
                                                          selector:@selector(CurrentLocationIdentifier)
                                                          userInfo:nil
                                                           repeats:YES];
}

-(void)CurrentLocationIdentifier
{ self.locationManager = [[LocationTracker alloc] initWithViewController:self]; }

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self.locationManager stopUpdatingLocation];
    if (self.model.locationLat && self.model.locationLng && ![User clueCompleted:self.model.clueNumber])
    {
        if ([self.locationManager reachedLocationWithLatitude:self.model.locationLat andLongitude:self.model.locationLng])
        {
            [self clueCompleteProcess];
            [self completeClueUI];
            [self activateNextTab];
            [self.clueCompleteAlert show];
        }
    }
    [self updateDistanceLabel];
}

- (void)updateDistanceLabel
{
    NSString *distanceText = [NSString stringWithFormat:@"%d m", [self.locationManager distanceFromMe]];
    [self.distanceLabel assignText:distanceText];
}

- (void)clueCompleteProcess
{
    [User completeClue:self.model.clueNumber];
}

-(void)setupClueCompleteAlert
{
    self.clueCompleteAlert = [[UIAlertView alloc] initWithTitle:@"Made it!" message:self.model.clueCompleteText delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
}

-(void)addTracker
{
    self.distanceLabel = [[MarginUILabel alloc]initWithFrame:CGRectMake(568, 928, 180, 40)];
    [self.distanceLabel setFontSize:20];
}

@end
