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
@synthesize countItem;
@synthesize pickedDate;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSStatusBar *bar = [NSStatusBar systemStatusBar];
    countItem = [[bar statusItemWithLength:NSVariableStatusItemLength] retain];
    pickedDate = [[NSUserDefaults standardUserDefaults] valueForKey:@"pickedDate"];
    if (pickedDate == nil) pickedDate = [NSDate date];
    [self setDate];
    [countItem setAction:@selector(showPrefs:)];
}

-(void)showPrefs:(id)sender {
    [window makeKeyAndOrderFront:self];
}

-(void)setDate {
    NSDate *now = [[NSDate alloc] init];
    NSTimeInterval interval = [pickedDate timeIntervalSinceDate:now];
    int days = (int) round((double) interval / (double) (60 * 60 * 24));
    NSLog(@"interval is %i",days); 
    NSDictionary *defs = [NSDictionary dictionaryWithObject:pickedDate forKey:@"pickedDate"];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defs];
    [[NSUserDefaults standardUserDefaults] synchronize];
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
