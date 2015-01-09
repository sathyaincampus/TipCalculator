//
//  sathyaViewController.m
//  TipCalculator
//
//  Created by Sathya Srinivasan on 9/11/14.
//  Copyright (c) 2014 Saturday. All rights reserved.
//

#import "sathyaViewController.h"

@interface sathyaViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountTextLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageSegmentControl;
@property (weak, nonatomic) IBOutlet UIButton *calculateTipButton;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountTextLabel;
@end

@implementation sathyaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.billAmountTextField.text = @"";
    [self calculateTipAndUpdateInterface];
}

- (IBAction)didTapBackground:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}


- (IBAction)didTapCalculateButton:(UIButton *)sender {
    [self calculateTipAndUpdateInterface];
    [self.view endEditing:YES];
}

- (void) calculateTipAndUpdateInterface{
    double billAmount = self.billAmountTextField.text.doubleValue;
    int selectedSegmentIndex = (int)self.tipPercentageSegmentControl.selectedSegmentIndex;
    double tipPercentage = [self.tipPercentageSegmentControl titleForSegmentAtIndex:selectedSegmentIndex].doubleValue;
    
    //do some math
    double tipAmount = billAmount * (tipPercentage / 100);
    double totalAmount = tipAmount + billAmount;
    
    //updating the UI
    self.tipAmountTextLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalAmountTextLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
