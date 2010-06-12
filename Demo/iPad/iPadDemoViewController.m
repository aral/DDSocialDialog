    //
//  iPadDemoViewController.m
//  Demo
//
//  Created by digdog on 6/12/10.
//  Copyright 2010 Ching-Lan 'digdog' HUANG and digdog software. All rights reserved.
//

#import "iPadDemoViewController.h"

@interface iPadDemoViewController () 
- (void)showDialog:(id)sender;
@end

@implementation iPadDemoViewController

#pragma mark -
#pragma mark View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"DDSocialDialog Demo";
	
	UIBarButtonItem *twitterDialog = [[UIBarButtonItem alloc] initWithTitle:@"Twitter Dialog" style:UIBarButtonItemStyleBordered target:self action:@selector(showDialog:)];
	UIBarButtonItem *twitterLogin = [[UIBarButtonItem alloc] initWithTitle:@"Twitter Login" style:UIBarButtonItemStyleBordered target:self action:@selector(showDialog:)];
	UIBarButtonItem *plurkDialog = [[UIBarButtonItem alloc] initWithTitle:@"Plurk Dialog" style:UIBarButtonItemStyleBordered target:self action:@selector(showDialog:)];
	UIBarButtonItem *plurkLogin = [[UIBarButtonItem alloc] initWithTitle:@"Plurk Login" style:UIBarButtonItemStyleBordered target:self action:@selector(showDialog:)];
	UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

	twitterDialog.tag = 0;
	twitterLogin.tag = 1;
	plurkDialog.tag = 2;
	plurkLogin.tag = 3;
	
	self.toolbarItems = [NSArray arrayWithObjects:spaceItem, twitterDialog, twitterLogin, spaceItem, plurkDialog, plurkLogin, spaceItem, nil];
	
	[twitterDialog release];
	[twitterLogin release];
	[plurkDialog release];
	[plurkLogin release];
	[spaceItem release];
	
	self.navigationController.toolbarHidden = NO;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark -
#pragma mark action

- (void)showDialog:(id)sender {
	switch ([[sender valueForKey:@"tag"] integerValue]) {
		case 0: 
		{
			DDSocialDialog *blankDialog = [[DDSocialDialog alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 600., 500.) theme:DDSocialDialogThemeTwitter];
			blankDialog.dialogDelegate = self;
			blankDialog.titleLabel.text = @"My Twitter Dialog";
			[blankDialog show];
			[blankDialog release];			
		}
			break;
		case 1:
		{
			// DDSocialLoginDialog has hardcode frame size optimized for both iPhone and iPad, so don't worry about the position and size.
			DDSocialLoginDialog *loginDialog = [[DDSocialLoginDialog alloc] initWithDelegate:self theme:DDSocialDialogThemeTwitter];
			[loginDialog show];
			[loginDialog release];
		}
			break;
		case 2:
		{
			DDSocialDialog *blankDialog = [[DDSocialDialog alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 600., 500.) theme:DDSocialDialogThemePlurk];
			blankDialog.dialogDelegate = self;
			blankDialog.titleLabel.text = @"My Plurk Dialog";
			[blankDialog show];
			[blankDialog release];			
		}
			break;
		case 3:
		{
			// DDSocialLoginDialog has hardcode frame size optimized for both iPhone and iPad, so don't worry about the position and size.
			DDSocialLoginDialog *loginDialog = [[DDSocialLoginDialog alloc] initWithDelegate:self theme:DDSocialDialogThemePlurk];
			[loginDialog show];
			[loginDialog release];
		}
			break;
		default:
			break;
	}
}

#pragma mark -
#pragma mark DDSocialDialogDelegate (Optional)
- (void)socialDialogDidCancel:(DDSocialDialog *)socialDialog {
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSStringFromClass([socialDialog class]) message:@"Cancel button clicked" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

#pragma mark DDSocialLoginDialogDelegate (Required)
- (void)socialDialogDidSucceed:(DDSocialLoginDialog *)socialLoginDialog {
	NSString *username = socialLoginDialog.username;
	NSString *password = socialLoginDialog.password;
	
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSStringFromClass([socialLoginDialog class]) message:[NSString stringWithFormat:@"Username:%@ and Password:%@", username, password] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alertView show];
	[alertView release];	
}

@end
