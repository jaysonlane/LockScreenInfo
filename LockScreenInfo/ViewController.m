//
//  ViewController.m
//  LockScreenInfo
//
//  Created by Jayson Lane on 3/11/12.
//

#import "ViewController.h"

#import <MediaPlayer/MPNowPlayingInfoCenter.h>
#import <MediaPlayer/MPMediaItem.h>
#import <AVFoundation/AVFoundation.h>


@implementation ViewController

@synthesize playButton, audioPlayer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[AVAudioSession sharedInstance] setDelegate: self];
    
    NSError *myErr;
    
    // Initialize the AVAudioSession here.
    if (![[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&myErr]) {
        // Handle the error here.
        NSLog(@"Audio Session error %@, %@", myErr, [myErr userInfo]);
    }
    else{
        
        [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
        
    }    
    
    
    
    
    audioPlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:@"http://www.cocoanetics.com/files/Cocoanetics_031.mp3"]];
    
    audioPlayer.allowsAirPlay = NO;
    
    [audioPlayer setShouldAutoplay:NO];
    [audioPlayer setControlStyle: MPMovieControlStyleEmbedded];
    audioPlayer.view.hidden = YES;
    
    [audioPlayer prepareToPlay];
    

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)playButtonPress:(id)sender {
    
    [audioPlayer play];
    
    
    
    Class playingInfoCenter = NSClassFromString(@"MPNowPlayingInfoCenter");
    
    if (playingInfoCenter) {

        
        NSMutableDictionary *songInfo = [[NSMutableDictionary alloc] init];
        
        MPMediaItemArtwork *albumArt = [[MPMediaItemArtwork alloc] initWithImage: [UIImage imageNamed:@"AlbumArt"]];
        
        [songInfo setObject:@"Audio Title" forKey:MPMediaItemPropertyTitle];
        [songInfo setObject:@"Audio Author" forKey:MPMediaItemPropertyArtist];
        [songInfo setObject:@"Audio Album" forKey:MPMediaItemPropertyAlbumTitle];
        [songInfo setObject:albumArt forKey:MPMediaItemPropertyArtwork];
        [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:songInfo];


    }
}

@end
