//
//  ViewController.m
//  MediTimer
//
//  Created by Jacob Balthazor on 12/14/12.
//  Copyright (c) 2012 Jacob Balthazor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)startResetPressed:(id)sender{
    if (!insession) {
        [buttons setHidden:YES];
        [startResetButton setHidden:YES];
        startTime = CACurrentMediaTime();
        insession = YES;
        [stopButton setHidden:NO];
        [continueButton setHidden:NO];
    }
    else{
        avg = 0;
        trialCount = 0;
        insession = NO;
        [stopButton setHidden:NO];
        [self updateLabels];
        [continueButton setHidden:YES];
    }
}

-(IBAction)continuePressed:(id)sender{
    [buttons setHidden:YES];
    [startResetButton setHidden:YES];
    startTime = CACurrentMediaTime();
    insession = YES;
    [stopButton setHidden:NO];
}

-(IBAction)stopPressed:(id)sender{
    [buttons setHidden:NO];
    [startResetButton setHidden:NO];
    float stopTime = CACurrentMediaTime();
    float time = (stopTime-startTime);
    
    trialCount++;
    
    float tc = trialCount;
    avg = ((tc-1)/(tc))*avg+time/tc;
    
    [self updateLabels];
    [stopButton setHidden:YES];
    
}

-(void)updateLabels{
    [avgTimeLabel setText:[NSString stringWithFormat:@"Average Time: %.1f",avg]];
    [trialLabel setText:[NSString stringWithFormat:@"Number of Trials: %d",trialCount]];
    if (insession) {
        [startResetButton setTitle:@"Reset" forState:UIControlStateNormal];
        [continueButton setHidden:NO];
    }
    else{
        [startResetButton setTitle:@"Start" forState:UIControlStateNormal];
        [continueButton setHidden:YES];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    avg = 0;
    trialCount = 0;
    insession = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
