//
//  CHBottomView.h
//  clubhouse
//
//  Created by zhang benwei on 2021/2/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
 
typedef void(^CHBottomActionBlock)(BOOL isOpenNewMenu);

@interface CHBottomView : UIView
 

@property (nonatomic,strong) CHBottomActionBlock actionBlock;
 
/**点击*/
@property(nonatomic, copy) void (^startRoomBlock)(void);
 
@end

NS_ASSUME_NONNULL_END
