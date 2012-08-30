//
//  ChatViewController.h
//  JabberClient
//
//  Created by M.A. de Vos on 30-08-12.
//  Copyright (c) 2012 M.A. de Vos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JabberClientAppDelegate.h"

@interface ChatViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MessageDelegate>

@property (nonatomic, weak) IBOutlet UITextField *messageTextField;
@property (nonatomic, strong) NSString *chatWithUser;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

- (IBAction)sendMessage:(id)sender;

@end
