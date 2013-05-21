//
//  MyImageView.m
//  CA Test iOS new
//
//  Created by Kannan on 3/15/13.
//
//

#import "MyImageView.h"

@implementation MyImageView
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIPanGestureRecognizer *panGest = [[UIPanGestureRecognizer alloc]init];
        [panGest addTarget:self action:@selector(dragging:)];
        [self addGestureRecognizer:panGest];
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//    [delegate toggleAnimationView:YES];
//    [delegate touchesMoved:touches withEvent:event];
////    UITouch *touch = [touches anyObject];
//
//    // If the touch was in the placardView, move the placardView to its location
//
//        CGPoint location = [touch locationInView:self];
//        self.center = location;
//    NSLog(@"My log");
  
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [delegate toggleAnimationView:YES];
//    [delegate touchesBegan:touches withEvent:event];
//    UITouch *touch = [[event allTouches] anyObject];
//    CGPoint touchPoint = [touch locationInView:self];
//    
//    NSLog(@"Touch x : %f y : %f", touchPoint.x, touchPoint.y);
//    
//    NSLog(@"Tiouch %@ Img %@",[touch view],self );
    // If the touch was in the placardView, move the placardView to its location
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    [delegate toggleAnimationView:NO];
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

//- (void) dragging: (UIPanGestureRecognizer*) p {
//    UIView* vv = p.view;
//    if (p.state == UIGestureRecognizerStateBegan ||
//        p.state == UIGestureRecognizerStateChanged) {
//        CGPoint delta = [p translationInView: vv.superview];
//        CGPoint c = vv.center;
//        c.x += delta.x; c.y += delta.y;
//        vv.center = c;
//        [p setTranslation: CGPointZero inView: vv.superview];
//    }
//}

//- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer{
//    
//    [self dragging:gestureRecognizer];
//}
@end
