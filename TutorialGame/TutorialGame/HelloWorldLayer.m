//
//  HelloWorldLayer.m
//  TutorialGame
//
//  Created by Patrick Danford on 1/14/13.
//  Copyright IBM 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (void) gameLogic:(ccTime)dt {
    [self addMonster];
}

- (void) addMonster {
    CCSprite *monster = [CCSprite spriteWithFile:@"monster.png"];
    
    // Determine where to spawn the monster along the Y axis
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int minY = monster.contentSize.height/2;
    int maxY = winSize.height - minY;
    int rangeY = maxY - minY;
    int actualY = (arc4random() % rangeY) + minY;
    
    // Create monster slightly off screen along right edge,
    // and along a random position
    monster.position = ccp(winSize.width + monster.contentSize.width/2, actualY);
    [self addChild:monster];
    
    // Determine monster speed
    int minDuration = 2.0;
    int maxDuration = 4.0;
    int rangeDuration = maxDuration - minDuration;
    int actualDuration = (arc4random() % rangeDuration) + minDuration;
    
    // Create the actions
    CCMoveTo *actionMove = [CCMoveTo actionWithDuration:actualDuration
                                               position:ccp(-monster.contentSize.width/2, actualY)];
    CCCallBlockN *actionMoveDone = [CCCallBlockN actionWithBlock: ^(CCNode *node) {
        [node removeFromParentAndCleanup:YES]; 
    }];
    [monster runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}

// on "init" you need to initialize your instance
-(id) init
{
	if ((self = [super initWithColor:ccc4(255, 255, 255, 255)])) {
        CGSize winSize = [CCDirector sharedDirector].winSize;
        CCSprite *player = [CCSprite spriteWithFile:@"player.png"];
        player.position = ccp(player.contentSize.width/2, winSize.height/2);
        [self addChild:player];
    }
    [self schedule:@selector(gameLogic:) interval:1.0];
    return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
