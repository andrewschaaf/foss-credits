
#import <Foundation/Foundation.h>
#import "AboutCreditsController.h"

@interface AboutController : NSObject {

@private
    
    NSWindow *window;
    AboutCreditsController *aboutCreditsController;
}

- (void)showAbout;
- (void)createWindow;

@end
