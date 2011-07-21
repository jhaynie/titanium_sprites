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

#import <UIKit/UIKit.h>


@interface SpriteSheet : UIImageView {
    CGFloat width;
    CGFloat height;
    NSInteger spacing;
    UIImage *image;
    NSInteger currentX;
    NSInteger currentY;
}

-(id)initWithImage:(UIImage*)image width:(CGFloat)width height:(CGFloat)height spacing:(int)spacing;
-(id)initWithPath:(NSString*)name width:(CGFloat)width height:(CGFloat)height spacing:(int)spacing;
-(UIImage*)getAt:(NSInteger)x y:(NSInteger)y;
-(void)setImage:(NSInteger)x y:(NSInteger)y;
-(void)startAnimatingAt:(NSInteger)row frames:(NSInteger)frames duration:(NSInteger)duration;
@end
