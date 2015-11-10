//
//  ViewController.m
//  AuthTutorial
//
//  Created by Pablo Ortega Mesa on 09-11-15.
//  Copyright © 2015 khrno.cl. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)authenticateButtonTapped:(id)sender
{
    LAContext *context = [[LAContext alloc] init];
    
    NSError *error = nil;
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
    {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:@"Are you the device owner?"
                          reply:^(BOOL success, NSError * _Nullable error) {
                              if (error) {
                                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                                 message:@"There was a problem verifying your identify."
                                                                                          preferredStyle:UIAlertControllerStyleAlert];
                                  UIAlertAction *yesButton = [UIAlertAction actionWithTitle:@"OK"
                                                                                      style:UIAlertActionStyleDefault
                                                                                    handler:^(UIAlertAction *action){
                                                                                        [alert dismissViewControllerAnimated:YES completion:nil];
                                                                                    }];
                                  UIAlertAction *noButton = [UIAlertAction actionWithTitle:@"Cancel"
                                                                                     style:UIAlertActionStyleCancel
                                                                                   handler:^(UIAlertAction *action){
                                                                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                                                                   }];
                                  [alert addAction: yesButton];
                                  [alert addAction:noButton];
                                  [self presentViewController:alert animated:YES completion:nil];
                                  
                                  
                                  return;
                              }
                              if (success) {
                                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Success"
                                                                                                 message:@"You are the device owner!"
                                                                                          preferredStyle:UIAlertControllerStyleAlert];
                                  UIAlertAction *yesButton = [UIAlertAction actionWithTitle:@"OK"
                                                                                      style:UIAlertActionStyleDefault
                                                                                    handler:^(UIAlertAction *action){
                                                                                        [alert dismissViewControllerAnimated:YES completion:nil];
                                                                                    }];
                                  UIAlertAction *noButton = [UIAlertAction actionWithTitle:@"Cancel"
                                                                                     style:UIAlertActionStyleCancel
                                                                                   handler:^(UIAlertAction *action){
                                                                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                                                                   }];
                                  [alert addAction: yesButton];
                                  [alert addAction:noButton];
                                  [self presentViewController:alert animated:YES completion:nil];
                              }
                              else{
                                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                                 message:@"You are not the device owner!"
                                                                                          preferredStyle:UIAlertControllerStyleAlert];
                                  UIAlertAction *yesButton = [UIAlertAction actionWithTitle:@"OK"
                                                                                      style:UIAlertActionStyleDefault
                                                                                    handler:^(UIAlertAction *action){
                                                                                        [alert dismissViewControllerAnimated:YES completion:nil];
                                                                                    }];
                                  UIAlertAction *noButton = [UIAlertAction actionWithTitle:@"Cancel"
                                                                                     style:UIAlertActionStyleCancel
                                                                                   handler:^(UIAlertAction *action){
                                                                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                                                                   }];
                                  [alert addAction: yesButton];
                                  [alert addAction:noButton];
                                  [self presentViewController:alert animated:YES completion:nil];
                              }
                          }];
    }
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"Your device cannot authenticate using TouchID"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *yesButton = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action){
                                                              [alert dismissViewControllerAnimated:YES completion:nil];
                                                          }];
        UIAlertAction *noButton = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action){
                                                             [alert dismissViewControllerAnimated:YES completion:nil];
                                                         }];
        [alert addAction: yesButton];
        [alert addAction:noButton];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
}

@end
