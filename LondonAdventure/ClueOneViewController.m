//
//  ClueOneViewController.m
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "ClueOneViewController.h"
#import "MarginUILabel.h"
#import "Clue1.h"

@interface ClueOneViewController ()
@property (nonatomic, retain) NSString *helpController;
//@property (weak, nonatomic) IBOutlet MarginUILabel *titleLabel;

@end

@implementation ClueOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Clue1*)model
{
    Clue1 *clue = [Clue1 new];
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
