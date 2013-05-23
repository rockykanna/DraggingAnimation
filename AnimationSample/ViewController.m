//
//  ViewController.m
//  AnimationSample
//
//  Created by Kannan on 3/15/13.
//  Copyright (c) 2013 Kannan Shanmugam. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize imgView,animationViewTouched;
- (void)viewDidLoad
{
    [super viewDidLoad];
    animationViewTouched = NO;
    imgView.delegate= self;
    
   UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureMoveAround:)] ;
    [panGesture setMaximumNumberOfTouches:2];
    [panGesture setDelegate:self];
    [imgView addGestureRecognizer:panGesture];
    
    
    
//    TickleGestureRecognizer *trickle = [[TickleGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureMoveAround:)];
//    trickle.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch *touch = [[event allTouches] anyObject];
//    CGPoint touchPoint = [touch locationInView:self.view];
//    NSLog(@"Touch x : %f y : %f", touchPoint.x, touchPoint.y);
//    
//     NSLog(@"Tiouch %@ Img %@",[touch view],self.imgView );
    // If the touch was in the placardView, move the placardView to its location
   
}
    

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    // If the touch was in the placardView, move the placardView to its location
    
   // CGPoint location = [touch locationInView:self];
    //
//    NSLog(@"Tiouch %@ Img %@",[touch view],self.imgView );
//   if (animationViewTouched) {
//        CGPoint location = [touch locationInView:self.view];
//        imgView.center = location;
//        return;
//  }
//    NSLog(@"My log");
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self toggleAnimationView:NO];
}

-(void)dragging:(UIPanGestureRecognizer *)gesture
{
    CGPoint panCoord;
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        //NSLog(@"Received a pan gesture");
        panCoord = [gesture locationInView:gesture.view];
        
        
    }
    CGPoint newCoord = [gesture locationInView:gesture.view];
    float dX = newCoord.x-panCoord.x;
    float dY = newCoord.y-panCoord.y;
    
    gesture.view.frame = CGRectMake(gesture.view.frame.origin.x+dX, gesture.view.frame.origin.y+dY, gesture.view.frame.size.width, gesture.view.frame.size.height);
}

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer{
    
    [self dragging:gestureRecognizer];
}

-(void)toggleAnimationView:(BOOL)value{
    self.animationViewTouched = value;
}

-(void)panGestureMoveAround:(UIPanGestureRecognizer *)gesture;
{
//    UIView *piece = [gesture view];
//    [self adjustAnchorPointForGestureRecognizer:gesture];
//    
//    if ([gesture state] == UIGestureRecognizerStateBegan || [gesture state] == UIGestureRecognizerStateChanged) {
//        
//        CGPoint translation = [gesture translationInView:[piece superview]];
//        [piece setCenter:CGPointMake([piece center].x + translation.x, [piece center].y+translation.y*0.1)];
//        [gesture setTranslation:CGPointZero inView:[piece superview]];
//    }
    
//    CGPoint panCoord;
//    if(gesture.state == UIGestureRecognizerStateBegan)
//    {
//        //NSLog(@"Received a pan gesture");
//        panCoord = [gesture locationInView:gesture.view];
//        
//        
//    }
//    CGPoint newCoord = [gesture locationInView:gesture.view];
//    float dX = newCoord.x-panCoord.x;
//    float dY = newCoord.y-panCoord.y;
//    
//    gesture.view.frame = CGRectMake(gesture.view.frame.origin.x+dX, gesture.view.frame.origin.y+dY, gesture.view.frame.size.width, gesture.view.frame.size.height);
//    
    
    
    CGPoint translation = [gesture translationInView:self.view];
    gesture.view.center = CGPointMake(gesture.view.center.x + translation.x,
                                         gesture.view.center.y + translation.y);
    [gesture setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        
        CGPoint velocity = [gesture velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
        
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(gesture.view.center.x + (velocity.x * slideFactor),
                                         gesture.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);
        
        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            gesture.view.center = finalPoint;
        } completion:nil];
        
    }
    
    
}


- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIView *piece = gestureRecognizer.view;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
        
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
    }
}
@end
