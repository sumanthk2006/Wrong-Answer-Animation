//
//  PSViewController.m
//  Incorrect Answer Animation
//
//  Created by Philippe Sawaya on 6/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PSViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface PSViewController ()

-(void)shakeScreenAnimation;
-(void)tintScreenAnimation;
-(IBAction)shake:(id)sender;

@property (nonatomic, strong) UIView *example;
@property (nonatomic, strong) UIView *redScreen;
@property (nonatomic, strong) IBOutlet UIButton *button;

@end

@implementation PSViewController

@synthesize example,redScreen, button;

-(IBAction)shake:(id)sender{

    [self shakeScreenAnimation];
    [self tintScreenAnimation];
}
-(void)shakeScreenAnimation{
    
    int difference = 128;

    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    NSArray *transformValues = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:((M_PI)/difference)],
                            [NSNumber numberWithFloat:(-((M_PI)/difference))],
                            [NSNumber numberWithFloat:((M_PI)/difference)],
                            [NSNumber numberWithFloat:(-((M_PI)/difference))],
                            [NSNumber numberWithFloat:((M_PI)/difference)],
                            [NSNumber numberWithFloat:(-((M_PI)/difference))],
                            [NSNumber numberWithFloat:0],                                
                            nil];
    
    [shakeAnimation setValues:transformValues];
    
    NSArray *times = [NSArray arrayWithObjects:
                      [NSNumber numberWithFloat:0.14f],
                      [NSNumber numberWithFloat:0.28f],
                      [NSNumber numberWithFloat:0.42f],
                      [NSNumber numberWithFloat:0.57f],
                      [NSNumber numberWithFloat:0.71f],
                      [NSNumber numberWithFloat:0.85f],
                      [NSNumber numberWithFloat:1.0f], 
                      nil];
    
    [shakeAnimation setKeyTimes:times];
    
    NSArray *timingFunctions = [NSArray arrayWithObjects:
                                [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], 
                                [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], 
                                [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], 
                                [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], 
                                [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                nil];
    
    [shakeAnimation setTimingFunctions:timingFunctions];
    
    shakeAnimation.fillMode = kCAFillModeForwards;
    shakeAnimation.removedOnCompletion = NO;
    shakeAnimation.duration = 0.5f;
    
    [self.view.layer addAnimation:shakeAnimation forKey:@"anim"];
    

}
-(void)tintScreenAnimation{
    
    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    NSArray *transformValues = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.45f],
                               [NSNumber numberWithFloat:0.0f],                                
                               nil];
    
    [shakeAnimation setValues:transformValues];
    
    NSArray *times = [NSArray arrayWithObjects:
                      [NSNumber numberWithFloat:0.5f],
                      [NSNumber numberWithFloat:1.0f], 
                      nil];
    
    [shakeAnimation setKeyTimes:times];
    
    NSArray *timingFunctions = [NSArray arrayWithObjects:
                                [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn], 
                                [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                nil];
    
    [shakeAnimation setTimingFunctions:timingFunctions];
    
    shakeAnimation.fillMode = kCAFillModeForwards;
    shakeAnimation.removedOnCompletion = NO;
    shakeAnimation.duration = 0.5f;
    
    [self.redScreen.layer addAnimation:shakeAnimation forKey:@"anim"];

}

- (void)viewDidLoad
{
    self.button = [[UIButton alloc]init];
    self.example = [[UIView alloc] initWithFrame:CGRectMake(100, 150, 100, 250)];
    self.example.backgroundColor = [UIColor blackColor];
    //[self.view addSubview:self.example];
    CGFloat centerX = CGRectGetMidX(self.view.bounds);
    CGFloat centerY = CGRectGetMidY(self.view.bounds);
    CGPoint centerCenter = CGPointMake(centerX, centerY);
    self.example.center = centerCenter;
    self.redScreen = [[UIView alloc] initWithFrame:self.view.frame];
    self.redScreen.layer.opacity = 0.0f;
    self.redScreen.layer.backgroundColor = [[UIColor redColor] CGColor];
    [self.view addSubview:self.redScreen];

    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
