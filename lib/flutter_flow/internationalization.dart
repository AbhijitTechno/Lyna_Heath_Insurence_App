import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // onboarding
  {
    'oscv2mi8': {
      'en': 'Skip',
      'es': 'Saltar',
    },
    '8z1xre8g': {
      'en': 'Connect with Specialists',
      'es': 'Conéctese con especialistas',
    },
    '8vhlpfww': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
    },
    '8pgmkums': {
      'en': 'Personalized Consultation at Your Fingertips',
      'es': 'Consulta personalizada a tu alcance',
    },
    '9k0ovwhp': {
      'en': 'Hassle-Free Appointment \nScheduling',
      'es': 'Programación de citas sin complicaciones',
    },
    'x1gxqjnx': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
    },
    '4rr0vnu8': {
      'en': 'Choose A Language To Continue:',
      'es': '',
    },
    'jags7pj4': {
      'en': 'ENGLISH',
      'es': 'INGLÉS',
    },
    'bl1syc6t': {
      'en': 'SPANISH',
      'es': 'ESPAÑOL',
    },
    '9ax9ly1j': {
      'en': 'NEXT',
      'es': 'PRÓXIMO',
    },
    '8s60j9yu': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Login
  {
    'sw0pj9c2': {
      'en': 'Sign In To Your Account',
      'es': 'Iniciar sesión en su cuenta',
    },
    '5f8mip9l': {
      'en': 'Welcome back! Please enter your details',
      'es': '¡Bienvenido de nuevo! Por favor, introduzca sus datos',
    },
    'wymu34i7': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    '8zagbdjw': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'j1ysc6yn': {
      'en': 'Forgot Password ?',
      'es': 'Has olvidado tu contraseña',
    },
    '2e1r5l8c': {
      'en': 'Login',
      'es': 'Acceso',
    },
    'icqf1c2x': {
      'en': 'Don’t have any account?',
      'es': '¿No tienes ninguna cuenta?',
    },
    '17svj73t': {
      'en': ' Sign up',
      'es': 'Inscribirse',
    },
    '27u3o2ns': {
      'en': 'or',
      'es': 'o',
    },
    'e4lwpe92': {
      'en': 'Sign in with Google',
      'es': 'Iniciar sesión con Google',
    },
    'ddurnd3o': {
      'en': 'Sign in with Facebook',
      'es': 'Iniciar sesión con Facebook',
    },
    'a7akf9sh': {
      'en': 'Email is required',
      'es': 'Se requiere correo electrónico',
    },
    'qlurlfqd': {
      'en': 'email is invalid',
      'es': 'El correo electrónico no es válido',
    },
    '0dgjmj0m': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    'suj3yxhg': {
      'en': 'Password is required',
      'es': 'Se requiere contraseña',
    },
    '847lsaqf': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    'c98hisl9': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // SignUp
  {
    'nf3oqypo': {
      'en': 'Create An Account',
      'es': 'Crear una cuenta',
    },
    'xx1j58kk': {
      'en': 'Create an account to enjoy all services',
      'es': 'Crea una cuenta para disfrutar de todos los servicios',
    },
    'xdhlnycq': {
      'en': 'End User',
      'es': 'Usuario final',
    },
    'gyszxvsq': {
      'en': 'Service Provider',
      'es': 'Proveedor',
    },
    '91zp4la5': {
      'en': 'First Name',
      'es': 'Nombre de pila',
    },
    'yw3wq2oi': {
      'en': 'Last Name',
      'es': 'Apellido',
    },
    '82hqozwj': {
      'en': 'Contact Number',
      'es': 'Número de contacto',
    },
    'itf114bo': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    '9duo6umg': {
      'en': 'Select Profession...',
      'es': 'Seleccione Profesión...',
    },
    '0v0vzsob': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'w2rim5sy': {
      'en': 'Option 1',
      'es': 'Opción 1',
    },
    'vpw470jr': {
      'en': 'Option 2',
      'es': 'Opción 2',
    },
    '5hbvuhgd': {
      'en': 'Option 3',
      'es': 'Opción 3',
    },
    'i84x8opn': {
      'en': '18-29',
      'es': '18-29',
    },
    'tuk9o4wt': {
      'en': 'Select age group...',
      'es': 'Seleccione grupo de edad...',
    },
    'sxsx3oaz': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'qvw66s9s': {
      'en': '18 to 29',
      'es': '18 a 29',
    },
    '77eh7z58': {
      'en': '30 to 49',
      'es': '30 a 49',
    },
    '5qmvdmud': {
      'en': 'Above 49',
      'es': 'Más de 49',
    },
    'kej9wza8': {
      'en': 'Male',
      'es': 'Masculino',
    },
    'emat99e3': {
      'en': 'Select gender...',
      'es': 'Seleccione género...',
    },
    '71r3ovkg': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'brn0iveg': {
      'en': 'Male',
      'es': 'Masculino',
    },
    'mh5xpfcw': {
      'en': 'Female',
      'es': 'Femenino',
    },
    'piw1tcmp': {
      'en': 'Other',
      'es': 'Otro',
    },
    'w6jsbtwl': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'd742xa70': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
    },
    'tvwffoj7': {
      'en': 'Accept',
      'es': 'Aceptar',
    },
    '6ffd7ku3': {
      'en': ' Terms & Conditions',
      'es': 'Términos y condiciones',
    },
    'nam88ec0': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'rxmsrj7y': {
      'en': 'Already have an account?',
      'es': '¿Ya tienes una cuenta?',
    },
    'vyyfuuxt': {
      'en': ' Sign in',
      'es': 'Iniciar sesión',
    },
    'd1s4hohm': {
      'en': 'or',
      'es': 'o',
    },
    'j9pleq87': {
      'en': 'Sign in with Google',
      'es': 'Iniciar sesión con Google',
    },
    'nd13wc8s': {
      'en': 'Sign in with Facebook',
      'es': 'Iniciar sesión con Facebook',
    },
    '3k1i0jkc': {
      'en': 'First Name is required',
      'es': 'El nombre es obligatorio',
    },
    'm0x14cn0': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    '0rfgdyk6': {
      'en': 'Last Name is required',
      'es': 'El apellido es obligatorio',
    },
    'qvbjp4uq': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    '60pnkwhu': {
      'en': 'Contact Number is required',
      'es': 'El número de contacto es obligatorio',
    },
    'dw1zw9oa': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    'urfyk48z': {
      'en': 'Email is required',
      'es': 'Se requiere correo electrónico',
    },
    'cmj0ig2d': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    '81cfaogw': {
      'en': 'Password is required',
      'es': 'Se requiere contraseña',
    },
    '36sbhjgi': {
      'en': 'minimum 8 characters required',
      'es': 'Se requieren al menos 6 caracteres',
    },
    'ln0ybuen': {
      'en':
          '1 lowercase,1 uppercase,1 number and 1 specialcharecter & 8 characters required',
      'es': '',
    },
    'ar7q022j': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    '4wzbs69b': {
      'en': 'Confirm password is required',
      'es': 'Se requiere confirmar contraseña',
    },
    'k2i5km08': {
      'en': 'minimum 8 characters required',
      'es': 'Se requieren al menos 6 caracteres',
    },
    'djc9r851': {
      'en':
          '1 lowercase,1 uppercase,1 number and 1 specialcharecter & 8 characters required',
      'es': '',
    },
    'd1m9ewa2': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    'bgwn1j30': {
      'en': 'UserName',
      'es': 'Nombre de usuario',
    },
    'lz3tox5t': {
      'en': 'Overall',
      'es': 'En general',
    },
    'jzjvvesu': {
      'en': '5',
      'es': '5',
    },
    'fr9x8rtp': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'es':
          'Bonitas canchas al aire libre, concreto solido y buenos aros para el barrio.',
    },
    '1ookpgtp': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ForgotPassword
  {
    'gxessnor': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
    },
    '1xxojigm': {
      'en': 'Send OTP to your email ID',
      'es': 'Enviar OTP a su ID de correo electrónico',
    },
    '7jhdds36': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    '2vvokdks': {
      'en': 'Email is required',
      'es': 'Se requiere correo electrónico',
    },
    '2767dx9k': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    'jgcui57n': {
      'en': 'Send Code',
      'es': 'Enviar enlace de verificación',
    },
    'e9lx9sgv': {
      'en': 'CANCEL',
      'es': 'CANCELAR',
    },
    'yj3jdhfo': {
      'en': 'UserName',
      'es': 'Nombre de usuario',
    },
    '755cyn7o': {
      'en': 'Overall',
      'es': 'En general',
    },
    'y1a3hra8': {
      'en': '5',
      'es': '5',
    },
    'covoijb3': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'es':
          'Bonitas canchas al aire libre, concreto solido y buenos aros para el barrio.',
    },
    'tyom4mzm': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // OTPVerify
  {
    'iku0gi0q': {
      'en': 'OTP Verification',
      'es': 'Verificación OTP',
    },
    'mnu6ig2u': {
      'en': 'Enter OTP to reset password.',
      'es': 'Ingrese la OTP que recibió por correo electrónico',
    },
    'n2yvsc6z': {
      'en': 'Verify',
      'es': 'Verificar',
    },
    'rm7poz3y': {
      'en': 'Didn’t get the code? ',
      'es': '',
    },
    'qpr8k8qw': {
      'en': 'Resend',
      'es': '',
    },
    'x3biwn5v': {
      'en': 'Resend OTP ?',
      'es': '¿Reenviar OTP?',
    },
    'gu0a6r7r': {
      'en': 'Field is required',
      'es': '',
    },
    'pquz4yyi': {
      'en': 'UserName',
      'es': 'Nombre de usuario',
    },
    '06h4kjaa': {
      'en': 'Overall',
      'es': 'En general',
    },
    'vq1yonk9': {
      'en': '5',
      'es': '5',
    },
    '1v160qwy': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'es':
          'Bonitas canchas al aire libre, concreto solido y buenos aros para el barrio.',
    },
    'mca3t7hr': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ResetPasswod
  {
    'a1ytrxlf': {
      'en': 'Reset New Password',
      'es': 'Restablecer nueva contraseña',
    },
    'exahapck': {
      'en': 'Your new password must be different form previously used password',
      'es':
          'Su nueva contraseña debe ser diferente a la contraseña utilizada anteriormente',
    },
    'oakwwcm3': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'fobnbzcm': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
    },
    'd6t3f9p7': {
      'en': 'Reset Password',
      'es': 'Reiniciar',
    },
    '7xt9rnmy': {
      'en': 'Password is required',
      'es': 'Se requiere nombre',
    },
    'owh3fpc4': {
      'en': 'minimum 8 characters required',
      'es': '',
    },
    'r9bn73m2': {
      'en':
          '1 lowercase,1 uppercase,1 number and 1 specialcharecter & 8 characters required',
      'es': '',
    },
    '9x55lylm': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    '42oahux9': {
      'en': 'Confirm Password is required',
      'es': 'Confirmar contraseña es obligatorio',
    },
    'b1pyh06q': {
      'en': 'minimum 8 characters required',
      'es': '',
    },
    'a4g60xf4': {
      'en':
          '1 lowercase,1 uppercase,1 number and 1 specialcharecter & 8 characters required',
      'es': '',
    },
    '38ybmm2m': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    'ysbjkhz6': {
      'en': 'UserName',
      'es': 'Nombre de usuario',
    },
    '5w5tziae': {
      'en': 'Overall',
      'es': 'En general',
    },
    'k8ig3uc8': {
      'en': '5',
      'es': '5',
    },
    'lglvb58j': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'es':
          'Bonitas canchas al aire libre, concreto solido y buenos aros para el barrio.',
    },
    '7kluk1jd': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // passwordResetSuccess
  {
    '2rfcwtma': {
      'en': 'Go To Login',
      'es': 'Ir a iniciar sesión',
    },
    'x92eel22': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // home
  {
    'sgqn8skd': {
      'en': 'Welcome to MYPRSN',
      'es': 'Bienvenido a MYPRSN',
    },
    '6kkmyv1r': {
      'en': 'Search Services...',
      'es': 'Servicios de búsqueda...',
    },
    'xsxdwame': {
      'en': 'Best Health Insurance\nfor your family',
      'es': 'El mejor seguro médico\npara tu familia',
    },
    '1gri2xt9': {
      'en': 'Lorem ipsum dolor sit amet. ',
      'es': 'Lorem ipsum dolor sit amet.',
    },
    'q34r0xxc': {
      'en': 'Free Consultation',
      'es': 'Consulta gratuita',
    },
    '20yeeup5': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // MyBookings
  {
    '9rz51j02': {
      'en': 'Bookings',
      'es': 'Reservas',
    },
    'n2km3oc0': {
      'en': 'Upcoming',
      'es': 'Próximamente',
    },
    'azysimdv': {
      'en': 'Completed',
      'es': 'Terminado',
    },
    'h0vl3ih1': {
      'en': 'Cancelled',
      'es': 'Cancelado',
    },
    'ap33y6ag': {
      'en': 'My Booking',
      'es': 'Mis reservas',
    },
  },
  // Documents
  {
    'trdgfecs': {
      'en': 'Documents',
      'es': 'Documentos',
    },
    'gmiohc7b': {
      'en': 'My Documents',
      'es': 'Mis documentos',
    },
    '68fk6eid': {
      'en': 'Create Folder',
      'es': 'Crear carpeta',
    },
    'ukfa7rj4': {
      'en': 'Upload',
      'es': 'Subir',
    },
    '5bt4g6dj': {
      'en': 'Search documents...',
      'es': 'Buscar documentos...',
    },
    '6bqmja1y': {
      'en': ' / ',
      'es': '/',
    },
    'v89f39xf': {
      'en': '14/02/2024  /  628.72 KB',
      'es': '14/02/2024 / 628,72 KB',
    },
    'kquoq2ex': {
      'en': 'Share',
      'es': 'Descargar',
    },
    '8bbiatce': {
      'en': 'Document',
      'es': 'Documentos',
    },
  },
  // Profile
  {
    'l8trhy8e': {
      'en': 'My Profile',
      'es': 'Mi perfil',
    },
    '3x5g20ez': {
      'en': 'Edit',
      'es': 'Editar',
    },
    'muocead5': {
      'en': 'Update Profile',
      'es': 'Actualizar perfil',
    },
    'nti3oiyg': {
      'en': 'Appointments',
      'es': 'Equipo',
    },
    'nrae74sc': {
      'en': 'Languages',
      'es': 'Idiomas',
    },
    'oosqyrav': {
      'en': 'Resources',
      'es': 'Sobre nosotros',
    },
    'jatxilqh': {
      'en': 'About Us',
      'es': 'Sobre nosotros',
    },
    'kb17bawy': {
      'en': 'Privacy Policy',
      'es': 'política de privacidad',
    },
    'gc6ndrsj': {
      'en': 'Terms & Conditions',
      'es': 'Términos y condiciones',
    },
    '564pxvd3': {
      'en': 'Help & support',
      'es': 'Ayuda y soporte',
    },
    'qt2texsh': {
      'en': 'Contact Us',
      'es': 'Contáctenos',
    },
    '0gamwmpt': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
    },
    'tjeli4rj': {
      'en': 'Profile',
      'es': 'Perfil',
    },
  },
  // home2
  {
    '7gef3hh4': {
      'en': 'Welcome, Jenny',
      'es': 'Bienvenida, Jenny',
    },
    'f7o4nbps': {
      'en': 'Search listings...',
      'es': 'Buscar listados...',
    },
    'i2ljj33r': {
      'en': 'Top Beaches',
      'es': 'Las mejores playas',
    },
    'dvpvg08x': {
      'en': 'Beach Name',
      'es': 'Nombre de la playa',
    },
    'd8mtenw6': {
      'en': '\$421',
      'es': '\$421',
    },
    'aytucadl': {
      'en': ' /night',
      'es': '/noche',
    },
    'vauxq8ts': {
      'en': 'Beach Name',
      'es': 'Nombre de la playa',
    },
    'ijckhiei': {
      'en': '\$421',
      'es': '\$421',
    },
    'h05g1l2e': {
      'en': ' /night',
      'es': '/noche',
    },
    'p3rukzo5': {
      'en': 'Beach Name',
      'es': 'Nombre de la playa',
    },
    '75rbmfjx': {
      'en': '\$421',
      'es': '\$421',
    },
    's45va95s': {
      'en': ' /night',
      'es': '/noche',
    },
    'ox1qf2bo': {
      'en': 'Recent Properties',
      'es': 'Propiedades recientes',
    },
    'jmyc0jmn': {
      'en': '12 nights available',
      'es': '12 noches disponibles',
    },
    '8qdrmt3j': {
      'en': 'Property Name',
      'es': 'Nombre de la propiedad',
    },
    'ocgb2dv5': {
      'en': '\$210',
      'es': '\$210',
    },
    'tt3xc7ip': {
      'en': ' /night',
      'es': '/noche',
    },
    'y8z8vdza': {
      'en': 'Kauai, Hawaii',
      'es': 'Kauai, Hawái',
    },
    'f69ck78h': {
      'en': '12 nights available',
      'es': '12 noches disponibles',
    },
    'comg9ite': {
      'en': 'Property Name',
      'es': 'Nombre de la propiedad',
    },
    '1bavenko': {
      'en': '\$168',
      'es': '\$168',
    },
    'mrd2l507': {
      'en': ' /night',
      'es': '/noche',
    },
    'btdtugpj': {
      'en': 'Kauai, Hawaii',
      'es': 'Kauai, Hawái',
    },
    'dyy0oglk': {
      'en': '4 nights available',
      'es': '4 noches disponibles',
    },
    'js82kfe2': {
      'en': 'Property Name',
      'es': 'Nombre de la propiedad',
    },
    '6s0059f4': {
      'en': '\$421',
      'es': '\$421',
    },
    'r8id47zk': {
      'en': ' /night',
      'es': '/noche',
    },
    'n6ng207s': {
      'en': 'Kauai, Hawaii',
      'es': 'Kauai, Hawái',
    },
    'cc1jsh3c': {
      'en': 'Services',
      'es': 'Servicios',
    },
    'f69ntplr': {
      'en': 'Services',
      'es': 'Servicios',
    },
    '1vb4x3rq': {
      'en': 'Find A Provider',
      'es': 'Encuentre un proveedor',
    },
    '6p3b8pjt': {
      'en': 'Find Resources',
      'es': 'Encuentre recursos',
    },
    '3vilh2a2': {
      'en': 'Community',
      'es': 'Comunidad',
    },
    'sl01e2pz': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // resources
  {
    'h7x4rwmt': {
      'en': 'List Of Resources',
      'es': 'Lista de recursos',
    },
    'usdijvq6': {
      'en': 'Search topics...',
      'es': 'Buscar temas...',
    },
    'f3ak1lwm': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // spage
  {
    '7c5wywbs': {
      'en': 'Primary Care Consultation',
      'es': 'Consulta de Atención Primaria',
    },
    'nhpf6dph': {
      'en': '4.8 (256 reviews)',
      'es': '4.8 (256 opiniones)',
    },
    'hch1fn5a': {
      'en': 'About this service',
      'es': 'Acerca de este servicio',
    },
    'w0wqh9z9': {
      'en':
          'Our primary care consultation service provides comprehensive health assessments, preventive care, and management of chronic conditions. Our experienced healthcare professionals are dedicated to your overall well-being.',
      'es':
          'Nuestro servicio de consulta de atención primaria ofrece evaluaciones integrales de salud, atención preventiva y manejo de enfermedades crónicas. Nuestros profesionales de la salud experimentados están dedicados a su bienestar general.',
    },
    '4soaxsqa': {
      'en': 'What\'s included',
      'es': 'Qué incluye',
    },
    'iryhf5ue': {
      'en': 'Health assessment',
      'es': 'Evaluación de salud',
    },
    'dt2ed0a6': {
      'en': 'Preventive care recommendations',
      'es': 'Recomendaciones de cuidados preventivos',
    },
    'wsgei5en': {
      'en': 'Chronic disease management',
      'es': 'Manejo de enfermedades crónicas',
    },
    'bx8xm54s': {
      'en': 'Prescription management',
      'es': 'Gestión de recetas',
    },
    'vz29k0wi': {
      'en': 'Available time slots',
      'es': 'Franjas horarias disponibles',
    },
    '1c6n5ip7': {
      'en': '9:00 AM',
      'es': '9:00 AM',
    },
    'z46gqx0l': {
      'en': '10:30 AM',
      'es': '10:30 a. m.',
    },
    'u2xw8skg': {
      'en': '2:00 PM',
      'es': '2:00 p.m.',
    },
    '9mg3h5vh': {
      'en': '3:30 PM',
      'es': '3:30 p.m.',
    },
    'khsq9jen': {
      'en': 'Book Appointment',
      'es': 'Reservar cita',
    },
  },
  // serviceDetailsPage
  {
    'wzyb9iu3': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, See More...',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, Ver más...',
    },
    'lv4yfbba': {
      'en': 'Facilities',
      'es': 'Instalaciones',
    },
    'e33hcupt': {
      'en': 'Details',
      'es': 'Detalles',
    },
    'a52wpytj': {
      'en': 'Advisor',
      'es': 'Tutor',
    },
    'dmmfa3hg': {
      'en': 'Explore +',
      'es': 'Explorar +',
    },
    '5xm013h7': {
      'en': 'Schedule a meeting',
      'es': 'Programar una reunión',
    },
    '012tab8z': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // serviceReqForm
  {
    'c776jjty': {
      'en': 'Service Request Form',
      'es': 'Formulario de solicitud de servicio',
    },
    'dacc6vh3': {
      'en': 'First Name',
      'es': 'Nombre de pila',
    },
    '49qofyx7': {
      'en': 'Enter First Name',
      'es': 'Introduzca el nombre',
    },
    'r9ntpczv': {
      'en': 'Last Name',
      'es': 'Apellido',
    },
    '7250c453': {
      'en': 'Enter Last Name',
      'es': 'Introduzca el apellido',
    },
    'my1pxzqe': {
      'en': 'Type of service...',
      'es': 'Tipo de servicio...',
    },
    '2rz6et7k': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'bfc29ck3': {
      'en': 'Option 1',
      'es': 'Opción 1',
    },
    'omooc9yt': {
      'en': 'Option 2',
      'es': 'Opción 2',
    },
    'l0oghpaq': {
      'en': 'Option 3',
      'es': 'Opción 3',
    },
    'ioonk5gq': {
      'en': 'Below 35',
      'es': 'Menos de 35',
    },
    'b5jvxe2l': {
      'en': 'Type of service...',
      'es': 'Tipo de servicio...',
    },
    'jewbyr6c': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'w1n887ip': {
      'en': 'Below 35',
      'es': 'Menos de 35',
    },
    'xqvfms9f': {
      'en': '35 - 55',
      'es': '35 - 55',
    },
    '8msltnxq': {
      'en': '55+',
      'es': '55+',
    },
    'k96iubrk': {
      'en': 'Gender',
      'es': 'Género',
    },
    'slbx198o': {
      'en': 'Male',
      'es': 'Masculino',
    },
    'hy30eqka': {
      'en': 'Male',
      'es': 'Masculino',
    },
    '0kx8wf28': {
      'en': 'Female',
      'es': 'Femenino',
    },
    '3hf11aa9': {
      'en': 'Other',
      'es': 'Otro',
    },
    'tf7bgyrf': {
      'en': 'Location',
      'es': 'Ubicación',
    },
    'gcdxj16q': {
      'en': 'Enter Location',
      'es': 'Introducir ubicación',
    },
    'lvpkmnlg': {
      'en': 'Brief your requirement',
      'es': 'Explique brevemente su requerimiento',
    },
    'ly6y2iv1': {
      'en': 'Enter here...',
      'es': 'Entra aquí...',
    },
    'stpspqw3': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    '6rtq8otd': {
      'en': 'Field is required',
      'es': 'Se requiere nombre',
    },
    'f2gg2uoh': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    's972w8gt': {
      'en': 'Field is required',
      'es': 'Apellido requerido',
    },
    'ztuopdac': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    's0xteody': {
      'en': 'Field is required',
      'es': '',
    },
    '8kec127a': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'fxu1gmwz': {
      'en': 'Field is required',
      'es': '',
    },
    'rw03c5km': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '73qo05uw': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // advisors
  {
    'ooy4apa8': {
      'en': 'List Of Professionals',
      'es': 'Lista de profesionales',
    },
    'it4jvzxj': {
      'en': 'Search advisors...',
      'es': 'Buscar asesores...',
    },
    'gtevnk4d': {
      'en': 'Advisor',
      'es': 'Asesores',
    },
  },
  // advisorDetailsPage
  {
    '9t968iq6': {
      'en': 'Advisor Details',
      'es': 'Detalles del asesor',
    },
    '1fieqvt2': {
      'en': '2000 +',
      'es': '2000 +',
    },
    'k2yrcdw3': {
      'en': 'Clients',
      'es': 'Clientela',
    },
    'zu0ogkgw': {
      'en': '10 +',
      'es': '10 +',
    },
    'rw2ixvs0': {
      'en': 'Experience',
      'es': 'Experiencia',
    },
    'ie8b9ary': {
      'en': '1872',
      'es': '1872',
    },
    'tctlykv9': {
      'en': 'Reviews',
      'es': 'Reseñas',
    },
    '6hepvu2m': {
      'en': 'Biography',
      'es': 'Biografía',
    },
    'ilwnjfh2': {
      'en': 'Working Time',
      'es': 'Tiempo de trabajo',
    },
    'qxdehace': {
      'en': 'Monday - Friday',
      'es': 'Lunes - Viernes, 08:00 a.m. - 10:00 p.m.',
    },
    '0cqdtzbv': {
      'en': 'Today\'s Availability',
      'es': 'Tiempo de trabajo',
    },
    'slgqd4hw': {
      'en': ' - ',
      'es': '-',
    },
    'l9qu5cg1': {
      'en': 'Reviews',
      'es': 'Reseñas',
    },
    'jz34lkf0': {
      'en': 'See All',
      'es': 'Ver todo',
    },
    '40c5rxkf': {
      'en': 'Book Appointment',
      'es': 'Reservar cita',
    },
    'kq4jn9x1': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // bookAppointment
  {
    'sbezl9zd': {
      'en': 'Book Appointment',
      'es': 'Reservar cita',
    },
    'ied2b6ci': {
      'en': 'Select Date',
      'es': 'Seleccione fecha',
    },
    'ogf0ogo7': {
      'en': 'Select Time Slot',
      'es': '',
    },
    'a20sw31q': {
      'en': 'Select Hour',
      'es': 'Seleccionar hora',
    },
    '6xp8gecy': {
      'en': ' - ',
      'es': '-',
    },
    't7gyxr3q': {
      'en': 'Make an Appointment',
      'es': 'Pedir hora',
    },
    '9btpq8z1': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // termsCondition
  {
    'ltqabo9z': {
      'en': 'Terms & Conditions',
      'es': 'Actualizar perfil',
    },
    'y0kdpo3r': {
      'en': 'Terms & Conditions :',
      'es': 'Términos y condiciones:',
    },
    'kcj83tyi': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // addDoc
  {
    '4ps3hme0': {
      'en': 'Upload Documents',
      'es': 'Subir documentos',
    },
    'p1pmusnu': {
      'en': 'Name of File',
      'es': 'Nombre del archivo',
    },
    'nhd7dhe6': {
      'en': 'PDF',
      'es': 'PDF',
    },
    'lp9bipvu': {
      'en': 'Type of Report...',
      'es': 'Tipo de informe...',
    },
    'til0snlz': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'zauch1i1': {
      'en': 'PDF',
      'es': 'PDF',
    },
    'bp72cdnj': {
      'en': 'DOC',
      'es': 'DOC',
    },
    'n1h5gwsm': {
      'en': 'EXCEL',
      'es': 'SOBRESALIR',
    },
    '8ek3zx87': {
      'en': 'Other',
      'es': '',
    },
    'c6qlbvns': {
      'en': '',
      'es': 'PDF',
    },
    'ty8g7ash': {
      'en': 'Select folder',
      'es': 'Seleccionar carpeta',
    },
    '3qgesr03': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    '4o63geli': {
      'en': 'Upload',
      'es': 'Subir',
    },
    'ddz21tn1': {
      'en': 'File Url is required',
      'es': 'La URL del archivo es obligatoria',
    },
    'bnlcenb3': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    '8j36gnkp': {
      'en': 'File Name is required',
      'es': 'El nombre del archivo es obligatorio',
    },
    'xiptut50': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    'hqtt5pm2': {
      'en': 'Documents',
      'es': 'Documentos',
    },
  },
  // MyyProfile
  {
    'gtuzda08': {
      'en': 'Update Profile ',
      'es': 'Actualizar perfil',
    },
    '9sedkdpm': {
      'en': 'First Name',
      'es': 'Nombre de pila',
    },
    '1jm9zd2q': {
      'en': 'Last Name',
      'es': 'Apellido',
    },
    'no3fbekl': {
      'en': 'Male',
      'es': 'Masculino',
    },
    'suavxhdp': {
      'en': 'Select gender...',
      'es': 'Seleccione género...',
    },
    'edgzt7u6': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    'zgrzwnxq': {
      'en': 'Male',
      'es': 'Masculino',
    },
    'o0oqqcay': {
      'en': 'Female',
      'es': 'Femenino',
    },
    '5bv5wwbo': {
      'en': 'Other',
      'es': 'Otro',
    },
    'lesuzf85': {
      'en': 'Contact Number',
      'es': 'Número de contacto',
    },
    '14pzpqa3': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    '99mtszd8': {
      'en': 'Enter email address',
      'es': 'Introduzca su dirección de correo electrónico',
    },
    'd3db2ioc': {
      'en': 'First name is required',
      'es': 'Se requiere número de contacto',
    },
    'j8uohu4d': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    'h7fbxnrv': {
      'en': 'Last name is required',
      'es': 'Se requiere correo electrónico',
    },
    'x64tmws8': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    'k7w29fs8': {
      'en': 'Contact number is required',
      'es': 'Apellido requerido',
    },
    'f17v9ber': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    '8vbjgit9': {
      'en': 'Field is required',
      'es': 'Apellido requerido',
    },
    'drys3d44': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'dzvcmdwa': {
      'en': 'Save ',
      'es': 'Ahorrar',
    },
    'mgyoq48k': {
      'en': 'Change Email',
      'es': 'Ahorrar',
    },
  },
  // language
  {
    'nw3jvqzg': {
      'en': 'Change Language',
      'es': 'Cambiar idioma',
    },
    'sg8k7rop': {
      'en': 'Select your preferred language',
      'es': 'Seleccione su idioma preferido',
    },
    'hnlztrse': {
      'en': 'English',
      'es': 'Inglés',
    },
    'fa9pwfc9': {
      'en': 'English',
      'es': 'Inglés',
    },
    'kbw8uxd1': {
      'en': '',
      'es': '',
    },
    'ow5zq9se': {
      'en': 'Español',
      'es': 'Español',
    },
    'qy8yd4he': {
      'en': 'Spanish',
      'es': 'Español',
    },
    'o4i361oz': {
      'en': '',
      'es': '',
    },
    'ao303wlk': {
      'en': 'Apply Changes',
      'es': 'Aplicar cambios',
    },
    'lxznb6q3': {
      'en': 'Language changes will be applied to the entire app',
      'es': 'Los cambios de idioma se aplicarán a toda la aplicación.',
    },
  },
  // help
  {
    'g017eoyb': {
      'en': 'Help & Support',
      'es': 'Ayuda y soporte',
    },
    'jquawsju': {
      'en': 'Still need help?',
      'es': '¿Aún necesitas ayuda?',
    },
    'v0h8faad': {
      'en': 'Contact Us',
      'es': 'Contactar con el servicio de asistencia',
    },
  },
  // aboutUs
  {
    'apvchmg6': {
      'en': 'About Us',
      'es': 'Sobre nosotros',
    },
    't09d8nrq': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PrivacyPolicy
  {
    's6nl46m8': {
      'en': 'Privacy Policy',
      'es': 'Actualizar perfil',
    },
    'z0o4ry9j': {
      'en': 'Privacy Policy :',
      'es': 'Política de privacidad :',
    },
    '80owv1l3': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // contactUs
  {
    'btu6ddm9': {
      'en': 'Contact Us',
      'es': 'Contáctenos',
    },
    '9jzvmp59': {
      'en': 'Address',
      'es': 'DIRECCIÓN',
    },
    'dtsm41ck': {
      'en': '25 Elgin Street , Dummy Lorem ipsum Location , Washington DC',
      'es': '25 Elgin Street, Ubicación Dummy Lorem ipsum, Washington DC',
    },
    'f3p2utwi': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
    },
    's0p8smo4': {
      'en': '+00 (0) 000 / 00 00 000',
      'es': '+00 (0) 000 / 00 00 000',
    },
    'eljb0j7r': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    'an06isyo': {
      'en': 'lyna@myprsn.com',
      'es': 'lyna@myprsn.com',
    },
    '234b6ynv': {
      'en': 'Send Us a Message',
      'es': 'Envíanos un mensaje',
    },
    'zvqyobwp': {
      'en': 'Please fill out this short form and we\'ll contact you shortly.',
      'es':
          'Por favor, rellene este breve formulario y nos pondremos en contacto con usted en breve.',
    },
    '2hd0s3ub': {
      'en': 'First Name',
      'es': 'Nombre de pila',
    },
    'r9f4b1sp': {
      'en': 'Last Name',
      'es': 'Apellido',
    },
    '1s5yby4x': {
      'en': 'Contact Number',
      'es': 'Número de contacto',
    },
    'yrqnl4ee': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    'alc5n2oj': {
      'en': 'Enter email address',
      'es': 'Introduzca su dirección de correo electrónico',
    },
    '28jt0kxr': {
      'en': 'Select Service Name',
      'es': 'Seleccione Profesión...',
    },
    'db14ylmz': {
      'en': 'Search...',
      'es': 'Buscar...',
    },
    '4038yuno': {
      'en': 'Option 1',
      'es': 'Opción 1',
    },
    'kdhxy9hn': {
      'en': 'Option 2',
      'es': 'Opción 2',
    },
    'r1fygwax': {
      'en': 'Option 3',
      'es': 'Opción 3',
    },
    'jb3q2iht': {
      'en': 'Message',
      'es': 'Mensaje',
    },
    'e4t8kkih': {
      'en': 'Enter message',
      'es': 'Introducir mensaje',
    },
    'pyfg6aso': {
      'en': 'First name required',
      'es': 'Se requiere correo electrónico',
    },
    'gt0zd6cg': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    'rrv7yaeq': {
      'en': 'Last name required',
      'es': 'Apellido requerido',
    },
    'zpzm9tuf': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    '65jtmdi2': {
      'en': 'Contact number required',
      'es': 'Se requiere número de contacto',
    },
    'ys9yjm9f': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'ay139dzp': {
      'en': 'Email is required',
      'es': 'Se requiere correo electrónico',
    },
    '38nyh02c': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'h7hnnbfj': {
      'en': 'Message is required',
      'es': 'El mensaje es obligatorio',
    },
    'xxgrf1mm': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'vwa4mput': {
      'en': 'Submit',
      'es': 'Entregar',
    },
    'kqqi5bcz': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // OTPVerifyForEmail
  {
    'uolrxr1e': {
      'en': 'OTP Verification',
      'es': 'Verificación OTP',
    },
    '54bn6jq0': {
      'en': 'Enter the OTP which you received via email address',
      'es': 'Ingrese la OTP que recibió por correo electrónico',
    },
    'l0y5k6ns': {
      'en': 'Resend OTP ?',
      'es': '¿Reenviar OTP?',
    },
    'e2nts4i5': {
      'en': 'Verify',
      'es': 'Verificar',
    },
    'mxubqawh': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    '7qwldczy': {
      'en': 'Field is required',
      'es': 'El campo es obligatorio',
    },
    'vop4bwqm': {
      'en': 'UserName',
      'es': 'Nombre de usuario',
    },
    'wnqexov0': {
      'en': 'Overall',
      'es': 'En general',
    },
    'wx0ke1rg': {
      'en': '5',
      'es': '5',
    },
    '9xb26x2x': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'es':
          'Bonitas canchas al aire libre, concreto solido y buenos aros para el barrio.',
    },
    'nrx32lbn': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ChangeEmail
  {
    'ca42p36o': {
      'en': 'Change Email',
      'es': 'Has olvidado tu contraseña',
    },
    '4pha1y2h': {
      'en': 'Send OTP to your email ID',
      'es': 'Enviar OTP a su ID de correo electrónico',
    },
    'cnmnl97t': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    'eirn1mmd': {
      'en': 'Email is required',
      'es': 'Se requiere correo electrónico',
    },
    'r3fiq8st': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    '0ko92z73': {
      'en': 'Send Code',
      'es': 'Enviar enlace de verificación',
    },
    '5vkqo523': {
      'en': 'CANCEL',
      'es': 'CANCELAR',
    },
    '64cy828s': {
      'en': 'UserName',
      'es': 'Nombre de usuario',
    },
    'liisfj6a': {
      'en': 'Overall',
      'es': 'En general',
    },
    'kti8721m': {
      'en': '5',
      'es': '5',
    },
    '4ki4f3n4': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'es':
          'Bonitas canchas al aire libre, concreto solido y buenos aros para el barrio.',
    },
    'z7sh9h4w': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // FOLDERDocuments
  {
    'ea0c7p1q': {
      'en': ' / ',
      'es': '/',
    },
    'a7bokadv': {
      'en': '14/02/2024  /  628.72 KB',
      'es': '14/02/2024 / 628,72 KB',
    },
    'l2tyujo6': {
      'en': 'Share',
      'es': 'Descargar',
    },
    's6kjwei1': {
      'en': 'Documents',
      'es': 'Documentos',
    },
  },
  // adminResource
  {
    '9rgq6k1i': {
      'en': 'Resource',
      'es': 'Sobre nosotros',
    },
    '07y4j1p4': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // agoraCallScreen
  {
    'cyxtdunc': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // homeCopy
  {
    'yuvm4s2x': {
      'en': '.',
      'es': 'Hogar',
    },
  },
  // AdvisorBookings
  {
    '7lndbioc': {
      'en': 'Bookings',
      'es': 'Reservas',
    },
    '6i3vyaa4': {
      'en': 'Upcoming',
      'es': 'Próximamente',
    },
    'x267pk3v': {
      'en': 'Complete',
      'es': 'Terminado',
    },
    'czb5lqrj': {
      'en': 'Cancelled',
      'es': 'Cancelado',
    },
    'as29xyfc': {
      'en': 'Past',
      'es': '',
    },
    '957i5nwn': {
      'en': ' ',
      'es': '',
    },
    'g442fio9': {
      'en': 'Hello World',
      'es': '',
    },
    'hq3dshe2': {
      'en': 'Schedule',
      'es': 'Hogar',
    },
    'qzys9oho': {
      'en': 'Log Out',
      'es': '',
    },
    '4edfjebu': {
      'en': 'My Bookings',
      'es': 'Mis reservas',
    },
  },
  // allRatingReviewPAge
  {
    'hkf92pfa': {
      'en': 'Reviews',
      'es': '',
    },
    'wmcwv3mp': {
      'en': 'Overall Rating',
      'es': '',
    },
    'pbah6of8': {
      'en': '/5',
      'es': '',
    },
  },
  // advisorAvailability
  {
    'q34uhcjt': {
      'en': 'Schedule',
      'es': 'Reservar cita',
    },
    'pr37yxx5': {
      'en': 'Select Date',
      'es': 'Seleccione fecha',
    },
    'sx2yf2r1': {
      'en': 'Choose Time',
      'es': '',
    },
    'w7ilx2te': {
      'en': 'Choose Time',
      'es': 'Seleccione fecha',
    },
    'q04b7047': {
      'en': 'Start Time',
      'es': '',
    },
    'zk3dmbct': {
      'en': ' -  ',
      'es': '',
    },
    'xq2ienqr': {
      'en': 'End Time',
      'es': '',
    },
    'x83tyimb': {
      'en': ' -  ',
      'es': '',
    },
    'twaulbb2': {
      'en': 'Create Time Slot',
      'es': 'Pedir hora',
    },
    'sweekgfz': {
      'en': 'Created Slots',
      'es': 'Seleccione fecha',
    },
    '7yy3hwtk': {
      'en': ' - ',
      'es': '-',
    },
    'efkncdg4': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // noti
  {
    '7b84n994': {
      'en': 'Notifications',
      'es': '',
    },
    'augne4x6': {
      'en': 'Today',
      'es': '',
    },
    'nbt3fcti': {
      'en': 'Appointment Reminder',
      'es': '',
    },
    '24b2gmnu': {
      'en': 'Your appointment with Dr. Smith is tomorrow at 10:00 AM',
      'es': '',
    },
    '71kp4h3c': {
      'en': '2 hours ago',
      'es': '',
    },
    'a8eash6w': {
      'en': 'Prescription Ready',
      'es': '',
    },
    'nxe8edr0': {
      'en': 'Your prescription is ready for pickup at Main Street Pharmacy',
      'es': '',
    },
    'e2mocn3n': {
      'en': '5 hours ago',
      'es': '',
    },
    'xr9umvyt': {
      'en': 'Yesterday',
      'es': '',
    },
    'ifwv1ftg': {
      'en': 'Test Results Available',
      'es': '',
    },
    'xebvlvm8': {
      'en': 'Your lab results are now available in your patient portal',
      'es': '',
    },
    'rix5cys1': {
      'en': 'Yesterday, 2:30 PM',
      'es': '',
    },
    'ghds9kg9': {
      'en': 'Payment Confirmed',
      'es': '',
    },
    'kx070fsl': {
      'en': 'Your payment of \$150 has been processed successfully',
      'es': '',
    },
    'nf637gsw': {
      'en': 'Yesterday, 10:15 AM',
      'es': '',
    },
    'wk6f3ax6': {
      'en': 'Earlier',
      'es': '',
    },
    'xi4xetua': {
      'en': 'Health Tips',
      'es': '',
    },
    '7iy39yzz': {
      'en': 'New article: \'10 Tips for Better Sleep\' is now available',
      'es': '',
    },
    'pv100471': {
      'en': '2 days ago',
      'es': '',
    },
    't7y6qvk0': {
      'en': 'Appointment Changed',
      'es': '',
    },
    '4zj3rsii': {
      'en': 'Your appointment on June 1st has been rescheduled',
      'es': '',
    },
    'fqxwfmv5': {
      'en': '3 days ago',
      'es': '',
    },
  },
  // nodatafound
  {
    'wtyyzz7w': {
      'en': 'No Data Found',
      'es': 'No se encontraron datos',
    },
    '5zkbcwrd': {
      'en': 'List is currently empty. Please check again later!',
      'es': 'La lista está vacía actualmente. ¡Vuelva a consultarla más tarde!',
    },
    'nh6x43q6': {
      'en': 'Add Item',
      'es': 'Agregar artículo',
    },
  },
  // reviewCard
  {
    'nr532xyx': {
      'en': '(',
      'es': '',
    },
    '6ym24yei': {
      'en': ')',
      'es': '',
    },
    '6cd7t9at': {
      'en': '(5.0)',
      'es': '(5.0)',
    },
    'uwdmuwvg': {
      'en': 'User',
      'es': 'Consultar',
    },
    'bwg9cxss': {
      'en': 'Posted on: ',
      'es': '',
    },
    'msevmoyh': {
      'en': 'Posted on: May 15, 2023',
      'es': 'Publicado el: 15 de mayo de 2023',
    },
  },
  // confirmationComponent
  {
    'aoack6ln': {
      'en': 'Booking Confirmed!',
      'es': '¡Reserva confirmada!',
    },
    'vfynsslk': {
      'en':
          'Your appointment has been successfully booked. We look forward to seeing you!',
      'es': 'Su cita ha sido programada con éxito. ¡Esperamos verle pronto!',
    },
    '7q2r4pnk': {
      'en': 'View Appointment Details',
      'es': 'Ver detalles de la cita',
    },
  },
  // advisorBookCard
  {
    'p1eo9nn8': {
      'en': ', ',
      'es': ',',
    },
    'ey90gijq': {
      'en': ' - ',
      'es': '-',
    },
    'uorvhb0k': {
      'en': 'Jun 11, 2:30 p.m - 3:00 p.m',
      'es': '11 de junio, 14:30 - 15:00 horas',
    },
    'qgxb3eo9': {
      'en': 'CANCELLED',
      'es': '',
    },
    'x11guqxz': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'p6z5xqje': {
      'en': 'Join',
      'es': 'Comenzar',
    },
  },
  // advisorBookCardCopy
  {
    'oobrir1c': {
      'en': ', ',
      'es': ',',
    },
    '31ifwueh': {
      'en': ' - ',
      'es': '-',
    },
    'amfsbub1': {
      'en': 'Jun 11, 2:30 p.m - 3:00 p.m',
      'es': '11 de junio, 14:30 - 15:00 horas',
    },
    'adbrj4m3': {
      'en': 'COMPLETED',
      'es': '',
    },
    'kkje8vbl': {
      'en': 'Seattle, USA',
      'es': '',
    },
    'oe9gwbrq': {
      'en': 'Book Again',
      'es': 'Reservar de nuevo',
    },
    'jkw0rda6': {
      'en': 'Leave Review',
      'es': 'Dejar reseña',
    },
  },
  // folderDialog
  {
    'k6kwgb4q': {
      'en': 'Create New Folder',
      'es': 'Crear nueva carpeta',
    },
    'tqux9ndp': {
      'en': 'Folder Name',
      'es': 'Nombre de la carpeta',
    },
    '7ayvco1g': {
      'en': 'Enter Folder Name',
      'es': 'Introduzca el nombre de la carpeta',
    },
    'fc5zqefa': {
      'en': 'Create Folder',
      'es': 'Crear carpeta',
    },
    'jit7ky90': {
      'en': 'Folder name required',
      'es': 'Se requiere nombre de carpeta',
    },
    'jx4jkc1c': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
  },
  // advisorBookCardCopy2
  {
    '7brirvp5': {
      'en': ' ',
      'es': '',
    },
    'a6oeqjkh': {
      'en': ', ',
      'es': ',',
    },
    'wz84koov': {
      'en': ' - ',
      'es': '-',
    },
    '0tjb1jn2': {
      'en': 'Jun 11, 2:30 p.m - 3:00 p.m',
      'es': '11 de junio, 14:30 - 15:00 horas',
    },
    '0zlp3l58': {
      'en': 'CANCELLED',
      'es': '',
    },
    'svw3juce': {
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'bgy4vq59': {
      'en': 'Start',
      'es': 'Comenzar',
    },
  },
  // advisorBookCardCopyCopy
  {
    'eyovn39e': {
      'en': ' ',
      'es': '',
    },
    '74ga617a': {
      'en': 'Seattle, USA',
      'es': '',
    },
    'mehjzn11': {
      'en': ', ',
      'es': ',',
    },
    'xr7ji99d': {
      'en': ' - ',
      'es': '-',
    },
    'pyi8ydwd': {
      'en': 'Jun 11, 2:30 p.m - 3:00 p.m',
      'es': '11 de junio, 14:30 - 15:00 horas',
    },
    'fogu1zrj': {
      'en': 'COMPLETED',
      'es': '',
    },
    'b13hqsxd': {
      'en': 'Seattle, USA',
      'es': '',
    },
    'zsusk3j3': {
      'en': 'Book Again',
      'es': 'Reservar de nuevo',
    },
    'ramnwf1n': {
      'en': 'Leave Review',
      'es': 'Dejar reseña',
    },
  },
  // ratingComp
  {
    '3xarmmxc': {
      'en': 'Rate & Review',
      'es': '',
    },
    '3t9j8tdg': {
      'en': '.',
      'es': '',
    },
    'qzs4u2q9': {
      'en': '0',
      'es': '',
    },
    'rf2lo81k': {
      'en': 'Write your review...',
      'es': '',
    },
    'jmw4jb9g': {
      'en': 'Review is required',
      'es': '',
    },
    'fzhw1pw6': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, seleccione una opción del menú desplegable.',
    },
    'f3jtx1q6': {
      'en': 'Cancel',
      'es': '',
    },
    'nbp2eceb': {
      'en': 'Submit',
      'es': '',
    },
  },
  // dw
  {
    'ic8sfwdf': {
      'en': 'Sarah Wilson gf',
      'es': '',
    },
    '79nyjszu': {
      'en': '@sarahw',
      'es': '',
    },
    'd5r6mair': {
      'en': 'Home',
      'es': 'Hogar',
    },
    'er1jy8qt': {
      'en': 'Search',
      'es': '',
    },
    'mstbgncm': {
      'en': 'Favorites',
      'es': '',
    },
    '9zwxmlmk': {
      'en': 'Settings',
      'es': '',
    },
    'h9z28hag': {
      'en': 'Recent Activity',
      'es': '',
    },
    'xam0gmy2': {
      'en': 'Posted a new photo',
      'es': '',
    },
    '4wz01rc5': {
      'en': '2 hours ago',
      'es': '',
    },
    '1wbfesxs': {
      'en': 'Liked a comment',
      'es': '',
    },
    'asw6jjxo': {
      'en': '5 hours ago',
      'es': '',
    },
  },
  // advisorBookCardCopy2Copy
  {
    '0l4as7tw': {
      'en': ' ',
      'es': '',
    },
    'oaascz6d': {
      'en': 'Seattle, USA',
      'es': '',
    },
    'e8vef5lx': {
      'en': ', ',
      'es': ',',
    },
    'q5fsd4ef': {
      'en': ' - ',
      'es': '-',
    },
    'jsa9wpe2': {
      'en': 'Jun 11, 2:30 p.m - 3:00 p.m',
      'es': '11 de junio, 14:30 - 15:00 horas',
    },
    'zrnutth7': {
      'en': 'EXPIRED',
      'es': '',
    },
  },
  // nodd
  {
    'm17xaxit': {
      'en': 'No Data Found!',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'ado0cfkt': {
      'en': '',
      'es':
          'Para tomar una fotografía o un vídeo, esta aplicación requiere permiso para acceder a la cámara.',
    },
    '0eqnfawa': {
      'en': '',
      'es':
          'Para cargar datos, esta aplicación requiere permiso para acceder a la biblioteca de fotos.',
    },
    'pna4acjm': {
      'en': 'Permission for Media',
      'es': 'Permiso para los medios de comunicación',
    },
    'ys7ogkti': {
      'en': 'Access Storage',
      'es': '',
    },
    'zxv937d1': {
      'en': 'Save into storage',
      'es': '',
    },
    'vk28vrvb': {
      'en': 'App needs permisison to access the Microphone',
      'es': '',
    },
    'kyxd0bk8': {
      'en': 'App needs permisison to send Notification',
      'es': '',
    },
    'uuo7f4yr': {
      'en': '',
      'es': '',
    },
    'y03co6a8': {
      'en': '',
      'es': '',
    },
    'swe1wj1s': {
      'en': '',
      'es': '',
    },
    '35segm6k': {
      'en': '',
      'es': '',
    },
    'wu7zbuwf': {
      'en': '',
      'es': '',
    },
    '37lshfd8': {
      'en': '',
      'es': '',
    },
    'piyozigr': {
      'en': '',
      'es': '',
    },
    '8j08lnjz': {
      'en': '',
      'es': '',
    },
    'aeznga74': {
      'en': '',
      'es': '',
    },
    '60ykjqg1': {
      'en': '',
      'es': '',
    },
    '0lsmk55t': {
      'en': '',
      'es': '',
    },
    'q84ljzhr': {
      'en': '',
      'es': '',
    },
    'bn773g74': {
      'en': '',
      'es': '',
    },
    'wy9hxxon': {
      'en': '',
      'es': '',
    },
    '48owwk36': {
      'en': '',
      'es': '',
    },
    'na7rs8ys': {
      'en': '',
      'es': '',
    },
    'l56xs1zi': {
      'en': '',
      'es': '',
    },
    '5uboa190': {
      'en': '',
      'es': '',
    },
    'g3w6eskj': {
      'en': '',
      'es': '',
    },
    'cbuv6ctg': {
      'en': '',
      'es': '',
    },
    '2drp49lm': {
      'en': '',
      'es': '',
    },
    'wkhg2et2': {
      'en': '',
      'es': '',
    },
    'rfxx8v75': {
      'en': '',
      'es': '',
    },
    '423di4yd': {
      'en': '',
      'es': '',
    },
    '8ybgb92g': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
