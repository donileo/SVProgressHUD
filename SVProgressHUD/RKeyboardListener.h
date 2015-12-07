//
//  RKeyboardListener.h
//  SVProgressHUD
//
//  Created by Adonis Peralta on 12/6/15.
//

#import <UIKit/UIKit.h>

@interface RKeyboardListener : NSObject

@property (nonatomic, assign) BOOL keyboardIsOnScreen;
@property (nonatomic, assign) CGRect keyboardFrame;

+ (instancetype)sharedManager;

- (void)startListener;

- (void)stopListener;

@end
