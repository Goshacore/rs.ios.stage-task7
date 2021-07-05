//
//  AppDelegate.m
//  qweqweqwe
//
//  Created by Heorhi on 2021-07-03.
//

#import "AppDelegate.h"
#import "RSViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    UIWindow *window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    

    RSViewController *rootViewController = [[RSViewController alloc] initWithNibName:@"RSViewController" bundle:nil];
     

    window.rootViewController = rootViewController;

    self.window = window;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


#pragma mark - UISceneSession lifecycle





@end
