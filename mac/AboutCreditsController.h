
#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface AboutCreditsController : NSObject <NSWindowDelegate> {
@private
    NSWindow *window;
}

- (IBAction)showCredits:(id)sender;
- (void)createWindow;

@end
