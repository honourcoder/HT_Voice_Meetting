//
//  ChatRoomTopView.h
//  clubhouse
//
//  Created by Eason on 2021/2/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatRoomTopView : UIView
/**点击折叠*/
@property(nonatomic, copy) void (^foldBlock)(void);
/**点击编辑*/
@property(nonatomic, copy) void (^editBlock)(void);
/**点击头像*/
@property(nonatomic, copy) void (^avatarBlock)(void);

@end

NS_ASSUME_NONNULL_END
