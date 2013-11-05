//
//  MyScene.m
//  CropShapeTest
//
//  Created by Peter Wong on 4/11/13.
//  Copyright (c) 2013 iCare4u. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        /*
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
         */
        
        CGRect rect = self.frame;
        
        [self createNormalSprite];
        
        [self createNormalSquare];
        
        [self createNormalCropNoFill];
        
        [self createNormalCropWithFill];
        
        [self createNormalParallelogram];
        
        [self createCropParallelogramNoFill];
        
        [self createCropParallelogramFill];
        
        
        // normal sprite
        SKSpriteNode* normalSprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship.png"];
        normalSprite.position = CGPointMake( rect.size.width / 3.0, rect.size.height / 3.0 );
        SKShapeNode* squareSprite = [[SKShapeNode alloc] init];
        CGMutablePathRef path = CGPathCreateMutable();
        CGPoint squareCenter = CGPointMake( rect.size.width * 2.0 / 3.0 , rect.size.height / 3.0 );
        // right top clockwise
        CGPathMoveToPoint( path, Nil, squareCenter.x - 50, squareCenter.y + 50 );
        CGPathAddLineToPoint(path, nil, squareCenter.x + 50, squareCenter.y + 50 );
        CGPathAddLineToPoint(path, nil, squareCenter.x + 50, squareCenter.y - 50 );
        CGPathAddLineToPoint(path, nil, squareCenter.x - 50, squareCenter.y - 50 );
        CGPathAddLineToPoint(path, nil, squareCenter.x + 50, squareCenter.y + 50 );
        squareSprite.path = path;
        SKCropNode* squareCrop = [[SKCropNode alloc] init];
        squareCrop.maskNode = squareSprite;
    }
    return self;
}

- (void)createNormalSprite;
{
    CGRect rect = self.frame;
    SKSpriteNode* normalSprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship.png"];
    normalSprite.position = CGPointMake( rect.size.width / 4.0, rect.size.height * 3.0 / 4.0 );
    
    SKLabelNode* label = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    label.text = @"Sprite";
    label.position = CGPointMake( rect.size.width / 4.0, rect.size.height * 3.0 / 4.0 - 60.0 );
    label.fontSize = 15.0;
    
    [self addChild:normalSprite];
    [self addChild:label];
}

- (void)createNormalSquare;
{
    CGRect rect = self.frame;
    
    SKShapeNode* squareSprite = [[SKShapeNode alloc] init];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint squareCenter = CGPointMake( rect.size.width * 1.0 / 4.0 , rect.size.height * 2.0 / 4.0 );
    // right top clockwise
    CGPathMoveToPoint( path, Nil, squareCenter.x - 20, squareCenter.y + 20 );
    CGPathAddLineToPoint(path, nil, squareCenter.x + 20, squareCenter.y + 20 );
    CGPathAddLineToPoint(path, nil, squareCenter.x + 20, squareCenter.y - 20 );
    CGPathAddLineToPoint(path, nil, squareCenter.x - 20, squareCenter.y - 20 );
    CGPathAddLineToPoint(path, nil, squareCenter.x - 20, squareCenter.y + 20 );
    squareSprite.path = path;
    
    SKLabelNode* label = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    label.text = @"Square";
    label.position = CGPointMake( rect.size.width * 1.0 / 4.0, rect.size.height * 2.0 / 4.0 - 60.0 );
    label.fontSize = 15.0;
    
    [self addChild:squareSprite];
    [self addChild:label];
    
}

- (void)createNormalCropNoFill;
{
    CGRect rect = self.frame;
    
    SKSpriteNode* normalSprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship.png"];
    normalSprite.position = CGPointMake( rect.size.width * 2.0 / 4.0, rect.size.height * 2.0 / 4.0 );
    
    SKShapeNode* squareSprite = [[SKShapeNode alloc] init];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint squareCenter = CGPointMake( rect.size.width * 2.0 / 4.0 , rect.size.height * 2.0 / 4.0 );
    // right top clockwise
    CGPathMoveToPoint( path, Nil, squareCenter.x - 20, squareCenter.y + 20 );
    CGPathAddLineToPoint(path, nil, squareCenter.x + 20, squareCenter.y + 20 );
    CGPathAddLineToPoint(path, nil, squareCenter.x + 20, squareCenter.y - 20 );
    CGPathAddLineToPoint(path, nil, squareCenter.x - 20, squareCenter.y - 20 );
    CGPathAddLineToPoint(path, nil, squareCenter.x - 20, squareCenter.y + 20 );
    squareSprite.path = path;
    SKCropNode* squareCrop = [[SKCropNode alloc] init];
    squareCrop.maskNode = squareSprite;
    [squareCrop addChild:normalSprite];
    
    SKLabelNode* label = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    label.text = @"Square Crop no Fill";
    label.position = CGPointMake( rect.size.width * 2.0 / 4.0, rect.size.height * 2.0 / 4.0 - 60.0 );
    label.fontSize = 15.0;
    
    [self addChild:squareCrop];
    [self addChild:label];
    
}
- (void)createNormalCropWithFill;
{
    CGRect rect = self.frame;
    
    SKSpriteNode* normalSprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship.png"];
    normalSprite.position = CGPointMake( rect.size.width * 3.0 / 4.0, rect.size.height * 2.0 / 4.0 );
    
    SKShapeNode* squareSprite = [[SKShapeNode alloc] init];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint squareCenter = CGPointMake( rect.size.width * 3.0 / 4.0 , rect.size.height * 2.0 / 4.0 );
    // right top clockwise
    CGPathMoveToPoint( path, Nil, squareCenter.x - 20, squareCenter.y + 20 );
    CGPathAddLineToPoint(path, nil, squareCenter.x + 20, squareCenter.y + 20 );
    CGPathAddLineToPoint(path, nil, squareCenter.x + 20, squareCenter.y - 20 );
    CGPathAddLineToPoint(path, nil, squareCenter.x - 20, squareCenter.y - 20 );
    CGPathAddLineToPoint(path, nil, squareCenter.x - 20, squareCenter.y + 20 );
    squareSprite.path = path;
    squareSprite.fillColor = [SKColor whiteColor];
    SKCropNode* squareCrop = [[SKCropNode alloc] init];
    squareCrop.maskNode = squareSprite;
    [squareCrop addChild:normalSprite];
    
    SKLabelNode* label = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    label.text = @"Square Crop with Fill";
    label.position = CGPointMake( rect.size.width * 3.0 / 4.0, rect.size.height * 2.0 / 4.0 - 60.0 );
    label.fontSize = 15.0;
    
    [self addChild:squareCrop];
    [self addChild:label];
    
}

