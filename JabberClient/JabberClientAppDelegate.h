//
//  JabberClientAppDelegate.h
//  JabberClient
//
//  Created by M.A. de Vos on 30-08-12.
//  Copyright (c) 2012 M.A. de Vos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMPP.h"

@protocol ChatDelegate

- (void)newBuddyOnline:(NSString *)buddyName;
- (void)buddyWentOffline:(NSString *)buddyName;
- (void)didDisconnect;

@end

@protocol MessageDelegate

- (void)newMessageReceived:(NSDictionary *)messageContent;

@end

@interface JabberClientAppDelegate : UIResponder <UIApplicationDelegate, XMPPStreamDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, weak) id<ChatDelegate> chatDelegate;
@property (nonatomic, weak) id<MessageDelegate> messageDelegate;
@property (nonatomic, strong) XMPPStream *xmppStream;

- (BOOL)connect;
- (void)disconnect;

@end
