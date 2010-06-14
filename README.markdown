# DDSocialDialog, a FacebookConnect look-alike UIView dialog for iPhone and iPad

DDSocialDialog is a UIView subclass looks like FacebookConnect dialog.

![](http://github.com/digdog/DDSocialDialog/raw/master/Screenshots/DDSocialLoginDialogiPhone.png)

## Features

1. Easy to use, just like UIAlertView.
2. A DDSocialDialog dialog with an *empty contentView* for customizing.
3. A extended DDSocialLoginDialog dialog for retrieving *username and password*.
4. Two themes: Twitter and Plurk. And you can create your own if you like.
5. Optimized for different resolutions, including iPhone, iPad and iPhone 4 (*Retina Display, 960 by 640*).
6. Support orientations, you can rotate with keyboard on or off. This part is acting better than FacebookConnect SDK.

## Requirement

1. iPhone SDK 3.x, iOS SDK 4 or later (Sample project is an iPhone/iPad Universal app).
2. And use NO PRIVATE API calls.

## Usage

Very similar to UIAlertView. For DDSocialDialog, you can init with your prefer size (position is ignored) and theme:

    DDSocialDialog *blankDialog = [[DDSocialDialog alloc] initWithFrame:CGRectMake(0., 0., 600., 500.) theme:DDSocialDialogThemeTwitter];
    blankDialog.dialogDelegate = self;
    blankDialog.titleLabel.text = @"My Twitter Dialog";
    [blankDialog.contentView addSubview:self.mySubview];
    [blankDialog show];
    [blankDialog release];
    
And the DDSocialDialogDelegate will call -socialDialogDidCancel: when user clicked top-right cancel button.

For the DDSocialLoginDialog, it is even easier, you don't need to care about login dialog size, it's been optimized for both iPhone and iPad with keyboard on and off. Just init with delegate and theme:

    DDSocialLoginDialog *loginDialog = [[DDSocialLoginDialog alloc] initWithDelegate:self theme:DDSocialDialogThemePlurk];
    [loginDialog show];
    [loginDialog release];
    
And the DDSocialLoginDialogDelegate will call -socialDialogDidSucceed: when user clicked "Sign In" button. Then you can have the username and password through socialLoginDialog.username and socialLoginDialog.password properties.

## Screenshots

![](http://github.com/digdog/DDSocialDialog/raw/master/Screenshots/DDSocialDialogiPad.png)


![](http://github.com/digdog/DDSocialDialog/raw/master/Screenshots/DDSocialLoginDialogiPad.png)


![](http://github.com/digdog/DDSocialDialog/raw/master/Screenshots/DDSocialLoginDialogiPhoneLandscape.png)

## License

DDSocialDialog is licensed under MIT license.