//
//  pokAppDelegate.m
//  pok
//
//  Created by Martijn van Exel on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "pokAppDelegate.h"

@implementation pokAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSStatusBar *bar = [NSStatusBar systemStatusBar];
    NSStatusItem *countItem = [[bar statusItemWithLength:NSVariableStatusItemLength] retain];
    [countItem setTitle:@"10"];
    [countItem setAction:@selector(showPrefs:)];
}

-(void)showPrefs:(id)sender {
    [window 
}

-(IBAction)datePicked:(id)sender {
    
}

-(IBAction)quitApp:(id)sender {
    [NSApp terminate:nil];
}

@end
