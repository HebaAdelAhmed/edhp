import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';
const String baseUrl = 'Https://edhp-eg.com';

class EndPoint {
  static const String login = '/apiAccount/Login';
  static const String register = '/apiAccount/Register';
  static const String getProfile = '/apiUserInterface/GetProfile';
  static const String updateProfile = '/apiUserInterface/UpdateProfile';
  static const String getOrganizations = '/apiUserInterface/GetOrganizations';
  static const String updateProfileImage = '/apiAttachments/UpdateProfileImage';
  static const String validateOrganizationMember = '/apiAccount/ValidateOrganizationMember';
  static const String getSubscriptionInfoLookUps = '/apiUserInterface/GetSubscriptionInfoLookupsViewModel';
  static String getProfileImage(BuildContext context){
    return '$baseUrl/apiAttachments/Get?referenceTypeId=${GetProfileCubit.get(context).userProfileModel!.profileID}&referenceId=1';
  }
}