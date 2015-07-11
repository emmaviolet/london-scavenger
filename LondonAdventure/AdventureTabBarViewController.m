//
//  AdventureTabBarViewController.m
//  LondonAdventure
//
//  Created by Emma Makinson on 09/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "AdventureTabBarViewController.h"
#import "AdventureViewController.h"

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
    AdventureViewController *viewController1 = [self.storyboard instantiateViewControllerWithIdentifier:@"C1"];
    AdventureViewController *viewController2 = [self.storyboard instantiateViewControllerWithIdentifier:@"C2"];
    AdventureViewController *viewController3 = [self.storyboard instantiateViewControllerWithIdentifier:@"C3"];
    AdventureViewController *viewController4 = [self.storyboard instantiateViewControllerWithIdentifier:@"C4"];
    AdventureViewController *viewController5 = [self.storyboard instantiateViewControllerWithIdentifier:@"C5"];
    AdventureViewController *viewController6 = [self.storyboard instantiateViewControllerWithIdentifier:@"C6"];
    AdventureViewController *viewController7 = [self.storyboard instantiateViewControllerWithIdentifier:@"C7"];
    
    self.viewControllers = [ NSArray arrayWithObjects:viewController0, viewController1, viewController2, viewController3, viewController4, viewController5, viewController6, viewController7, nil];
}

-(void)setTabsByState
{
    for (AdventureViewController *viewController in self.viewControllers) {
        
        NSInteger nextViewNumber = [[viewController clueNumber] integerValue] + 1;
        
        if (nextViewNumber <= 7)
        {
            if (viewController.clueComplete)
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
