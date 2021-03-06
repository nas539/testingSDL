//
//  SDLGetSystemCapability.m
//  SmartDeviceLink-iOS
//
//  Created by Joel Fischer on 7/11/17.
//  Copyright © 2017 smartdevicelink. All rights reserved.
//

#import "SDLGetSystemCapability.h"

#import "NSMutableDictionary+Store.h"
#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"
#import "SDLSystemCapabilityType.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLGetSystemCapability

- (instancetype)init {
    if (self = [super initWithName:SDLRPCFunctionNameGetSystemCapability]) {
    }
    return self;
}

- (instancetype)initWithType:(SDLSystemCapabilityType)type {
    self = [self init];
    if (!self) {
        return nil;
    }

    self.systemCapabilityType = type;

    return self;
}

- (instancetype)initWithType:(SDLSystemCapabilityType)type subscribe:(BOOL)subscribe {
    self = [self initWithType:type];
    if (!self) {
        return nil;
    }

    self.subscribe = @(subscribe);

    return self;
}

- (void)setSystemCapabilityType:(SDLSystemCapabilityType)type {
    [parameters sdl_setObject:type forName:SDLRPCParameterNameSystemCapabilityType];
}

- (SDLSystemCapabilityType)systemCapabilityType {
    NSError *error = nil;
    return [parameters sdl_enumForName:SDLRPCParameterNameSystemCapabilityType error:&error];
}

- (void)setSubscribe:(nullable NSNumber<SDLBool> *)subscribe {
    [parameters sdl_setObject:subscribe forName:SDLRPCParameterNameSubscribe];
}

- (nullable NSNumber<SDLBool> *)subscribe {
    return [parameters sdl_objectForName:SDLRPCParameterNameSubscribe ofClass:NSNumber.class error:nil];
}

@end

NS_ASSUME_NONNULL_END
