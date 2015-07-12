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
#import "MarginUILabel.h"
#import "User.h"

@import GoogleMaps;

@interface AdventureViewController ()
@property (nonatomic, assign) int resetDefaults;

@property (nonatomic, strong) MarginUILabel *titleLabel;
@property (nonatomic, strong) UIImageView *checkmark;
@property (nonatomic, strong) UIButton *eyeButton;
@property (strong, nonatomic) IBOutlet MarginUILabel *contentLabel;
@property (strong, nonatomic) IBOutlet MarginUILabel *helpLabel;

@property (strong, nonatomic) IBOutlet GMSMapView *mapView;
@property (strong, nonatomic) IBOutlet MarginUIImageView *imageSubView;

@end

@implementation AdventureViewController

{
    GMSMapView *mapView_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBackgroundImage];
    [self addTitleLabel];
    [self addContentLabel];
    [self addGoogleMap];
    
    [self createHelpLabel];
    
    [self setHoldDownOption];
    [self createSwipeActions];
    [self createCompletedUI];
    [self checkIfCompleted];
    
    [self.model setupLocationTracker];
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
    holdDown.minimumPressDuration = 1.0f;
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
    CGRect viewRect = CGRectMake(20, 522, 728, 358);
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

- (void)createHelpLabel
{
    self.helpLabel = [[MarginUILabel alloc]initWithFrame:CGRectMake(20, 114, 728, 400)];
    [self.helpLabel assignText:self.model.helpText];
    [self.helpLabel setFontSize:20];
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
    if (selectedIndex < 7)
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
    }
    else
    {
        if (self.model.helpText && sender.state == UIGestureRecognizerStateBegan)
        {
            if ([[User cluesSeen] containsObject:self.model.clueNumber])
            {
                [self.contentLabel removeFromSuperview];
                [self.view addSubview:self.helpLabel];
            }
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
    if (nextIndex <= 7)
    { [[[[self.tabBarController tabBar] items] objectAtIndex:nextIndex] setEnabled:true]; }
}

- (void)handleLongPressGestures:(UILongPressGestureRecognizer *)sender
{
    if (self.resetDefaults && sender.state == UIGestureRecognizerStateBegan)
    {
        NSString *domainName = [[NSBundle mainBundle] bundleIdentifier];
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:domainName];
        [self.tabBarController viewDidLoad];
    }
    if (self.model.helpText && sender.state == UIGestureRecognizerStateBegan)
    {
        [self.model clueCompleteProcess];
        [self completeClueUI];
        [self activateNextTab];
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        { [User addClueToCluesSeen:self.model.clueNumber]; }
        [self.contentLabel removeFromSuperview];
        [self.view addSubview:self.helpLabel];
    }
}

@end
