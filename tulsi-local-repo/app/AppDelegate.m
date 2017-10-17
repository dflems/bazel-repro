#import "AppDelegate.h"
#import <MyLib.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    MyLib *lib = [MyLib new];
    [lib doTheThing];
    return YES;
}

@end
