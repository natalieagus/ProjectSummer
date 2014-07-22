//
//  MyScene.m
//  ProjectSummer
//
//  Created by CrimsonLycans on 25/5/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene{
    UIScrollView* pageScroller;
    UITapGestureRecognizer *singleTap;
    
    
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"IowanOldStyle-Roman"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontColor = [UIColor blackColor];
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
        //Copying label
        SKLabelNode *myLabel2 = [myLabel copy];
        myLabel2.text = @"hehehe";
        myLabel2.position = CGPointMake(100, 100);
        [self addChild:myLabel2];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    NSLog(@"TOuch!");
    /*for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }*/
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)didMoveToView:(SKView *)view{
    //add gesture recognizer, with the method singletapgesturecaptured, selector identifies the method that is called whenever the tap is captured
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    
    pageScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-50)];
    // Declare the size of the content that will be inside the scroll view
    // This will let the system know how much they can scroll inside
    pageScroller.contentSize = CGSizeMake(self.frame.size.width, 1000);
    
    UILabel *text1 = [ [UILabel alloc ] initWithFrame:CGRectMake(20, 20, self.frame.size.width-40, 30) ];
    text1.textAlignment = NSTextAlignmentLeft;
    text1.font = [UIFont fontWithName:@"Arial" size:(14.0)];
    text1.text = @"Sample element 1";
    text1.textColor = [UIColor whiteColor];
    [pageScroller addSubview:text1];
    
    UILabel *text2 = [ [UILabel alloc ] initWithFrame:CGRectMake(20, 500, self.frame.size.width-40, 30) ];
    text2.textAlignment = NSTextAlignmentLeft;
    text2.font = [UIFont fontWithName:@"Arial" size:(14.0)];
    text2.text = @"Sample element 2";
    text2.textColor = [UIColor whiteColor];
    [pageScroller addSubview:text2];
    [self.scene.view addSubview:pageScroller];
    
    [pageScroller addGestureRecognizer:singleTap];
    
    
}


-(void)singleTapGestureCaptured:(UITapGestureRecognizer*)gesture{
    CGPoint touchPoint=[gesture locationInView:pageScroller];
    NSLog(@"YAY!!!");
    printf("\n %f x %f y \n", touchPoint.x, touchPoint.y);
}

- (void)willMoveFromView:(SKView *)view
{
    [super willMoveFromView:view];
    [pageScroller removeFromSuperview];
}

@end
