//
//  LoginViewController.m
//  JabberClient
//
//  Created by M.A. de Vos on 30-08-12.
//  Copyright (c) 2012 M.A. de Vos. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize usernameTextField;
@synthesize passwordTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction) login:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:self.usernameTextField.text forKey:@"userID"];
    [[NSUserDefaults standardUserDefaults] setObject:self.passwordTextField.text forKey:@"userPassword"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction) hideLogin:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
