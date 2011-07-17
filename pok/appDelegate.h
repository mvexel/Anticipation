//
//  appDelegate.h
//  Anticipation
//
//  Created by Martijn van Exel on 7/16/11.
//  Copyright 2011 Very Furry. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface pokAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
    NSStatusItem *countItem;
    IBOutlet NSButton *quitButton;
    IBOutlet NSDatePicker *datePicker;
    NSDate *pickedDate;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic,retain) NSStatusItem *countItem;
@property (nonatomic,retain) NSDate *pickedDate;

-(void)showPrefs:(id)sender;
-(void)setDate;
-(IBAction)datePicked:(id)sender;
-(IBAction)quitApp:(id)sender;
@end
