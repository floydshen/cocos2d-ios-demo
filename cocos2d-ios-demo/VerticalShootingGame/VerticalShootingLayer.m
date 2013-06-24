//
//  HelloWorldLayer.m
//  VerticalShootingGame
//
//  Created by floyd on 13-6-22.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


// Import the interfaces
#import "VerticalShootingLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - VerticalShootingLayer

enum {
    kTagPlayer = 1,
};

@interface VerticalShootingLayer ()
- (void) spawnEnemy;
- (CCSprite *) getAvailableEnemySprite;
- (void) updatePlayerPosition: (ccTime)dt;
- (void) updatePlayerShooting: (ccTime)dt;
- (void) bulletFinishedMoving: (id)sender;
@end

// HelloWorldLayer implementation
@implementation VerticalShootingLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	VerticalShootingLayer *layer = [VerticalShootingLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        // bg
        CCSprite *bgSprite = [CCSprite spriteWithFile:@"background_1.jpg"];
        bgSprite.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:bgSprite z:0];
        
        // play
        CCSprite *playerSprite = [CCSprite spriteWithFile:@"hero_1.png"];
        playerSprite.position = ccp(winSize.width/2, playerSprite.contentSize.height/2 + 20);
        [self addChild:playerSprite z:4 tag:kTagPlayer];
        
        _enemySprites = [[CCArray alloc] init];
        const int NUM_OF_ENEMIES = 10;
        for (int i = 0; i < NUM_OF_ENEMIES; ++i) {
            CCSprite *enemySprite = [CCSprite spriteWithFile:@"enemy1.png"];
            enemySprite.position = ccp(0, winSize.height + enemySprite.contentSize.height + 10);
            enemySprite.visible = NO;
            [self addChild:enemySprite z:4];
            [_enemySprites addObject:enemySprite];
        }
        
        [self performSelector:@selector(spawnEnemy) withObject:nil afterDelay:1.0f];
        
        
        self.isAccelerometerEnabled = YES;
        
        [self scheduleUpdate]; //游戏的主循环
        
        self.isTouchEnabled = YES;
        _isTouchToShoot = NO;
        
        _bulletSprite = [CCSprite spriteWithFile:@"bullet1.png"];
        _bulletSprite.visible  = NO;
        [self addChild:_bulletSprite z:4];
        
	}
	return self;
}

//- (void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event {
//    _isTouchToShoot = YES;
//}

- (void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CCLOG(@"touch");
    _isTouchToShoot = YES;
}

- (void) updatePlayerShooting:(ccTime)dt {
    if (_bulletSprite.visible || !_isTouchToShoot) {
        return;
    }
    
    CCSprite *playerSprite = (CCSprite *)[self getChildByTag:kTagPlayer];
    CGPoint pos = playerSprite.position;
    
    CGPoint bulletPos = CGPointMake(pos.x, pos.y + playerSprite.contentSize.height/2 + _bulletSprite.contentSize.height);
    _bulletSprite.position = bulletPos;
    _bulletSprite.visible = YES;
    
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    id moveby = [CCMoveBy actionWithDuration:1.0 position:ccp(0, winSize.height-bulletPos.y)];
    id callback = [CCCallFuncN actionWithTarget:self selector:@selector(bulletFinishedMoving:)];
    id ac = [CCSequence actions:moveby, callback, nil];
    [_bulletSprite runAction:ac];
    
}

- (void) bulletFinishedMoving:(id)sender {
    _bulletSprite.visible = NO;
}

- (void) updatePlayerPosition:(ccTime)dt {
    CCSprite *playerSprite = (CCSprite *) [self getChildByTag:kTagPlayer];
    CGPoint pos = playerSprite.position;
    
    pos.x += _playerVelocity.x;
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    float imageWidthHavled = playerSprite.texture.contentSize.width * 0.5f;
    float leftBoderLimit = imageWidthHavled;
    float rightBoderLimit = screenSize.width - imageWidthHavled;
    
    if (pos.x < leftBoderLimit) {
        pos.x = leftBoderLimit;
        _playerVelocity = CGPointZero;
    }else if(pos.x > rightBoderLimit){
        pos.x = rightBoderLimit;
        _playerVelocity = CGPointZero;
    }
    
    playerSprite.position = pos;
    
}

- (void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    float deceleration = 0.4f;
    float sensitivity = 6.0f;
    float maxVelocity = 100;
    _playerVelocity.x = _playerVelocity.x * deceleration + acceleration.x * sensitivity;
    
    if (_playerVelocity.x > maxVelocity) {
        _playerVelocity.x = maxVelocity;
    } else if (_playerVelocity.x < -maxVelocity) {
        _playerVelocity.x = -maxVelocity;
    }
}

- (void) update: (ccTime)dt {
    [self updatePlayerPosition:dt];
    [self updatePlayerShooting:dt];
}

- (void) spawnEnemy {
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    CCSprite *enemySprite = [self getAvailableEnemySprite];
    
    float durationTime = arc4random() % 4 + 1;
    id moveBy = [CCMoveBy actionWithDuration:durationTime position:ccp(0, -enemySprite.position.y - enemySprite.contentSize.height)];
    
    id callback = [CCCallBlockN actionWithBlock:^(id sender) {
        CCSprite *sp = (CCSprite *) sender;
        sp.visible = NO;
        sp.position = ccp(0, winSize.height + sp.contentSize.height + 10);
//        CCLOG(@"reset enemy plane!");
    }];
    
    id action = [CCSequence actions:moveBy, callback, nil];
    
    enemySprite.visible = YES;
    enemySprite.position = ccp(arc4random() % (int) (winSize.width - enemySprite.contentSize.width) + enemySprite.contentSize.width/2, enemySprite.position.y);
//    CCLOG(@"----------------------");
    [enemySprite runAction:action];
    [self performSelector:_cmd withObject:nil afterDelay:arc4random() % 3 + 1];
    
}

- (CCSprite *) getAvailableEnemySprite {
    CCSprite *result = nil;
    CCARRAY_FOREACH(_enemySprites, result) {
        if (!result.visible) {
            break;
        }
    }
    return result;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	[_enemySprites release];
    _enemySprites = nil;
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
