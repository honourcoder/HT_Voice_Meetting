//
//  ChatRoomItem.h
//  clubhouse
//
//  Created by Eason on 2021/2/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ChatRoomModel;
@interface ChatRoomItem : UICollectionViewCell

- (void) updateDataWith:(ChatRoomModel *) dataModel;

@end

NS_ASSUME_NONNULL_END
