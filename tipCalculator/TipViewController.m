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
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}
- (IBAction)onValueChanged:(UISegmentedControl *)sender {
    [self updateValues];
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

@end
