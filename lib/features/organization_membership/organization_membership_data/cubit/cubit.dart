import 'dart:io';

import 'package:edhp/features/organization_membership/organization_membership_data/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class OrganizationMembershipDataCubit extends Cubit<OrganizationMembershipDataStates> {
  OrganizationMembershipDataCubit() : super(OrganizationMembershipDataInitiateState());

  static OrganizationMembershipDataCubit get(BuildContext context) => BlocProvider.of(context);

  File ? personalImage;
  File ? nationalIdImage;
  var picker = ImagePicker();
  var personalImagePath;
  var nationalIdImagePath;

  Future getPersonalImageFromGallery()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      personalImage = File(pickedFile.path);
      personalImagePath = pickedFile.path;
      print('Path of Image:');
      print(pickedFile.path);
      emit(GetPersonalImageFromGallerySuccessfullyState());
    }else{
      print('No Image Picked');
      emit(GetPersonalImageFromGalleryErrorState());
    }
  }

  Future getNationalIDImageFromGallery()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      nationalIdImage = File(pickedFile.path);
      nationalIdImagePath = pickedFile.path;
      print('Path of Image:');
      print(pickedFile.path);
      emit(GetNationalIDImageFromGallerySuccessfullyState());
    }else{
      print('No Image Picked');
      emit(GetNationalIDImageFromGalleryErrorState());
    }
  }
}
