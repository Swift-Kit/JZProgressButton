//
//  JZViewController.m
//  JZButtons
//
//  Created by Joseph Zhou on 12/12/13.
//  Copyright (c) 2013 JoeyZhou. All rights reserved.
//

#import "JZViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface JZViewController ()
@property (strong, nonatomic) IBOutlet UIButton *progressiveButton;
@property (nonatomic) CALayer *progressLayer;
@end

@implementation JZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // view stuff
    self.view.backgroundColor = [UIColor colorWithRed:255/255.0f green:233/255.0f blue:165/255.0f alpha:1.0f];
    
    CALayer *layer = [self.progressiveButton layer];
    [layer setBorderColor:[UIColor orangeColor].CGColor];
    [layer setBorderWidth:0.3f];
    
    self.progressLayer = [CALayer layer];
    self.progressLayer.delegate = self;
    self.progressLayer.backgroundColor = [UIColor orangeColor].CGColor;
    self.progressLayer.frame = CGRectMake(0, 0, 0, [self.progressiveButton layer].frame.size.height);
    [layer addSublayer:self.progressLayer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)progress1:(id)sender {
    [self.progressiveButton setTitle:@"Uploading..." forState:UIControlStateNormal];
    [UIView animateWithDuration:2.0 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.progressLayer.frame = CGRectMake(0,
                                              0,
                                              [self.progressiveButton layer].frame.size.width,
                                              self.progressLayer.frame.size.height);
    }
                     completion:^(BOOL finished) {
                         [self.progressiveButton setTitle:@"Uploaded✓" forState:UIControlStateNormal];
                         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.8 * NSEC_PER_SEC), dispatch_get_current_queue(), ^{
                             [self.progressiveButton setTitle:@"Upload" forState:UIControlStateNormal];
                             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.8 * NSEC_PER_SEC), dispatch_get_current_queue(), ^{
                                 
                                 self.progressLayer.frame = CGRectMake(0,0,0,self.progressLayer.frame.size.height);
                             });
                         });
                     }];
    
}

- (IBAction)progress2:(id)sender {
    [self.progressiveButton setTitle:@"Uploading..." forState:UIControlStateNormal];
    [UIView animateWithDuration:2.0 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.progressLayer.frame = CGRectMake(0,
                                              0,
                                              [self.progressiveButton layer].frame.size.width,
                                              self.progressLayer.frame.size.height);
    }
                     completion:^(BOOL finished) {
                         [self.progressiveButton setTitle:@"Uploaded✓" forState:UIControlStateNormal];
                         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.8 * NSEC_PER_SEC), dispatch_get_current_queue(), ^{
                             [self.progressiveButton setTitle:@"Upload" forState:UIControlStateNormal];
                             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.8 * NSEC_PER_SEC), dispatch_get_current_queue(), ^{
                                 
                                 self.progressLayer.frame = CGRectMake(0,0,0,self.progressLayer.frame.size.height);
                             });
                         });
                     }];
    
}

@end
