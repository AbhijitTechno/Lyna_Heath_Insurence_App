import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/auth/custom_auth/custom_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  LynaAuthUser? initialUser;
  LynaAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(LynaAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => RootPageContext.wrap(
        appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
        errorRoute: state.uri.toString(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => RootPageContext.wrap(
            appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
          ),
        ),
        FFRoute(
          name: OnboardingWidget.routeName,
          path: OnboardingWidget.routePath,
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: SignUpWidget.routeName,
          path: SignUpWidget.routePath,
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: ForgotPasswordWidget.routeName,
          path: ForgotPasswordWidget.routePath,
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: OTPVerifyWidget.routeName,
          path: OTPVerifyWidget.routePath,
          builder: (context, params) => OTPVerifyWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ResetPasswodWidget.routeName,
          path: ResetPasswodWidget.routePath,
          builder: (context, params) => ResetPasswodWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            oTp: params.getParam(
              'oTp',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PasswordResetSuccessWidget.routeName,
          path: PasswordResetSuccessWidget.routePath,
          builder: (context, params) => PasswordResetSuccessWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          requireAuth: true,
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'home') : HomeWidget(),
        ),
        FFRoute(
          name: MyBookingsWidget.routeName,
          path: MyBookingsWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'MyBookings')
              : MyBookingsWidget(),
        ),
        FFRoute(
          name: DocumentsWidget.routeName,
          path: DocumentsWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Documents')
              : DocumentsWidget(),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Profile')
              : ProfileWidget(),
        ),
        FFRoute(
          name: Home2Widget.routeName,
          path: Home2Widget.routePath,
          builder: (context, params) => Home2Widget(),
        ),
        FFRoute(
          name: ResourcesWidget.routeName,
          path: ResourcesWidget.routePath,
          builder: (context, params) => ResourcesWidget(
            sID: params.getParam(
              'sID',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: SpageWidget.routeName,
          path: SpageWidget.routePath,
          builder: (context, params) => SpageWidget(),
        ),
        FFRoute(
          name: ServiceDetailsPageWidget.routeName,
          path: ServiceDetailsPageWidget.routePath,
          builder: (context, params) => ServiceDetailsPageWidget(
            dataItem: params.getParam(
              'dataItem',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ServiceReqFormWidget.routeName,
          path: ServiceReqFormWidget.routePath,
          builder: (context, params) => ServiceReqFormWidget(),
        ),
        FFRoute(
          name: AdvisorsWidget.routeName,
          path: AdvisorsWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'advisors')
              : AdvisorsWidget(),
        ),
        FFRoute(
          name: AdvisorDetailsPageWidget.routeName,
          path: AdvisorDetailsPageWidget.routePath,
          builder: (context, params) => AdvisorDetailsPageWidget(
            dataItem: params.getParam(
              'dataItem',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: BookAppointmentWidget.routeName,
          path: BookAppointmentWidget.routePath,
          builder: (context, params) => BookAppointmentWidget(
            dataItem: params.getParam(
              'dataItem',
              ParamType.JSON,
            ),
            rating: params.getParam(
              'rating',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TermsConditionWidget.routeName,
          path: TermsConditionWidget.routePath,
          builder: (context, params) => TermsConditionWidget(),
        ),
        FFRoute(
          name: AddDocWidget.routeName,
          path: AddDocWidget.routePath,
          builder: (context, params) => AddDocWidget(),
        ),
        FFRoute(
          name: MyyProfileWidget.routeName,
          path: MyyProfileWidget.routePath,
          builder: (context, params) => MyyProfileWidget(),
        ),
        FFRoute(
          name: LanguageWidget.routeName,
          path: LanguageWidget.routePath,
          builder: (context, params) => LanguageWidget(),
        ),
        FFRoute(
          name: HelpWidget.routeName,
          path: HelpWidget.routePath,
          builder: (context, params) => HelpWidget(),
        ),
        FFRoute(
          name: AboutUsWidget.routeName,
          path: AboutUsWidget.routePath,
          builder: (context, params) => AboutUsWidget(),
        ),
        FFRoute(
          name: PrivacyPolicyWidget.routeName,
          path: PrivacyPolicyWidget.routePath,
          builder: (context, params) => PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: ContactUsWidget.routeName,
          path: ContactUsWidget.routePath,
          builder: (context, params) => ContactUsWidget(),
        ),
        FFRoute(
          name: OTPVerifyForEmailWidget.routeName,
          path: OTPVerifyForEmailWidget.routePath,
          builder: (context, params) => OTPVerifyForEmailWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChangeEmailWidget.routeName,
          path: ChangeEmailWidget.routePath,
          builder: (context, params) => ChangeEmailWidget(),
        ),
        FFRoute(
          name: FOLDERDocumentsWidget.routeName,
          path: FOLDERDocumentsWidget.routePath,
          builder: (context, params) => FOLDERDocumentsWidget(
            otem: params.getParam(
              'otem',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: AdminResourceWidget.routeName,
          path: AdminResourceWidget.routePath,
          builder: (context, params) => AdminResourceWidget(),
        ),
        FFRoute(
          name: VcallWidget.routeName,
          path: VcallWidget.routePath,
          builder: (context, params) => VcallWidget(),
        ),
        FFRoute(
          name: AgoraCallScreenWidget.routeName,
          path: AgoraCallScreenWidget.routePath,
          builder: (context, params) => AgoraCallScreenWidget(
            callId: params.getParam(
              'callId',
              ParamType.int,
            ),
            channelName: params.getParam(
              'channelName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: HomeCopyWidget.routeName,
          path: HomeCopyWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HomeCopyWidget(),
        ),
        FFRoute(
          name: AdvisorBookingsWidget.routeName,
          path: AdvisorBookingsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AdvisorBookingsWidget(),
        ),
        FFRoute(
          name: AllRatingReviewPAgeWidget.routeName,
          path: AllRatingReviewPAgeWidget.routePath,
          builder: (context, params) => AllRatingReviewPAgeWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
            avgRate: params.getParam(
              'avgRate',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AdvisorAvailabilityWidget.routeName,
          path: AdvisorAvailabilityWidget.routePath,
          builder: (context, params) => AdvisorAvailabilityWidget(
            date: params.getParam(
              'date',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: NotiWidget.routeName,
          path: NotiWidget.routePath,
          builder: (context, params) => NotiWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Splash_(1).png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
