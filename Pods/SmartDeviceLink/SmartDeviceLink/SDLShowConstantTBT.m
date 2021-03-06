//  SDLShowConstantTBT.m
//


#import "SDLShowConstantTBT.h"

#import "NSMutableDictionary+Store.h"
#import "SDLImage.h"
#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"
#import "SDLSoftButton.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLShowConstantTBT

- (instancetype)init {
    if (self = [super initWithName:SDLRPCFunctionNameShowConstantTBT]) {
    }
    return self;
}

- (instancetype)initWithNavigationText1:(nullable NSString *)navigationText1 navigationText2:(nullable NSString *)navigationText2 eta:(nullable NSString *)eta timeToDestination:(nullable NSString *)timeToDestination totalDistance:(nullable NSString *)totalDistance turnIcon:(nullable SDLImage *)turnIcon nextTurnIcon:(nullable SDLImage *)nextTurnIcon distanceToManeuver:(double)distanceToManeuver distanceToManeuverScale:(double)distanceToManeuverScale maneuverComplete:(BOOL)maneuverComplete softButtons:(nullable NSArray<SDLSoftButton *> *)softButtons {
    self = [self init];
    if (!self) {
        return nil;
    }

    self.navigationText1 = navigationText1;
    self.navigationText2 = navigationText2;
    self.eta = eta;
    self.timeToDestination = timeToDestination;
    self.totalDistance = totalDistance;
    self.turnIcon = turnIcon;
    self.nextTurnIcon = nextTurnIcon;
    self.distanceToManeuver = @(distanceToManeuver);
    self.distanceToManeuverScale = @(distanceToManeuverScale);
    self.maneuverComplete = @(maneuverComplete);
    self.softButtons = [softButtons mutableCopy];

    return self;
}

- (void)setNavigationText1:(nullable NSString *)navigationText1 {
    [parameters sdl_setObject:navigationText1 forName:SDLRPCParameterNameNavigationText1];
}

- (nullable NSString *)navigationText1 {
    return [parameters sdl_objectForName:SDLRPCParameterNameNavigationText1 ofClass:NSString.class error:nil];
}

- (void)setNavigationText2:(nullable NSString *)navigationText2 {
    [parameters sdl_setObject:navigationText2 forName:SDLRPCParameterNameNavigationText2];
}

- (nullable NSString *)navigationText2 {
    return [parameters sdl_objectForName:SDLRPCParameterNameNavigationText2 ofClass:NSString.class error:nil];
}

- (void)setEta:(nullable NSString *)eta {
    [parameters sdl_setObject:eta forName:SDLRPCParameterNameETA];
}

- (nullable NSString *)eta {
    return [parameters sdl_objectForName:SDLRPCParameterNameETA ofClass:NSString.class error:nil];
}

- (void)setTimeToDestination:(nullable NSString *)timeToDestination {
    [parameters sdl_setObject:timeToDestination forName:SDLRPCParameterNameTimeToDestination];
}

- (nullable NSString *)timeToDestination {
    return [parameters sdl_objectForName:SDLRPCParameterNameTimeToDestination ofClass:NSString.class error:nil];
}

- (void)setTotalDistance:(nullable NSString *)totalDistance {
    [parameters sdl_setObject:totalDistance forName:SDLRPCParameterNameTotalDistance];
}

- (nullable NSString *)totalDistance {
    return [parameters sdl_objectForName:SDLRPCParameterNameTotalDistance ofClass:NSString.class error:nil];
}

- (void)setTurnIcon:(nullable SDLImage *)turnIcon {
    [parameters sdl_setObject:turnIcon forName:SDLRPCParameterNameTurnIcon];
}

- (nullable SDLImage *)turnIcon {
    return [parameters sdl_objectForName:SDLRPCParameterNameTurnIcon ofClass:SDLImage.class error:nil];
}

- (void)setNextTurnIcon:(nullable SDLImage *)nextTurnIcon {
    [parameters sdl_setObject:nextTurnIcon forName:SDLRPCParameterNameNextTurnIcon];
}

- (nullable SDLImage *)nextTurnIcon {
    return [parameters sdl_objectForName:SDLRPCParameterNameNextTurnIcon ofClass:SDLImage.class error:nil];
}

- (void)setDistanceToManeuver:(nullable NSNumber<SDLFloat> *)distanceToManeuver {
    [parameters sdl_setObject:distanceToManeuver forName:SDLRPCParameterNameDistanceToManeuver];
}

- (nullable NSNumber<SDLFloat> *)distanceToManeuver {
    return [parameters sdl_objectForName:SDLRPCParameterNameDistanceToManeuver ofClass:NSNumber.class error:nil];
}

- (void)setDistanceToManeuverScale:(nullable NSNumber<SDLFloat> *)distanceToManeuverScale {
    [parameters sdl_setObject:distanceToManeuverScale forName:SDLRPCParameterNameDistanceToManeuverScale];
}

- (nullable NSNumber<SDLFloat> *)distanceToManeuverScale {
    return [parameters sdl_objectForName:SDLRPCParameterNameDistanceToManeuverScale ofClass:NSNumber.class error:nil];
}

- (void)setManeuverComplete:(nullable NSNumber<SDLBool> *)maneuverComplete {
    [parameters sdl_setObject:maneuverComplete forName:SDLRPCParameterNameManeuverComplete];
}

- (nullable NSNumber<SDLBool> *)maneuverComplete {
    return [parameters sdl_objectForName:SDLRPCParameterNameManeuverComplete ofClass:NSNumber.class error:nil];
}

- (void)setSoftButtons:(nullable NSArray<SDLSoftButton *> *)softButtons {
    [parameters sdl_setObject:softButtons forName:SDLRPCParameterNameSoftButtons];
}

- (nullable NSArray<SDLSoftButton *> *)softButtons {
    return [parameters sdl_objectsForName:SDLRPCParameterNameSoftButtons ofClass:SDLSoftButton.class error:nil];
}

@end

NS_ASSUME_NONNULL_END
