//
//  UIAlertView+Hathway.h
//  Hathway
//
//  Created by Hathway on 2014.
//  MIT License.
//

#import <UIKit/UIKit.h>

typedef void (^kAlertBoolBlock)(UIAlertView *alert, BOOL confirmed);
typedef void (^kAlertIndexBlock)(UIAlertView *alert, NSUInteger buttonIndex);
typedef void (^kAlertTitleBlock)(UIAlertView *alert, NSString *buttonTitle);

@interface UIAlertView (Hathway)

+ (void)showErrorAlertWithMessage:(NSString *)message;
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle;

+ (void)showConfirmationWithTitle:(NSString *)title
                          message:(NSString *)message
                     confirmation:(NSString *)confirmation
                   completionBlock:(kAlertBoolBlock)completion;

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
         otherButtonTitles:(NSArray *)otherButtonTitles
           completionBlock:(kAlertIndexBlock)completion;

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
         otherButtonTitles:(NSArray *)otherButtonTitles
      titleCompletionBlock:(kAlertTitleBlock)completion;

@end
