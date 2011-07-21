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

#import "TiUtils.h"
#import "SpriteSheet.h"


@implementation SpriteSheet

-(id)initWithImage:(UIImage*)image_ width:(CGFloat)width_ height:(CGFloat)height_ spacing:(int)spacing_
{
    if ((self = [super initWithFrame:CGRectMake(0, 0, width_, height_)]))
    {
        width = width_;
        height = height_;
        spacing = spacing_;
        currentX = currentY = 0;
        image = [image_ retain];
        
        [self setImage:[self getAt:0 y:0]];
    }
    return self;
}

-(id)initWithPath:(NSString*)name width:(CGFloat)width_ height:(CGFloat)height_ spacing:(NSInteger)spacing_
{
    if ((self = [self initWithImage:[UIImage imageNamed:name] width:width_ height:height_ spacing:spacing_]))
    {
    } 
    return self;
}

-(void)dealloc
{
    RELEASE_TO_NIL(image);
    [super dealloc];
}

-(UIImage*)getAt:(NSInteger)x y:(NSInteger)y
{
    CGRect imageRect = CGRectMake(y * (width + spacing), x * (height + spacing), width, height);
    return [UIImage imageWithCGImage:CGImageCreateWithImageInRect( [image CGImage] , imageRect )];
}

-(void)setImage:(NSInteger)x y:(NSInteger)y
{
    currentX = x;
    currentY = y;
    [self setImage:[self getAt:x y:y]];
}

-(void)startAnimatingAt:(NSInteger)row frames:(NSInteger)frames duration:(NSInteger)duration
{
    currentX = row;
    currentY = 0;
    [self setAnimationDuration:duration / 1000];
    
    NSMutableArray *images = [NSMutableArray array];
    
    NSInteger y = 0;
    NSInteger w = 0;
    NSInteger x = row;
    NSInteger z = 0;
    
    while(z<frames)
    {
        UIImage *img = [self getAt:x y:y];
        if (!img) break;
        z++;
        y++;
        [images addObject:img];
        w+=(width + spacing);
        if (w >= image.size.width)
        {
            x++;
            y=0;
            w=0;
        }
    }
    
    [self setAnimationImages:images];
    [self startAnimating];
}

@end
