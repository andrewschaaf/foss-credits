
#import "AboutCreditsController.h"


@implementation AboutCreditsController

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (void)dealloc
{
    [window release];
    [super dealloc];
}


- (IBAction)showCredits:(id)sender
{
    if (! window) {
        [self createWindow];
    }
    [window makeKeyAndOrderFront:nil];
}

- (void)windowWillClose:(NSNotification*)notification
{
    window = nil;
}

- (void)createWindow
{
    double w = 780;
    double h = 500;
    window = [[NSWindow alloc]
                initWithContentRect:NSMakeRect(0, 0, w, h)
                styleMask:(NSClosableWindowMask | NSResizableWindowMask | NSMiniaturizableWindowMask)
                backing:NSBackingStoreBuffered
                defer:NO];
    [window setDelegate:self];
    [window setTitle:@"Open Source"];
    [window setReleasedWhenClosed:YES];
    
    [window displayIfNeeded];
    
    NSSize dim = [window frame].size;
    NSRect screen = [[window screen] visibleFrame]; // e.g. origin=0,75 size=1440,803
    [window
     setFrame:NSMakeRect(
                         ((screen.size.width - dim.width) * 0.5),
                         ((screen.size.height - dim.height) * 0.8),
                         dim.width,
                         dim.height)
     display:NO];
    
    
    // Add content:
    
    NSView *view = [window contentView];
    
    WebView *webView = [[WebView alloc]
                            initWithFrame:NSMakeRect(0, 0, w, h)
                            frameName:@"frameName"
                            groupName:@"groupName"];
    
    [view addSubview:webView];
    
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/LICENSES.html"];
	[[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
    
}


@end
