//
//  ChatRoomHeaderView.h
//  clubhouse
//
//  Created by Eason on 2021/2/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatRoomHeaderView : UICollectionReusableView
/**点击更多*/
@property(nonatomic, copy) void (^moreBlock)(void);
@end

NS_ASSUME_NONNULL_END
