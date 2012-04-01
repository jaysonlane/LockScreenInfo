//
//  ViewController.h
//  LockScreenInfo
//
//  Created by Jayson Lane on 3/11/12.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MPMoviePlayerController.h>

@interface ViewController : UIViewController {
    
    IBOutlet UIButton *playButton;
    MPMoviePlayerController *audioPlayer;
    
}

@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) MPMoviePlayerController *audioPlayer;

-(IBAction)playButtonPress:(id)sender;

@end
