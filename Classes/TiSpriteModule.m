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

#import "TiSpriteModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiSpriteViewProxy.h"

@implementation TiSpriteModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"0c1fc1ec-55d5-41ae-8c4a-20c6c51537c4";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.sprite";
}


-(id)createSprite:(id)args
{
    return [[[TiSpriteViewProxy alloc] _initWithPageContext:[self executionContext] args:args] autorelease];
}

@end
