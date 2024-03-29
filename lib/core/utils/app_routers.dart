import 'package:edhp/features/confirm_membership_data/confirm_membership_data_screen.dart';
import 'package:edhp/features/create_membership/create_membership_screen.dart';
import 'package:edhp/features/edit_profile/edit_profile_screen.dart';
import 'package:edhp/features/layout/layout_screen.dart';
import 'package:edhp/features/medical_network/medical_network_screen.dart';
import 'package:edhp/features/medical_record/medical_record_screen.dart';
import 'package:edhp/features/membership_data/membership_data_screen.dart';
import 'package:edhp/features/otp/otp_screen.dart';
import 'package:edhp/features/payment/payment_screen.dart';
import 'package:edhp/features/service/service_screen.dart';
import 'package:edhp/features/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';
import '../../features/add_relatives/add_relatives_screen.dart';
import '../../features/authantication/forget_password/forget_password_screen.dart';
import '../../features/authantication/login/login_screen.dart';
import '../../features/authantication/reset_password/reset_password_screen.dart';
import '../../features/authantication/sign_up/sign_up_screen.dart';
import '../../features/organization_membership/create_membership_inside_app/create_membership__inside_app_screen.dart';
import '../../features/organization_membership/organization_membership_data/organization_membership_data_screen.dart';
import '../../features/organization_membership/organization_subscription/organization_subscription_screen.dart';
import '../../features/organization_membership/select_the_company/select_the_company_screen.dart';
import '../../features/profile/profile_screen.dart';

abstract class AppRouters {
  static const kSplashScreen = '/';
  static const kLoginScreen = '/loginScreen';
  static const kForgetPasswordScreen = '/forgetPasswordScreen';
  static const kOtpScreen = '/otpScreen';
  static const kResetPasswordScreen = '/resetPasswordScreen';
  static const kSignUpScreen = '/signUpScreen';
  static const kHomeScreen = '/homeScreen';
  static const kLayoutScreen = '/layoutScreen';
  static const kEditProfileScreen = '/editProfileScreen';
  static const kServiceScreen = '/serviceScreen';
  static const kCreateMembershipScreen = '/createMembershipScreen';
  static const kMedicalNetworkScreen = '/medicalNetworkScreen';
  static const kMedicalRecordScreen = '/medicalRecordScreen';
  static const kSelectCompanyScreen = '/selectCompanyScreen';
  static const kMembershipDataScreen = '/membershipDataScreen';
  static const kConfirmMembershipDataScreen = '/confirmMembershipDataScreen';
  static const kPaymentMembershipScreen = '/paymentMembershipScreen';
  static const kProfileScreen = '/profileScreen';
  static const kOrganizationMembershipDataScreen = '/organizationMembershipDataScreen';
  static const kAddRelativesScreen = '/addRelativesScreen';
  static const kOrganizationSubscriptionScreen = '/organizationSubscriptionScreen';
  static const kCreateMembershipInsideAppScreen = '/createMembershipInsideAppScreen';

  static final baseRouter = GoRouter(
    routes: [
      GoRoute(
        path: kCreateMembershipInsideAppScreen ,
        builder: (context, state) => const CreateMembershipInsideAppScreen(),
      ),
      GoRoute(
        path: kOrganizationSubscriptionScreen ,
        builder: (context, state) => OrganizationSubscriptionScreen(),
      ),
      GoRoute(
        path: kSplashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: kForgetPasswordScreen,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(
        path: kOtpScreen,
        builder: (context, state) => OtpScreen(),
      ),
      GoRoute(
        path: kResetPasswordScreen,
        builder: (context, state) => ResetPasswordScreen(),
      ),
      GoRoute(
        path: kSignUpScreen,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: kLayoutScreen,
        builder: (context, state) => LayoutScreen(),
      ),
      GoRoute(
        path: kEditProfileScreen,
        builder: (context, state) => EditProfileScreen(),
      ),
      GoRoute(
        path: kServiceScreen,
        builder: (context, state) => ServiceScreen(),
      ),
      GoRoute(
        path: kCreateMembershipScreen,
        builder: (context, state) => CreateMembershipScreen(),
      ),
      GoRoute(
        path: kMedicalNetworkScreen ,
        builder: (context, state) => MedicalNetworkScreen(),
      ),
      GoRoute(
        path: kMedicalRecordScreen ,
        builder: (context, state) => MedicalRecordScreen(),
      ),
      GoRoute(
        path: kSelectCompanyScreen ,
        builder: (context, state) => SelectTheCompanyScreen(),
      ),
      GoRoute(
        path: kMembershipDataScreen ,
        builder: (context, state) => MembershipDataScreen(),
      ),
      GoRoute(
        path: kConfirmMembershipDataScreen,
        builder: (context, state) => ConfirmMembershipDataScreen(),
      ),
      GoRoute(
        path: kPaymentMembershipScreen,
        builder: (context, state) => PaymentScreen(),
      ),
      GoRoute(
        path: kProfileScreen ,
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: kOrganizationMembershipDataScreen ,
        builder: (context, state) => OrganizationMembershipDataScreen(),
      ),
      GoRoute(
        path: kAddRelativesScreen ,
        builder: (context, state) => AddRelativesScreen(),
      )
    ],
  );

  static final skipLoginRouter = GoRouter(
    routes: [
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) => LayoutScreen(),
      ),
      GoRoute(
        path: kForgetPasswordScreen,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(
        path: kOtpScreen,
        builder: (context, state) => OtpScreen(),
      ),
      GoRoute(
        path: kResetPasswordScreen,
        builder: (context, state) => ResetPasswordScreen(),
      ),
      GoRoute(
        path: kSignUpScreen,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: kLayoutScreen,
        builder: (context, state) => LayoutScreen(),
      ),
      GoRoute(
        path: kEditProfileScreen,
        builder: (context, state) => EditProfileScreen(),
      ),
      GoRoute(
        path: kServiceScreen,
        builder: (context, state) => ServiceScreen(),
      ),
      GoRoute(
        path: kCreateMembershipScreen,
        builder: (context, state) => CreateMembershipScreen(),
      ),
      GoRoute(
        path: kMedicalNetworkScreen ,
        builder: (context, state) => MedicalNetworkScreen(),
      ),
      GoRoute(
        path: kMedicalRecordScreen ,
        builder: (context, state) => MedicalRecordScreen(),
      ),
      GoRoute(
        path: kSelectCompanyScreen ,
        builder: (context, state) => SelectTheCompanyScreen(),
      ),
      GoRoute(
        path: kMembershipDataScreen ,
        builder: (context, state) => MembershipDataScreen(),
      ),
      GoRoute(
        path: kConfirmMembershipDataScreen,
        builder: (context, state) => ConfirmMembershipDataScreen(),
      ),
      GoRoute(
        path: kPaymentMembershipScreen,
        builder: (context, state) => PaymentScreen(),
      ),
      GoRoute(
        path: kProfileScreen ,
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: kOrganizationMembershipDataScreen ,
        builder: (context, state) => OrganizationMembershipDataScreen(),
      ),
      GoRoute(
        path: kAddRelativesScreen ,
        builder: (context, state) => AddRelativesScreen(),
      )
    ],
  );
}