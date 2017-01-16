//
//  ViewController.m
//  tipCalculator
//
//  Created by Jennifer Beck on 1/15/17.
//  Copyright © 2017 JenniferBeck. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculater";
    // Don't need to do the work here anymore as the viewWillAppear takes care of it.
    // [self doTheWork];
}

/**
 Store both the bill amount and tip percentage into user defaults.
 */
- (void) storeInfoToDefault {
    NSInteger tipIndex = self.tipControl.selectedSegmentIndex;
    float billAmount   = [self.billTextField.text floatValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:tipIndex forKey:@"tipCalc_tipIndex"];
    [defaults setFloat:billAmount forKey:@"tipCalc_billAmount"];
    [defaults synchronize];
}

-(void) loadInfoFromDefault {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.tipControl.selectedSegmentIndex = [defaults integerForKey:@"tipCalc_tipIndex"];
    self.billTextField.text = [NSString stringWithFormat:@"%.0f", [defaults floatForKey:@"tipCalc_billAmount"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 When a tap happens in the view 

 @param sender <#sender description#>
 */
- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self doTheWork];
}

/**
 When the tip percentage value changes 
 make sure you do the work.

 @param sender <#sender description#>
 */
- (IBAction)onValueChanged:(UISegmentedControl *)sender {
    [self doTheWork];
}

/**
 The work includes the following:
 1) close down the number pad
 2) re-calculate the bill/tip/total
 3) store the tip % and bill amount into user defaults.
 */
- (void) doTheWork {
    [self.view endEditing:YES];
    [self updateValues];
    [self storeInfoToDefault];
}

- (void)updateValues {
    // Get the bill amount
    float billAmount = [self.billTextField.text floatValue];

    // Get the % to tip
    NSArray *tipValues = @[@(0.15), @(0.20), @(0.25)];
    float   tipPercent = [tipValues[self.tipControl.selectedSegmentIndex] floatValue];

    // Calculate the tip and total amounts
    float   tipAmount = billAmount * tipPercent;
    float   totalAmount = billAmount + tipAmount;

    // Update the Tip Amount and Total
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
    
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    [self loadInfoFromDefault];
    [self doTheWork];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}
@end
