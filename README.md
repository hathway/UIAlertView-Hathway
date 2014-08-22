UIAlertView-Hathway
===================

This Objective-c category adds a series of convenient class methods to UIAlertView, 
which allow to easily show alerts and to handle the user response with blocks.

##Installation
Include in your `Podfile`:
```
pod 'UIAlertView+Hathway'
```
Then, in your `.m` files:
```objc
#import "UIAlertView+Hathway.h"
```

##Usage

###Error Alert
This helper method shows a standard error alert with "Error" as title, "Ok" as the only button and the given message.

```objc
[UIAlertView showErrorAlertWithMessage:@"Oooops, some error happened."];
```

###Alert with custom Title and Message
This helper method shows a standard alert with custom title, "Ok" as the only button and the given message.

```objc
[UIAlertView showAlertWithTitle:@"Email not set" message:@"Email is a required field"];
```

###Alert with custom Title, Message and Button
This helper method shows a standard alert with custom title, custom button and the given message.

```objc
[UIAlertView showAlertWithTitle:@"Some title" message:@"Some message" buttonTitle:@"Some button text"];
```

###Confirmation alert
This helper method shows a standard alert with custom title, message, Cancel button and custom action button. 
It provides a boolean result to indicate if the user confirmed the action or cancelled.

```objc
[UIAlertView showConfirmationWithTitle:@"Delete entry"
                               message:@"Do you really want to delete this entry?"
                          confirmation:@"Delete"
                       completionBlock:^(UIAlertView *alert, BOOL confirmed) {
                         if (confirmed) {
                            // Proceed to delete entry
                         }
                       }];
```

### Other methods

```objc
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
```

