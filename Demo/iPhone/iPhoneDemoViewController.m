//
//  iPhoneDemoViewController.m
//  Demo
//
//  Created by digdog on 6/12/10.
//  Copyright 2010 Ching-Lan 'digdog' HUANG and digdog software. All rights reserved.
//

#import "iPhoneDemoViewController.h"

@implementation iPhoneDemoViewController


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

	self.title = @"DDSocialDialog Demo";
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {

	// DDSocialDialog supports orientation better than FacebookConnect SDK.
	return YES;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	if (indexPath.row == 0) {
		cell.textLabel.text = @"DDSocialDialog";
	} else {
		cell.textLabel.text = @"DDSocialLoginDialog";
	}
	    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if (section == 0) {
		return @"DDSocialDialogThemeTwitter";
	}
	
	return @"DDSocialDialogThemePlurk";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {	
	if (section == 0) {
		return nil;
	}
	
	return @"digdog.tumblr.com";
}

#pragma mark Table view delegate (Create DDSocialDialog & DDSocialLoginDialog)

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	DDSocialDialogTheme dialogTheme = (indexPath.section == 0) ? DDSocialDialogThemeTwitter : DDSocialDialogThemePlurk;
	
	if (indexPath.row == 0) {
		DDSocialDialog *blankDialog = [[DDSocialDialog alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 300., 250.) theme:dialogTheme];
		blankDialog.dialogDelegate = self;
		blankDialog.titleLabel.text = @"My Dialog";
		[blankDialog show];
		[blankDialog release];
	} else {
		// DDSocialLoginDialog has hardcode frame size optimized for both iPhone and iPad, so don't worry about the position and size.
		DDSocialLoginDialog *loginDialog = [[DDSocialLoginDialog alloc] initWithDelegate:self theme:dialogTheme];
		[loginDialog show];
		[loginDialog release];
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

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

