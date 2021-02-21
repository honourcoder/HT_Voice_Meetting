//
//  ChatRoomBottomView.h
//  clubhouse
//
//  Created by Eason on 2021/2/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatRoomBottomView : UIView
/**离开*/
@property(nonatomic, copy) void (^leaveBlock)(void);
/**邀请*/
@property(nonatomic, copy) void (^inviteBlock)(void);
/**话筒*/
@property(nonatomic, copy) void (^micphoneBlock)(void);

@end

NS_ASSUME_NONNULL_END
