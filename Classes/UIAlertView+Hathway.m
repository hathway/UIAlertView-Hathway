//
//  UIAlertView+Hathway.m
//  Hathway
//
//  Created by Hathway on 2014.
//  MIT License.
//

#import "UIAlertView+Hathway.h"
#import <objc/runtime.h>

static char kTitleBlockKey;
static char kIndexBlockKey;
static char kBooleanBlockKey;

@implementation UIAlertView (Hathway)

+ (void)showErrorAlertWithMessage:(NSString *)message
{
  [self showAlertWithTitle:@"Error" message:message buttonTitle:@"Ok"];
}

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message
{
  [self showAlertWithTitle:title message:message buttonTitle:@"Ok"];
}

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
               buttonTitle:(NSString *)buttonTitle
{
  [[[UIAlertView alloc] initWithTitle:title
                              message:message
                             delegate:nil
                    cancelButtonTitle:buttonTitle
                    otherButtonTitles:nil] show];
}

+ (void)showConfirmationWithTitle:(NSString *)title
                          message:(NSString *)message
                     confirmation:(NSString *)confirmation
                  completionBlock:(kAlertBoolBlock)completion;
{
  [[[UIAlertView alloc] initWithTitle:title
                              message:message
                         confirmation:confirmation
                  boolCompletionBlock:completion] show];
}

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
         otherButtonTitles:(NSArray *)otherButtonTitles
           completionBlock:(kAlertIndexBlock)completion
{
  [[[UIAlertView alloc] initWithTitle:title
                              message:message
                    cancelButtonTitle:cancelButtonTitle
                    otherButtonTitles:otherButtonTitles
                      completionBlock:completion] show];
}

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
         otherButtonTitles:(NSArray *)otherButtonTitles
      titleCompletionBlock:(kAlertTitleBlock)completion
{
  [[[UIAlertView alloc] initWithTitle:title
                              message:message
                    cancelButtonTitle:cancelButtonTitle
                    otherButtonTitles:otherButtonTitles
                 titleCompletionBlock:completion] show];
}

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSArray *)otherButtonTitles
{
  self = [self initWithTitle:title
                     message:message
                    delegate:self
           cancelButtonTitle:cancelButtonTitle
           otherButtonTitles:nil];

  if (self && otherButtonTitles) {
    for(NSString* title in otherButtonTitles) {
      [self addButtonWithTitle: title];
    }
  }
  return self;
}

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
       confirmation:(NSString *)confirmation
boolCompletionBlock:(kAlertBoolBlock)completion
{
  self = [self initWithTitle:title
                     message:message
           cancelButtonTitle:@"Cancel"
           otherButtonTitles:@[confirmation]];

  if (self) {
    objc_setAssociatedObject(self, &kBooleanBlockKey, completion, OBJC_ASSOCIATION_COPY_NONATOMIC);
  }
  return self;
}

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSArray *)otherButtonTitles
    completionBlock:(kAlertIndexBlock)completion
{
  self = [self initWithTitle:title
                     message:message
           cancelButtonTitle:cancelButtonTitle
           otherButtonTitles:otherButtonTitles];

  if (self) {
    objc_setAssociatedObject(self, &kIndexBlockKey, completion, OBJC_ASSOCIATION_COPY_NONATOMIC);
  }
  return self;
}

- (id) initWithTitle:(NSString *)title
             message:(NSString *)message
   cancelButtonTitle:(NSString *)cancelButtonTitle
   otherButtonTitles:(NSArray *)otherButtonTitles
titleCompletionBlock:(kAlertTitleBlock)completion
{
  self = [self initWithTitle:title
                     message:message
           cancelButtonTitle:cancelButtonTitle
           otherButtonTitles:otherButtonTitles];

  if (self) {
    objc_setAssociatedObject(self, &kTitleBlockKey, completion, OBJC_ASSOCIATION_COPY_NONATOMIC);
  }
  return self;
}

- (void)alertView:(UIAlertView*)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
  if (objc_getAssociatedObject(self, &kIndexBlockKey)) {
    kAlertIndexBlock block = objc_getAssociatedObject(self, &kIndexBlockKey);
    block(self, buttonIndex);
    objc_setAssociatedObject(self, &kIndexBlockKey, nil, OBJC_ASSOCIATION_ASSIGN);
  }
  else if (objc_getAssociatedObject(self, &kTitleBlockKey)) {
    kAlertTitleBlock block = objc_getAssociatedObject(self, &kTitleBlockKey);
    block(self, [self buttonTitleAtIndex:buttonIndex]);
    objc_setAssociatedObject(self, &kTitleBlockKey, nil, OBJC_ASSOCIATION_ASSIGN);
  }
  else if (objc_getAssociatedObject(self, &kBooleanBlockKey)) {
    kAlertBoolBlock block = objc_getAssociatedObject(self, &kBooleanBlockKey);
    block(self, buttonIndex == 1);
    objc_setAssociatedObject(self, &kBooleanBlockKey, nil, OBJC_ASSOCIATION_ASSIGN);
  }
}

@end
