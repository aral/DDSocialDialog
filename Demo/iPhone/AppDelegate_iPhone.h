//
//  AppDelegate_iPhone.h
//  Demo
//
//  Created by digdog on 6/12/10.
//  Copyright Ching-Lan 'digdog' HUANG and digdog software 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate_iPhone : NSObject <UIApplicationDelegate> {
@private
    UIWindow *window;
	UINavigationController *navigationController_;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@end

