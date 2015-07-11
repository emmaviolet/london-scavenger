//
//  AdventureViewController.m
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "AdventureViewController.h"
#import "AdventureTabBarViewController.h"
#import "MarginUILabel.h"

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
@property (strong, nonatomic) IBOutlet MarginUILabel *contentLabel;

@property (strong, nonatomic) NSString *contentText;

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
        if (currentView.clueComplete)
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

- (BOOL)clueComplete
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults arrayForKey:@"cluesComplete"])
    {
        NSArray *completeCluesArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:0], nil];
        [defaults setObject:completeCluesArray forKey:@"cluesComplete"];
    }

    NSArray *cluesComplete = [defaults arrayForKey:@"cluesComplete"];
    NSMutableArray *completeClues = [NSMutableArray arrayWithArray:cluesComplete];
    return [completeClues containsObject:self.clueNumber];
}

-(void)checkIfCompleted
{
    if ([self clueComplete]) { [self completeClueUI]; }
    else { [self incompleteClueUI]; }
}

- (void)setClueCompleted
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults arrayForKey:@"cluesComplete"])
    {
        NSArray *completeCluesArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:0], nil];
        [defaults setObject:completeCluesArray forKey:@"cluesComplete"];
    }
    
    NSArray *cluesComplete = [defaults arrayForKey:@"cluesComplete"];
    NSMutableArray *newCluesComplete = [NSMutableArray arrayWithArray:cluesComplete];
    
    [newCluesComplete addObject:self.clueNumber];
    NSArray *cluesCompleteTwo = [newCluesComplete copy];
    
    [defaults setObject:cluesCompleteTwo forKey:@"cluesComplete"];
    [defaults synchronize];
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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger cluesSeenCount = [defaults integerForKey:@"cluesSeenCount"];
    NSArray *cluesSeen = [defaults arrayForKey:@"cluesSeen"];
    
    BOOL clueAlreadySeen = [cluesSeen containsObject:self.helpController];
    
    if (self.helpController && sender.state == UIGestureRecognizerStateBegan)
    {
        if (clueAlreadySeen)
        {
            self.repeatingClue = TRUE;
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Show Clue" message:@"You have already seen this clue, and may see it as many times as you like. Would you like to see it again?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
            [alertView show];
        }
        else
        {
            self.repeatingClue = FALSE;
            if (cluesSeenCount == 0)
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Show Clue" message:@"Are you sure you would like to see this clue? You will only be able to see two." delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
                [alertView show];
            }
            if (cluesSeenCount == 1)
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Show Clue" message:@"Are you sure you would like to see this clue? You can only see one more." delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
                [alertView show];
            }
            if (cluesSeenCount >= 2)
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Show Clue" message:@"You have already seen two clues. I won't let you see any more!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
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
    [self setClueCompleted];
    [self completeClueUI];
    [self activateNextTab];
    [self stopLocationTracker];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger cluesSeenCount = [defaults integerForKey:@"cluesSeenCount"];
    NSInteger newCluesSeenCount = cluesSeenCount + 1;
    NSArray *cluesSeen = [defaults arrayForKey:@"cluesSeen"];
    NSMutableArray *newCluesSeen = [NSMutableArray arrayWithArray:cluesSeen];

    if (buttonIndex == 1)
    {
        if (!self.repeatingClue)
        {
            [newCluesSeen addObject:self.helpController];
            NSArray *cluesSeen = [newCluesSeen copy];
            
            [defaults setObject:cluesSeen forKey:@"cluesSeen"];
            [defaults setInteger:newCluesSeenCount forKey:@"cluesSeenCount"];
            [defaults synchronize];
        }
        [self presentViewController:self.instantiateHelpController animated:YES completion:nil];
    }
}

-(void)setupLocationTracker
{
    if (self.locationLat && self.locationLng && !self.clueComplete)
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
{
    locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [locationManager stopUpdatingLocation];
    CLLocation *location = [locationManager location];
     {
         float longitude = location.coordinate.longitude;
         float latitude = location.coordinate.latitude;
         
         float lngDistance = fabsf(longitude - self.locationLng);
         float latDistance = fabsf(latitude - self.locationLat);
         
         float allowableDifference = 0.0005;
         
         if (latDistance < allowableDifference && lngDistance < allowableDifference)
         {
             [self clueCompleteProcess];
         }
     }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
