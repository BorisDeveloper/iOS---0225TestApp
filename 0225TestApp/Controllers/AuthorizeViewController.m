//
//  AuthorizeViewController.m
//  0225TestApp
//
//  Created by Boris on 01.04.16.
//  Copyright © 2016 Drive App. All rights reserved.
//

#import "AuthorizeViewController.h"
#import "TimeLineViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@interface AuthorizeViewController ()

    @property (weak, nonatomic) IBOutlet UIButton *authorizeBtn;

@end

@implementation AuthorizeViewController {
    
    NSDictionary * feed;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(IBAction)authorize:(id)sender {
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    
    //login for read permissions
    [login logInWithReadPermissions: @[@"user_posts"] fromViewController:self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (!error) {
             
             [login logInWithPublishPermissions:@[@"publish_actions"] fromViewController:self handler:nil];
             
             
             FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                           initWithGraphPath:@"/me/feed"
                                           parameters:nil
                                           HTTPMethod:@"GET"];
             [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                 
                 feed = result;
                 [self performSegueWithIdentifier:@"showFeed" sender:self];
             }];

             
         }

    
    }];
  
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showFeed"]) {
        TimeLineViewController *vc = segue.destinationViewController;
        
        vc.userFeed = feed;
    }
    
    
}


@end