- (void)createNormalParallelogram;
{
    CGRect rect = self.frame;
    
    SKShapeNode* pSprite = [[SKShapeNode alloc] init];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint squareCenter = CGPointMake( rect.size.width * 1.0 / 4.0 , rect.size.height * 1.0 / 4.0 );
    // right top clockwise
    CGPathMoveToPoint( path, Nil, squareCenter.x - 0, squareCenter.y + 35 );
    CGPathAddLineToPoint(path, nil, squareCenter.x + 35, squareCenter.y + 35 );
    CGPathAddLineToPoint(path, nil, squareCenter.x + 0, squareCenter.y - 35 );
    CGPathAddLineToPoint(path, nil, squareCenter.x - 35, squareCenter.y - 35 );
    CGPathAddLineToPoint(path, nil, squareCenter.x - 0, squareCenter.y + 35 );
    pSprite.path = path;
    
    SKLabelNode* label = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    label.text = @"Parallelogram";
    label.position = CGPointMake( rect.size.width * 1.0 / 4.0, rect.size.height * 1.0 / 4.0 - 60.0 );
    label.fontSize = 15.0;
    
    [self addChild:pSprite];
    [self addChild:label];
    
}

- (void)createCropParallelogramNoFill;
{
    CGRect rect = self.frame;
    
    SKSpriteNode* normalSprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship.png"];
    normalSprite.position = CGPointMake( rect.size.width * 2.0 / 4.0, rect.size.height * 1.0 / 4.0 );
    
    SKShapeNode* pSprite = [[SKShapeNode alloc] init];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint squareCenter = CGPointMake( rect.size.width * 2.0 / 4.0 , rect.size.height * 1.0 / 4.0 );
    // right top clockwise
    CGPathMoveToPoint( path, Nil, squareCenter.x - 0, squareCenter.y + 35 );
    CGPathAddLineToPoint(path, nil, squareCenter.x + 35, squareCenter.y + 35 );
    CGPathAddLineToPoint(path, nil, squareCenter.x + 0, squareCenter.y - 35 );
    CGPathAddLineToPoint(path, nil, squareCenter.x - 35, squareCenter.y - 35 );
    CGPathAddLineToPoint(path, nil, squareCenter.x - 0, squareCenter.y + 35 );
    pSprite.path = path;
    SKCropNode* squareCrop = [[SKCropNode alloc] init];
    squareCrop.maskNode = pSprite;
    [squareCrop addChild:normalSprite];
    
    SKLabelNode* label = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    label.text = @"P'gram Crop no Fill";
    label.position = CGPointMake( rect.size.width * 2.0 / 4.0, rect.size.height * 1.0 / 4.0 - 60.0 );
    label.fontSize = 15.0;
    
    [self addChild:squareCrop];
    [self addChild:label];
    
}

- (void)createCropParallelogramFill;
{
    CGRect rect = self.frame;
    
    SKSpriteNode* normalSprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship.png"];
    normalSprite.position = CGPointMake( rect.size.width * 3.0 / 4.0, rect.size.height * 1.0 / 4.0 );
    
    SKShapeNode* pSprite = [[SKShapeNode alloc] init];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint squareCenter = CGPointMake( rect.size.width * 3.0 / 4.0 , rect.size.height * 1.0 / 4.0 );
    // right top clockwise
    CGPathMoveToPoint( path, Nil, squareCenter.x - 0, squareCenter.y + 35 );
    CGPathAddLineToPoint(path, nil, squareCenter.x + 35, squareCenter.y + 35 );
    CGPathAddLineToPoint(path, nil, squareCenter.x + 0, squareCenter.y - 35 );
    CGPathAddLineToPoint(path, nil, squareCenter.x - 35, squareCenter.y - 35 );
    CGPathAddLineToPoint(path, nil, squareCenter.x - 0, squareCenter.y + 35 );
    pSprite.path = path;
    pSprite.fillColor = [SKColor whiteColor];
    SKCropNode* squareCrop = [[SKCropNode alloc] init];
    squareCrop.maskNode = pSprite;
    [squareCrop addChild:normalSprite];
    
    SKLabelNode* label = [SKLabelNode labelNodeWithFontNamed:@"Helvetica"];
    label.text = @"P'gram Crop with Fill";
    label.position = CGPointMake( rect.size.width * 3.0 / 4.0, rect.size.height * 1.0 / 4.0 - 60.0 );
    label.fontSize = 15.0;
    
    [self addChild:squareCrop];
    [self addChild:label];
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
