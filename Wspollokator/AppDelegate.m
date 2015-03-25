//
//  AppDelegate.m
//  Wspollokator
//
//  Created by Piotr Mlynarski on 21.03.2015.
//  Copyright (c) 2015 ADM-IT. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    //  Ta metoda jest wywoływana, gdy aplikacja przechodzi ze stanu aktywnego do nieaktywnego. Może być wywołana w określonych sytuacjach (na przykład w chwili odbywania rozmowy telefonicznej lub po otrzymaniu wiadomości SMS) bądź kiedy użytkownik kończy działanie aplikacji. Metoda rozpoczyna proces przejścia do stanu pozostania w tle. Tę metodę można wykorzystać do wstrzymania wykonywania bieżących zadań, wyłączenia liczników czasu, zmniejszenia liczby klatek generowanych przez OpenGL ES. W grach ta metoda powinna być użyta do wstrzymania gry (pauza).

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Tę metodę należy wykorzystać do zwolnienia zasobów współdzielonych, zapisania danych użytkownika, wyzerowania liczników czasu oraz do przechowania takiej ilości informacji o stanie, która pozwoli na przywrócenie aplikacji do stanu bieżącego. Jeżeli aplikacja obsługuje działanie w tle, w chwili kończenia działania należy wywołać tę metodę zamiast applicationWillTerminate:.

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Ta metoda jest wywoływana podczas przechodzenia aplikacji ze stanu aktywnego do działania w tle. Można więc tutaj wycofać wiele zmian wprowadzonych w chwili przechodzenia do stanu działania w tle.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // W tej metodzie można wznowić działanie zadań zatrzymanych (lub nieuruchomionych), gdy aplikacja była nieaktywna. Jeżeli aplikacja znajdowała się w trybie działania w tle, w metodzie można przeprowadzić odświeżenie interfejsu użytkownika.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Metoda applicationWillTerminate: zapisuje zmiany w kontekście obiektu zarządzanego aplikacji przed zakończeniem działania aplikacji.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.mapoxi.Wspollokator" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Wspollokator" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Wspollokator.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
