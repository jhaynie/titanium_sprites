/**
 *  Copyright 2011 Jeff Haynie
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
#import "TiSpriteView.h"


@implementation TiSpriteView

-(void)dealloc
{
    RELEASE_TO_NIL(sprite);
    [super dealloc];
}

-(SpriteSheet*)sprite
{
    if (sprite==nil)
    {
        TiProxy *proxy = self.proxy;
        NSURL *url = [TiUtils toURL:[proxy valueForKey:@"url"] proxy:proxy];
        UIImage *image = [TiUtils toImage:url proxy:proxy];
        CGFloat width = [TiUtils floatValue:[proxy valueForKey:@"width"] def:0];
        CGFloat height = [TiUtils floatValue:[proxy valueForKey:@"height"] def:0];
        CGFloat spacing = [TiUtils floatValue:[proxy valueForKey:@"spacing"] def:0];
        NSInteger x = [TiUtils intValue:[proxy valueForKey:@"x"] def:0];
        NSInteger y = [TiUtils intValue:[proxy valueForKey:@"y"] def:0];
        sprite = [[SpriteSheet alloc] initWithImage:image width:width height:height spacing:spacing];
        [sprite setImage:x y:y];
        [self addSubview:sprite];
    }
    return sprite;
}

-(void)setX_:(id)x
{
    NSInteger y = [TiUtils intValue:[self valueForKey:@"y"] def:0];
    [[self sprite] setImage:[TiUtils intValue:x] y:y];
}

-(void)setY_:(id)y
{
    NSInteger x = [TiUtils intValue:[self valueForKey:@"x"] def:0];
    [[self sprite] setImage:x y:[TiUtils intValue:y]];
}

-(void)setImage:(id)args
{
    NSInteger x = [TiUtils intValue:[args objectAtIndex:0]];
    NSInteger y = [TiUtils intValue:[args objectAtIndex:1]];
    [[self sprite] setImage:x y:y];
}

-(void)startAnimating:(id)args
{
    NSInteger row = [TiUtils intValue:[args objectAtIndex:0]];
    NSInteger frames = [TiUtils intValue:[args objectAtIndex:1]];
    CGFloat duration = [TiUtils floatValue:[args objectAtIndex:2]];
    
    [[self sprite] startAnimatingAt:row frames:frames duration:duration];
}

-(void)stopAnimating:(id)args
{
    [[self sprite] stopAnimating];
}

@end
