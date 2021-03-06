//  SDLRPCMessage.m
//


#import "SDLRPCMessage.h"

#import "NSMutableDictionary+Store.h"
#import "SDLRPCParameterNames.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLRPCMessage

@synthesize messageType;

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        function = [[NSMutableDictionary alloc] initWithCapacity:3];
        parameters = [[NSMutableDictionary alloc] init];
        messageType = SDLRPCParameterNameRequest;
        [store setObject:function forKey:messageType];
        [function setObject:parameters forKey:SDLRPCParameterNameParameters];
        [function setObject:name forKey:SDLRPCParameterNameOperationName];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
        NSEnumerator *enumerator = [store keyEnumerator];
        while (messageType = [enumerator nextObject]) {
            if (![messageType isEqualToString:SDLRPCParameterNameBulkData]) {
                break;
            }
        }
        if (messageType != nil) {
            store[messageType] = [store[messageType] mutableCopy];
            function = store[messageType];

            function[SDLRPCParameterNameParameters] = [function[SDLRPCParameterNameParameters] mutableCopy];
            parameters = function[SDLRPCParameterNameParameters];
        }
        self.bulkData = dict[SDLRPCParameterNameBulkData];
    }
    
    return self;
}

- (nullable NSString *)getFunctionName {
    return [function sdl_objectForName:SDLRPCParameterNameOperationName ofClass:NSString.class error:nil];
}

- (void)setFunctionName:(nullable NSString *)functionName {
    [function sdl_setObject:functionName forName:SDLRPCParameterNameOperationName];
}

- (nullable NSObject *)getParameters:(NSString *)functionName {
    return [parameters sdl_objectForName:functionName ofClass:NSObject.class error:nil];
}

- (void)setParameters:(NSString *)functionName value:(nullable NSObject *)value {
    [parameters sdl_setObject:value forName:functionName];
}

- (NSString *)name {
    return [self getFunctionName];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"%@ (%@)\n%@", self.name, self.messageType, self->parameters];

    return description;
}

- (id)copyWithZone:(nullable NSZone *)zone {
    SDLRPCMessage *newMessage = [[self.class allocWithZone:zone] initWithDictionary:self->store];

    return newMessage;
}

@end

NS_ASSUME_NONNULL_END
