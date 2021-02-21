//
//  UIView+Gesture.m
//  clubhouse
//
//  Created by Eason on 2021/2/18.
//

#import "UIView+Gesture.h"

@implementation UIView (Gesture)

- (void) addTapGestureWith:(id) target action:(SEL) action  {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
}

@end
