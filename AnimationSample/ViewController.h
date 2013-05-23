//
//  ViewController.h
//  AnimationSample
//
//  Created by Kannan on 3/15/13.
//  Copyright (c) 2013 Kannan Shanmugam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MyImageView.h"
//#import "TickleGestureRecognizer.h"

@interface ViewController : UIViewController <TouchSenseWiz, UIGestureRecognizerDelegate>
@property(nonatomic,retain) IBOutlet MyImageView *imgView;
@property(nonatomic)BOOL animationViewTouched;
@end
