//
//  RKeyboardListener.m
//  SVProgressHUD
//
//  Created by Adonis Peralta on 12/6/15.
//

#import "RKeyboardListener.h"

@implementation RKeyboardListener

+ (instancetype)sharedManager
{
    static RKeyboardListener *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [RKeyboardListener new];
    });
    return sharedManager;
}

- (void)startListener
{

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(setupKeyboardInfo:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(setupKeyboardInfo:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
}

- (void)stopListener
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setupKeyboardInfo:(NSNotification *)notification
{
    if ([notification.name isEqualToString:UIKeyboardDidHideNotification]) {
        self.keyboardIsOnScreen = NO;
        self.keyboardFrame = CGRectZero;
    } else if ([notification.name isEqualToString:UIKeyboardDidShowNotification]) {
        self.keyboardIsOnScreen = YES;
        self.keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    }
}

- (void)dealloc
{
    [self stopListener];
}

@end
