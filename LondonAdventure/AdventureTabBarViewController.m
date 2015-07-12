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
    AdventureViewController *viewController0 = [self.storyboard instantiateViewControllerWithIdentifier:@"C0"];
    
    AdventureViewController *viewController1 = [[ClueOneViewController alloc] init];
    AdventureViewController *viewController2 = [[ClueTwoViewController alloc] init];
    AdventureViewController *viewController3 = [[ClueThreeViewController alloc] init];
    
    AdventureViewController *viewController4 = [[ClueFourViewController alloc] init];
    AdventureViewController *viewController5 = [[ClueFiveViewController alloc] init];
    AdventureViewController *viewController6 = [[ClueSixViewController alloc] init];
    AdventureViewController *viewController7 = [[ClueSevenViewController alloc] init];
    
    self.viewControllers = [ NSArray arrayWithObjects:viewController0, viewController1, viewController2, viewController3, viewController4, viewController5, viewController6, viewController7, nil];
}

-(void)setTabsByState
{
    for (AdventureViewController *viewController in self.viewControllers) {
        
        if (viewController.model.navBarImage)
        {
//            UIImage *selectedImage1 = [UIImage imageNamed:viewController.model.navBarImage];
//            UIImage *unselectedImage1 = [UIImage imageNamed:viewController.model.navBarImage];
//            
//            UITabBarItem *item1 = [self.tabBar.items objectAtIndex:[viewController.model.clueNumber integerValue]];

            [[self.tabBar.items objectAtIndex:[viewController.model.clueNumber integerValue]] setImage:[UIImage imageNamed:viewController.model.navBarImage]];
            
//            [item1 setFinishedSelectedImage:selectedImage1 withFinishedUnselectedImage:unselectedImage1];
        }
        
        NSInteger nextViewNumber = [viewController.model.clueNumber integerValue] + 1;
        
        if (nextViewNumber <= 7)
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
