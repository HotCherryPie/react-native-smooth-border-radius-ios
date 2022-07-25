#import "React/RCTViewManager.h"
#import "UIKit/UIKit.h"
#import "Foundation/Foundation.h"
#import "EllipseCornersView.h"

@interface RCT_EXTERN_MODULE(EllipseCornersViewManager, RCTViewManager)

// RCT_EXPORT_VIEW_PROPERTY(interpolatePath, NSNumber)

RCT_EXPORT_VIEW_PROPERTY(radius, CGFloat)

RCT_EXPORT_VIEW_PROPERTY(tile, NSString)

@end
