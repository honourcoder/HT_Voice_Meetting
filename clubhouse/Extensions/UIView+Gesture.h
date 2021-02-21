//
//  UIView+Gesture.h
//  clubhouse
//
//  Created by Eason on 2021/2/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Gesture)
/// 添加手势
- (void) addTapGestureWith:(id) target action:(SEL) action;

@end

NS_ASSUME_NONNULL_END
