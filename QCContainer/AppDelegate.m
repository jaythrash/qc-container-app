//
//  AppDelegate.m
//  QCContainer
//
//  Created by Jay Thrash on 2/11/14.
//
//

#import "AppDelegate.h"
#import <Quartz/Quartz.h>

@interface AppDelegate()
@property (weak) IBOutlet NSView *view;
@property (retain) QCView *qcView;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Step 1: Add your Quartz Composition file to the Project. (Opt-Cmd-A)
    // Step 2: Replace the FILENAME on line 28 with the name of your Quartz Composition
    //         file without the extension.
    //         Example: if the filename was MyTestComposition.qtz, then you would replace
    //                  "FILENAME" with "MyTestComposition"
    // Step 3: Compile and run
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"FILENAME"
                                                     ofType:@"qtz"];
    
    
    QCComposition *qc = [QCComposition compositionWithFile:path];
    
    
    self.qcView = [[QCView alloc] initWithFrame:CGRectMake(0, 0, self.window.frame.size.width, self.window.frame.size.height)];
    self.qcView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    
    [self.qcView loadComposition:qc];
    [self.view addSubview:self.qcView];
    [self.qcView startRendering];
    self.qcView.eventForwardingMask = NSAnyEventMask;
}

@end

