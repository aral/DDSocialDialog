//
//  iPhoneDemoViewController.h
//  Demo
//
//  Created by digdog on 6/12/10.
//  Copyright 2010 Ching-Lan 'digdog' HUANG and digdog software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDSocialLoginDialog.h" // For DDSocialLoginDialogDelegate and DDSocialDialogDelegate

@interface iPhoneDemoViewController : UITableViewController <DDSocialDialogDelegate, DDSocialLoginDialogDelegate> {

}

@end
