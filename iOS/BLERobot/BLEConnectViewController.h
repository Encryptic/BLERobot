//
//  BLEConnectViewController.h
//  BLERobot
//
//  Created by Christopher Theberge on 12/22/12.
//  Copyright (c) 2012 Christopher Theberge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLE.h"

@interface BLEConnectViewController : UIViewController <BLEDelegate, UITableViewDataSource>

// UI Outlets
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *statusSpinner;
@property (strong, nonatomic) IBOutlet UITableView *connectedDeviceList;

// Bluetooth Framework
@property (strong, nonatomic) BLE *bluetoothConnection;

- (IBAction)scanPressed:(id)sender;

@end
