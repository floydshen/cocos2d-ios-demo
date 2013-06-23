//
//  HelloWorldLayer.h
//  VerticalShootingGame
//
//  Created by floyd on 13-6-22.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface VerticalShootingLayer : CCLayer
{
    CCArray *_enemySprites;
    CGPoint _playerVelocity;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
