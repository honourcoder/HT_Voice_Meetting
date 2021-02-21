//
//  ChatRoomModel.h
//  clubhouse
//
//  Created by Eason on 2021/2/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatRoomModel : NSObject
/**用户id*/
@property(nonatomic, copy) NSString *userId;
/**头像*/
@property (nonatomic, copy) NSString *avatar;
/**昵称*/
@property(nonatomic, copy) NSString *nickName;
/**麦状态*/
@property(nonatomic, assign) BOOL isMicphoneOn;
/**是否主持人*/
@property(nonatomic, assign) BOOL isCompere;

@end

NS_ASSUME_NONNULL_END
