/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 *
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/widgets.dart';

///
enum HandlerType {
  route,
  function,
}

///
class Handler {
  Handler({this.type = HandlerType.route, this.handlerFunc});

  final HandlerType type;
  final HandlerFunc handlerFunc;
}

///
typedef Route<T> RouteCreator<T>(RouteSettings route, Map<String, List<String>> uriVariable);

///  route mapping
/// [context]
/// [parameters]  page parameter
/// [uriVariables]  route query params or pathname variable
/// [state]       page transfer state
typedef Widget HandlerFunc(BuildContext context, List<dynamic> parameters, Map<String, List<String>> uriVariables,
    [dynamic state]);

typedef Widget HandlerFunc0(BuildContext context, [Map<String, List<String>> uriVariables, dynamic state]);
typedef Widget HandlerFunc1(BuildContext context, arg0, [Map<String, List<String>> uriVariables, dynamic state]);
typedef Widget HandlerFunc2(BuildContext context, arg0, arg1, [Map<String, List<String>> uriVariables, dynamic state]);
typedef Widget HandlerFunc3(BuildContext context, arg0, arg1, arg2,
    [Map<String, List<String>> uriVariables, dynamic state]);
typedef Widget HandlerFunc4(BuildContext context, arg0, arg1, arg2, arg3,
    [Map<String, List<String>> uriVariables, dynamic state]);
typedef Widget HandlerFunc5(BuildContext context, arg0, arg1, arg2, arg3, arg4,
    [Map<String, List<String>> uriVariables, dynamic state]);
typedef Widget HandlerFunc6(BuildContext context, arg0, arg1, arg2, arg3, arg4, arg5,
    [Map<String, List<String>> uriVariables, dynamic state]);
typedef Widget HandlerFunc7(BuildContext context, arg0, arg1, arg2, arg3, arg4, arg5, arg6,
    [Map<String, List<String>> uriVariables, dynamic state]);

Handler handlerFactory0(HandlerFunc0 handler, [HandlerType type]) {
  return Handler(
      type: type,
      handlerFunc: (BuildContext context, List<dynamic> parameters, Map<String, List<String>> uriVariables,
          [dynamic state]) {
        return handler(context, uriVariables, state);
      });
}

Handler handlerFactory1(HandlerFunc1 handler, [HandlerType type]) {
  return Handler(
      type: type,
      handlerFunc: (BuildContext context, List<dynamic> parameters, Map<String, List<String>> uriVariables,
          [dynamic state]) {
        return handler(context, parameters?.first, uriVariables, state);
      });
}

Handler handlerFactory2(HandlerFunc2 handler, [HandlerType type]) {
  return Handler(
      type: type,
      handlerFunc: (BuildContext context, List<dynamic> parameters, Map<String, List<String>> uriVariables,
          [dynamic state]) {
        return handler(context, parameters[0], parameters[1], uriVariables, state);
      });
}

Handler handlerFactory3(HandlerFunc3 handler, [HandlerType type]) {
  return Handler(
      type: type,
      handlerFunc: (BuildContext context, List<dynamic> parameters, Map<String, List<String>> uriVariables,
          [dynamic state]) {
        return handler(context, parameters[0], parameters[1], parameters[2], uriVariables, state);
      });
}

Handler handlerFactory4(HandlerFunc4 handler, [HandlerType type]) {
  return Handler(
      type: type,
      handlerFunc: (BuildContext context, List<dynamic> parameters, Map<String, List<String>> uriVariables,
          [dynamic state]) {
        return handler(context, parameters[0], parameters[1], parameters[2], parameters[3], uriVariables, state);
      });
}

Handler handlerFactory5(HandlerFunc5 handler, [HandlerType type]) {
  return Handler(
      type: type,
      handlerFunc: (BuildContext context, List<dynamic> parameters, Map<String, List<String>> uriVariables,
          [dynamic state]) {
        return handler(
            context, parameters[0], parameters[1], parameters[2], parameters[3], parameters[4], uriVariables, state);
      });
}

Handler handlerFactory6(HandlerFunc6 handler, [HandlerType type]) {
  return Handler(
      type: type,
      handlerFunc: (BuildContext context, List<dynamic> parameters, Map<String, List<String>> uriVariables,
          [dynamic state]) {
        return handler(context, parameters[0], parameters[1], parameters[2], parameters[3], parameters[4],
            parameters[5], uriVariables, state);
      });
}

Handler handlerFactory7(HandlerFunc7 handler, [HandlerType type]) {
  return Handler(
      type: type,
      handlerFunc: (BuildContext context, List<dynamic> parameters, Map<String, List<String>> uriVariables,
          [dynamic state]) {
        return handler(context, parameters[0], parameters[1], parameters[2], parameters[3], parameters[4],
            parameters[5], parameters[6], uriVariables, state);
      });
}

///
class AppRoute {
  String route;
  dynamic handler;
  TransitionType transitionType;

  AppRoute(this.route, this.handler, {this.transitionType});
}

enum TransitionType {
  native,
  nativeModal,
  inFromLeft,
  inFromRight,
  inFromBottom,
  fadeIn,
  custom, // if using custom then you must also provide a transition
  material,
  materialFullScreenDialog,
  cupertino,
  cupertinoFullScreenDialog,
}

enum RouteMatchType {
  visual,
  nonVisual,
  noMatch,
}

///
class RouteMatch {
  RouteMatch(
      {this.matchType = RouteMatchType.noMatch,
      this.route,
      this.errorMessage = "Unable to match route. Please check the logs."});

  final Route<dynamic> route;
  final RouteMatchType matchType;
  final String errorMessage;
}

class RouteNotFoundException implements Exception {
  final String message;
  final String path;

  RouteNotFoundException(this.message, this.path);

  @override
  String toString() {
    return "No registered route was found to handle '$path'";
  }
}
