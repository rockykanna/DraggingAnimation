//
//  MyImageView.h
//  CA Test iOS new
//
//  Created by Kannan on 3/15/13.
//
//

#import <UIKit/UIKit.h>

@protocol TouchSenseWiz <NSObject>

-(void)toggleAnimationView:(BOOL)value;


@end

@interface MyImageView : UIImageView <UIGestureRecognizerDelegate>{
    //id<TouchSenseWiz> delegate;
}
@property(nonatomic, assign) id delegate;
@end
