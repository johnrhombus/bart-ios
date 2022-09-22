//
//  ViewController.m
//  bart-app
//
//  Created by John Anderson on 9/22/22.
//

#import "ViewController.h"

static NSString * GET_STATIONS =   @"https://api.bart.gov/api/stn.aspx?cmd=stns&key=MW9S-E7SL-26DU-VV8V&json=y";
static NSString * GET_DEPARTURES_FMT = @"https://api.bart.gov/api/etd.aspx?cmd=etd&orig=%@";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    
    NSURL *url = [NSURL URLWithString:GET_STATIONS];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData * _Nullable data,
                                                                NSURLResponse * _Nullable response,
                                                                NSError * _Nullable error) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
        NSLog(@"Got response %@", json);
    }];
    
    [task resume];

}


@end
