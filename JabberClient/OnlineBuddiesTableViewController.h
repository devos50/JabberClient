//
//  OnlineBuddiesTableViewController.h
//  JabberClient
//
//  Created by M.A. de Vos on 30-08-12.
//  Copyright (c) 2012 M.A. de Vos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JabberClientAppDelegate.h"

@interface OnlineBuddiesTableViewController : UITableViewController <ChatDelegate>

- (IBAction)showLogin:(id)sender;

@end
