//
//  addPostViewController.m
//  0225TestApp
//
//  Created by Boris on 01.04.16.
//  Copyright © 2016 Drive App. All rights reserved.
//

#import "AddPostViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface AddPostViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTF;
@property (weak, nonatomic) IBOutlet UITextView *messageTF;
@property (weak, nonatomic) IBOutlet UITextField *linkTF;

@end

@implementation AddPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Add post";
    
}
- (IBAction)postToFaceBook:(id)sender {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   self.titleTF.text, @"name",
                                   self.messageTF.text, @"caption",
                                   @"Post made for 0225 Test app", @"description",
                                   self.linkTF.text, @"link",
                                   nil];
    
    
    
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:@"/me/feed"
                                  parameters:params
                                  HTTPMethod:@"POST"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        
        NSString * alertTitle;
        NSString * alertMessage;
        if (!error) {
            
            alertMessage    = @"Post is published";
            alertTitle      = @"Success";
        
        }
        else {
            
            alertMessage    = error.description;
            alertTitle      = @"Error";
            
        }
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:alertTitle
                                              message:alertMessage
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:nil];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];

    }];
    
    
    
}
- (IBAction)cancel:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



@end
