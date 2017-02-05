
#import "RNSimpleLinkedin.h"
#import "RCTLog.h"
#import <linkedin-sdk/LISDK.h>

@implementation RNSimpleLinkedin

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(logIn:(RCTResponseSenderBlock)callback)
{
    RCTLogInfo(@"Starting login");
    [LISDKSessionManager createSessionWithAuth:[NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION, LISDK_EMAILADDRESS_PERMISSION, nil]
                                         state: nil
                        showGoToAppStoreDialog:YES
                                  successBlock:^(NSString *returnState) {
                                      
                                      LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
                                      RCTLogInfo(@"value=%@ isvalid=%@",[session value],[session isValid] ? @"YES" : @"NO");
                                      NSMutableString *text = [[NSMutableString alloc] initWithString:[session.accessToken description]];
                                      [text appendString:[NSString stringWithFormat:@",state=\"%@\"",returnState]];
                                      
                                      LISDKAccessToken *accessToken = session.accessToken;
                                      
                                      callback(@[[NSNull null], @{@"accessToken": [accessToken accessTokenValue], @"expiresOn": [accessToken expiration]}]);
                                      //                                      callback(@[[NSNull null], [session value]]);
                                      
                                      
                                  }
                                    errorBlock:^(NSError *error) {
                                        RCTLogInfo(@"%s %@","error called! ", [error description]);
                                        
                                        callback(@[[error description], [NSNull null]]);
                                        
                                    }
     ];
}

@end

