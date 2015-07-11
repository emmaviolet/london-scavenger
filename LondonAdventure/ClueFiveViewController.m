//
//  ClueFiveViewController.m
//  LondonAdventure
//
//  Created by Emma Makinson on 08/07/2015.
//  Copyright © 2015 Emma Makinson. All rights reserved.
//

#import "ClueFiveViewController.h"
#import "MarginUILabel.h"

@interface ClueFiveViewController ()
@property (nonatomic, retain) NSString *helpController;
@property (weak, nonatomic) IBOutlet MarginUILabel *titleLabel;

@end

@implementation ClueFiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)helpController
{
    return [NSString stringWithFormat:@"H5"];
}

- (NSString *)backgroundImageName
{
    return @"map5full.png";
}

- (NSNumber *)clueNumber
{
    return [NSNumber numberWithInt:5];
}

- (float)locationLat
{
    return 51.5190898;
}

- (float)locationLng
{
    return -0.1691343;
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
