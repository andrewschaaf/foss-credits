
#import "AboutController.h"


@implementation AboutController

- (id)init
{
    self = [super init];
    if (self) {
        aboutCreditsController = [[AboutCreditsController alloc] init];
    }
    
    return self;
}

- (void)showAbout
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
    window = [[NSWindow alloc]
              initWithContentRect:NSMakeRect(0, 0, 400, 300)
              styleMask:(NSClosableWindowMask | NSResizableWindowMask | NSMiniaturizableWindowMask)
              backing:NSBackingStoreBuffered
              defer:NO];
    [window setDelegate:self];
    [window setTitle:@""];
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
    
    NSButton *button = [[NSButton alloc] initWithFrame:NSMakeRect(10, 10, 300, 30)];
    [button setTitle:@"Show Open Source Licenses"];
    [button setTarget:aboutCreditsController];
    [button setAction:@selector(showCredits:)];
    
    [view addSubview:button];
}

- (void)dealloc
{
    [window release];
    [aboutCreditsController release];
    [super dealloc];
}

@end
