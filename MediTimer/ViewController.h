//
//  ViewController.h
//  MediTimer
//
//  Created by Jacob Balthazor on 12/14/12.
//  Copyright (c) 2012 Jacob Balthazor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CoreAnimation.h>

@interface ViewController : UIViewController{
    IBOutlet UIButton *startResetButton;
    IBOutlet UIButton *continueButton;
    IBOutlet UIButton *stopButton;
    
    IBOutlet UILabel *avgTimeLabel;
    IBOutlet UILabel *trialLabel;
    
    IBOutlet UIView *buttons;

    
    BOOL insession;
    int trialCount;
    float startTime;
    float avg;
}

-(IBAction)startResetPressed:(id)sender;
-(IBAction)continuePressed:(id)sender;
-(IBAction)stopPressed:(id)sender;
-(void)updateLabels;

@end
