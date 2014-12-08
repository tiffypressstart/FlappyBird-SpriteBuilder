#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character *)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    //Increment the time since the last obstacle was added
    timeSinceObstacle += delta;//delta is 1/60 a sec
    
    /*Check to see if two seconds have passed*/
    if (timeSinceObstacle > 2.0f){
        [self addObstacle];
        
    //reset
    timeSinceObstacle = 0.0f;
    }
    // put update code here
}

// put new methods here
-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    [character flap];
}

@end
 