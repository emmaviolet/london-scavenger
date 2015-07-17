//
//  AdventureTabBarViewController.m
//  LondonAdventure
//
//  Created by Emma Makinson on 09/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "AdventureTabBarViewController.h"
#import "AdventureViewController.h"
#import "ClueOneViewController.h"
#import "ClueTwoViewController.h"
#import "ClueThreeViewController.h"
#import "ClueFourViewController.h"
#import "ClueFiveViewController.h"
#import "ClueSixViewController.h"
#import "ClueSevenViewController.h"
#import "User.h"

@interface AdventureTabBarViewController ()
@property AdventureViewController *viewController0;
@property AdventureViewController *viewController1;
@property AdventureViewController *viewController2;
@property AdventureViewController *viewController3;
@property AdventureViewController *viewController4;
@property AdventureViewController *viewController5;
@property AdventureViewController *viewController6;
@property AdventureViewController *viewController7;
@end

@implementation AdventureTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self instantiateViewControllers];
    [self setTabsByState];
    // Do any additional setup after loading the view.
}

-(void)instantiateViewControllers
{
    self.viewController0 = [self.storyboard instantiateViewControllerWithIdentifier:@"C0"];
    
    self.viewController1 = [[ClueOneViewController alloc] init];
    self.viewController2 = [[ClueTwoViewController alloc] init];
    self.viewController3 = [[ClueThreeViewController alloc] init];
    
    self.viewController4 = [[ClueFourViewController alloc] init];
    self.viewController5 = [[ClueFiveViewController alloc] init];
    self.viewController6 = [[ClueSixViewController alloc] init];
    self.viewController7 = [[ClueSevenViewController alloc] init];
    
    if ([User bonusClueActive])
    {
        self.viewControllers = [ NSArray arrayWithObjects:self.viewController0, self.viewController1, self.viewController2, self.viewController3, self.viewController4, self.viewController5, self.viewController6, self.viewController7, nil];
    }
    else
    {
        self.viewControllers = [ NSArray arrayWithObjects:self.viewController0, self.viewController1, self.viewController2, self.viewController3, self.viewController4, self.viewController5, self.viewController6, nil];
    }
    
}

-(void)setTabsByState
{
    for (AdventureViewController *viewController in self.viewControllers) {
        
        if (viewController.model.navBarImage)
        {
            UIImage *image = [UIImage imageNamed:viewController.model.navBarImage];
            UIImage *tempImage = nil;
            CGSize targetSize = CGSizeMake(40,40);
            UIGraphicsBeginImageContext(targetSize);
            
            CGRect thumbnailRect = CGRectMake(0.0, 0.0, targetSize.width, targetSize.height);
            [image drawInRect:thumbnailRect];
            
            tempImage = UIGraphicsGetImageFromCurrentImageContext();
            
            [[self.tabBar.items objectAtIndex:[viewController.model.clueNumber integerValue]] setImage:tempImage];
            UITabBarItem *tabBarItem = [self.tabBar.items objectAtIndex:[viewController.model.clueNumber integerValue]];
            tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -7, 0);
        }
        
        NSInteger nextViewNumber = [viewController.model.clueNumber integerValue] + 1;
        
        if (nextViewNumber <= [self.viewControllers count] - 1)
        {
            if ([User clueCompleted:viewController.model.clueNumber])
            { [[self.tabBar.items objectAtIndex:nextViewNumber] setEnabled:true]; }
            else
            { [[self.tabBar.items objectAtIndex:nextViewNumber] setEnabled:false]; }
        }
    }
}

-(void)setSelectedIndex:(NSUInteger)selectedIndex
{
    AdventureViewController *view = [self.viewControllers objectAtIndex:selectedIndex];
    [view checkIfCompleted];
    [super setSelectedIndex:selectedIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
