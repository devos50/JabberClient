//
//  ChatViewController.m
//  JabberClient
//
//  Created by M.A. de Vos on 30-08-12.
//  Copyright (c) 2012 M.A. de Vos. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController
{
    NSMutableArray *messages;
}

@synthesize messageTextField;
@synthesize chatWithUser;
@synthesize tableView;

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
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    messages = [[NSMutableArray alloc] init];
    JabberClientAppDelegate *del = [self appDelegate];
    del.messageDelegate = self;
    [self.messageTextField becomeFirstResponder];
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

- (IBAction)sendMessage:(id)sender
{
    NSString *messageStr = self.messageTextField.text;
    
    if([messageStr length] > 0)
    {
        // send message through XMPP
        NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
        [body setStringValue:messageStr];
        
        NSXMLElement *message = [NSXMLElement elementWithName:@"message"];
        [message addAttributeWithName:@"type" stringValue:@"chat"];
        [message addAttributeWithName:@"to" stringValue:chatWithUser];
        [message addChild:body];
        
        [self.xmppStream sendElement:message];
        
        self.messageTextField.text = @"";
        
        NSString *mstr = [NSString stringWithFormat:@"%@:%@", messageStr, @"you"];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setObject:messageStr forKey:@"msg"];
        [dict setObject:@"you" forKey:@"sender"];
        
        [messages addObject:dict];
        [self.tableView reloadData];
    }
}

- (JabberClientAppDelegate *)appDelegate
{
    return (JabberClientAppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (XMPPStream *)xmppStream {
    return [[self appDelegate] xmppStream];
}

#pragma mark - UITableView data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MessageCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    NSDictionary *dict = [messages objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"msg"];
    cell.detailTextLabel.text = [dict objectForKey:@"sender"];
    cell.userInteractionEnabled = NO;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return messages.count;
}

#pragma mark - Chat delegates

- (void)newMessageReceived:(NSDictionary *)messageContent
{
    [messages addObject:messageContent];
    [self.tableView reloadData];
}

@end
