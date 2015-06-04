//
//  ViewController.h
//  SlideOutMenu
//
//  Created by Nourdine GHANSUM on 10/05/15.
//  Copyright (c) 2015 Archetapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import <MessageUI/MessageUI.h>
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)


@interface ViewController : UIViewController {

    __weak IBOutlet UITextField *email;
    
    __weak IBOutlet UITextField *passwd;
    
    __weak IBOutlet UILabel *labelEmail;
 
    __weak IBOutlet UILabel *labelPasswd;
    
    __weak IBOutlet UILabel *textField;
    
    
    /* Champs de la page inscription */
    
    __weak IBOutlet UITextField *lastName;
    
    __weak IBOutlet UITextField *firstName;
    
    __weak IBOutlet UITextField *emailUser;

    __weak IBOutlet  UITextField *password;
     
}


@property (weak,nonatomic) IBOutlet UIBarButtonItem *barButton;

- (IBAction)login:(id)sender;
- (IBAction)subscribe:(id)sender;


@end
