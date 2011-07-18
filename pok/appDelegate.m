//
//  appDelegate.m
//  Anticipation
//
//  Created by Martijn van Exel on 7/16/11.
//  Copyright 2011 Very Furry. All rights reserved.
//

#import "appDelegate.h"

@implementation pokAppDelegate

@synthesize window;
@synthesize countItem;
@synthesize pickedDate;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSStatusBar *bar = [NSStatusBar systemStatusBar];
    countItem = [[bar statusItemWithLength:NSVariableStatusItemLength] retain];
    [countItem setAction:@selector(showPrefs:)];
    NSUserDefaults *d = [NSUserDefaults standardUserDefaults];
    pickedDate = [d objectForKey:@"pickedDate"];
    NSLog(@"got %@ from prefs",[pickedDate description]);
    if (pickedDate == nil) pickedDate = [NSDate date];
    [self setDate:nil];
    hourTimer = [NSTimer timerWithTimeInterval:3600 target:self selector:@selector(setDate:) userInfo:nil repeats:YES];
    [hourTimer fire];
    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver: self 
                                                           selector: @selector(receiveWakeNote:) 
                                                               name: NSWorkspaceDidWakeNotification 
                                                             object: NULL];
}

-(void)showPrefs:(id)sender {
    if ([window isVisible]) [window orderOut:self];
    else [window orderFrontRegardless];
    [datePicker setDateValue:pickedDate];
    [versionTextField setTitleWithMnemonic:[NSString stringWithFormat:@"v%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]]];
}

-(void)setDate:(NSTimer *)theTimer {
    NSDate *now = [[NSDate alloc] init];
    NSTimeInterval interval = [pickedDate timeIntervalSinceDate:now];
    int days = (int) round((double) interval / (double) (60 * 60 * 24));
    NSUserDefaults *d = [NSUserDefaults standardUserDefaults];
    [d setObject:pickedDate forKey:@"pickedDate"];
    [countItem setTitle:[NSString stringWithFormat:@"%i",days]];
}

-(IBAction)datePicked:(id)sender {
    NSDatePicker *p = (NSDatePicker *) sender;
    pickedDate = [p dateValue];
    [self setDate:nil];
}

-(IBAction)quitApp:(id)sender {
    [NSApp terminate:nil];
}

-(void)receiveWakeNote:(NSNotification*)note {
    NSLog(@"receiveSleepNote: %@", [note name]);
    [self setDate:nil];
}

@end
