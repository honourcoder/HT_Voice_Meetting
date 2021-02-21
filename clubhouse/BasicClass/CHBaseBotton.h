//
//  CHBaseBotton.h
//  clubhouse
//
//  Created by zhang benwei on 2021/2/18.
//

#import <UIKit/UIKit.h>
@class CHBaseBotton;
NS_ASSUME_NONNULL_BEGIN

typedef void(^ButtonActionBlock)(CHBaseBotton * button);
@interface CHBaseBotton : UIView
@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * imageName;
@property (nonatomic,assign) BOOL active;
@property (nonatomic,copy) ButtonActionBlock  actionBlock;
@end

NS_ASSUME_NONNULL_END
