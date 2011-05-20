
#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface AboutCreditsController : NSObject {
  
@private
    NSWindow *window;
}

- (IBAction)showCredits:(id)sender;
- (void)createWindow;

@end
