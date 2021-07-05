//
//  AlertController.h
//  qweqweqwe
//
//  Created by Heorhi on 2021-07-04.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertController : UIViewController

- (void) showAlertMsg:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
