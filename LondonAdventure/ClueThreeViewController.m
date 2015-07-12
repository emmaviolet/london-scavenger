//
//  ClueThreeViewController.m
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "ClueThreeViewController.h"
#import "MarginUILabel.h"
#import "Clue3.h"

@interface ClueThreeViewController ()
@property (nonatomic, retain) NSString *helpController;
@property (weak, nonatomic) IBOutlet MarginUILabel *titleLabel;

@end

@implementation ClueThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Clue3*)model
{
    Clue3 *clue = [Clue3 new];
    clue.viewController = self;
    return clue;
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
