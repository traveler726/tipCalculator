//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Jennifer Beck on 1/15/17.
//  Copyright © 2017 JenniferBeck. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tipControl.selectedSegmentIndex = [self loadTipIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(int) loadTipIndex {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"tipCalc_tipIndex"];
    return intValue;
}

-(void) storeTipIndex {
    NSInteger tipIndex = self.tipControl.selectedSegmentIndex;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:tipIndex forKey:@"tipCalc_tipIndex"];
    [defaults synchronize];
}

- (IBAction)onTipPercentValueChange:(UISegmentedControl *)sender {
    [self storeTipIndex];
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
