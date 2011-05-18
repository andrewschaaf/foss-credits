
#import <Foundation/Foundation.h>
#import "AboutCreditsController.h"


@interface AboutController : NSObject <NSWindowDelegate> {
@private
    
    NSWindow *window;
    AboutCreditsController *aboutCreditsController;
}

- (void)showAbout;
- (void)createWindow;

@end
