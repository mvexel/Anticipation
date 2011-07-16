//
//  pokAppDelegate.h
//  pok
//
//  Created by Martijn van Exel on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface pokAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
    IBOutlet NSButton *quitButton;
    IBOutlet NSDatePicker *datePicker;
}

@property (assign) IBOutlet NSWindow *window;

-(void)showPrefs:(id)sender;
-(IBAction)datePicked:(id)sender;
-(IBAction)quitApp:(id)sender;
@end
