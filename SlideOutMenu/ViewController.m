//
//  ViewController.m
//  SlideOutMenu
//
//  Created by Nourdine GHANSUM on 10/05/15.
//  Copyright (c) 2015 Archetapp. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "Location.h"
#import <Social/Social.h>
#import "AFHTTPRequestOperationManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
   
    
    NSURL *url = [NSURL URLWithString:@"http://89.82.223.250:9000/country/get"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
             NSArray *result = [greeting objectForKey:@"pays"];
             NSLog(@"%@", result);
             NSEnumerator *iterator = [result objectEnumerator];
             id obj;
             while (obj = [iterator nextObject]) {
                // NSString *idPays = obj[@"fields"][@"id"];
                 NSArray *name = obj[@"name"];
                 NSLog(@"Affichage boucle while : ");
                 NSLog(@"%@", name);
                 
             }
             
         }
     }];
    
   
}


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/* 
*	méthode qui connecte l'utilisateur dans l'appli
*/
- (IBAction)login:(id)sender {

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    NSLog(@"Email saisie : %@ ",email.text);
    NSLog(@"Mot de passe saisie :  %@ ",passwd.text);
    
    NSDictionary *params = @ {@"email" :email.text, @"password" :passwd.text};
    NSString *urlPost = @"http://89.82.223.250:9000/Authentification/login";
    
    [manager POST:urlPost parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"JSON: %@", responseObject);
       
    }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         //NSLog(@"Error: %@", error);
         NSLog(@"Error: erreur d'authentification au serveur....");
     }];
    
    
}


/*
 *  Inscription d'un user
 */

- (IBAction)subscribe:(id)sender {
  
   AFHTTPRequestOperationManager *managerB = [AFHTTPRequestOperationManager manager];
    managerB.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *paramsB = @ {@"lastName" :lastName.text, @"firstName" :firstName.text, @"email" :emailUser.text, @"password" :password.text, @"stateUser" :@"EN_RECHERCHE" };
    NSLog(@"Avant urlPost : %@ ",lastName.text);

    NSString *urlP = @"http://89.82.223.250:9000/userAdd";
    NSLog(@"Après urlPost : %@ ",lastName.text);

    [managerB POST:urlP parameters:paramsB
          success:^(AFHTTPRequestOperation *operationB, id responseObjectB)
     {
         NSLog(@"JSON: %@", responseObjectB);
         
     }
          failure:
     ^(AFHTTPRequestOperation *operationB, NSError *error) {
         NSLog(@"Error: impossible d'ajouter l'utilisateur %@", lastName.text);
     }];
   }


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender  {
    
    if ( [email.text  isEqual:@""] && [passwd.text  isEqual:@""]) {
        NSLog(@"Connexion : NON");
        return NO;
    }
    NSLog(@"Connexion : YES");
    return YES;
}

@end
