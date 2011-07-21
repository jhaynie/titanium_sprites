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
 
#import "TiSpriteViewProxy.h"


@implementation TiSpriteViewProxy

-(NSArray *)keySequence
{
	return [NSArray arrayWithObjects:
			@"url",
			@"width",
			@"height",
			@"spacing",
			nil];
}

-(void)setImage:(id)args
{
    [[self view] performSelectorOnMainThread:@selector(setImage:) withObject:args waitUntilDone:NO];
}

-(void)startAnimating:(id)args
{
    [[self view] performSelectorOnMainThread:@selector(startAnimating:) withObject:args waitUntilDone:NO];
}

-(void)stopAnimating:(id)args
{
    [[self view] performSelectorOnMainThread:@selector(stopAnimating:) withObject:args waitUntilDone:NO];
}

@end
