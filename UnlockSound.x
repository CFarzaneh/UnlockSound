//
//  UnlockSound.x
//  UnlockSound
//
//  Created by Sirifl0w on 05.01.2014.
//  Copyright (c) 2014 Sirifl0w. All rights reserved.
//

@interface AVAudioPlayer : NSObject
{}
@property int numberOfLoops;
@property float volume;
- (BOOL)play;
- (id)initWithData:(id)arg1 error:(id *)arg2;
@end


%hook SBLockScreenViewController

- (void)finishUIUnlockFromSource:(int)arg1 {

    %orig();

    NSData *unlockData = [NSData dataWithContentsOfFile:@"/Library/Application Support/UnlockSound/unlock.caf"];

    AVAudioPlayer *AVPlayer = [[AVAudioPlayer alloc] initWithData:unlockData error:nil];
    [AVPlayer setNumberOfLoops:0];
    [AVPlayer play];

    // fix volume 'bug'

}

%end