//
//  CHBaseViewController.h
//  clubhouse
//
//  Created by zhang benwei on 2021/2/16.
//

#import <UIKit/UIKit.h>
#import "CHBaseNavView.h"
NS_ASSUME_NONNULL_BEGIN

@interface CHBaseViewController : UIViewController<CHBaseRightNavDelegate>

@property (nonatomic,strong) CHBaseNavView * navView;

@end

NS_ASSUME_NONNULL_END
