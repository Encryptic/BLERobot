//
//  BLEConnectViewController.m
//  BLERobot
//
//  Created by Christopher Theberge on 12/22/12.
//  Copyright (c) 2012 Christopher Theberge. All rights reserved.
//

#import "BLEConnectViewController.h"

@interface BLEConnectViewController ()

@end

@implementation BLEConnectViewController

@synthesize bluetoothConnection, statusLabel, statusSpinner, connectedDeviceList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    bluetoothConnection = [[BLE alloc] init];
    [bluetoothConnection controlSetup:1];
    bluetoothConnection.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)scanPressed:(id)sender {
    [statusSpinner startAnimating];
    [bluetoothConnection findBLEPeripherals:1];
    
    //[self performSegueWithIdentifier:@"connected" sender:self];
    
    [NSTimer scheduledTimerWithTimeInterval:(float)2.0 target:self selector:@selector(connectionTimer:) userInfo:nil repeats:NO];
}

-(void) connectionTimer:(NSTimer *)timer
{
    [connectedDeviceList reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[bluetoothConnection peripherals] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    [[cell textLabel] setText:[[[bluetoothConnection peripherals] objectAtIndex:indexPath.item] name]];
    
    return cell;
}

@end
