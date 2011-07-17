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
    [self setDate];
}

-(void)showPrefs:(id)sender {
    if ([window isVisible]) [window orderOut:self];
    else [window makeKeyAndOrderFront:self];
    [datePicker setDateValue:pickedDate];
}

-(void)setDate {
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
    [self setDate];
}

-(IBAction)quitApp:(id)sender {
    [NSApp terminate:nil];
}

@end
