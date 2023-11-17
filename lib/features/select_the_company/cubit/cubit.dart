import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/select_the_company/cubit/states.dart';
import 'package:edhp/models/get_organization_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyItemCubit extends Cubit<CompanyItemsStates> {

  CompanyItemCubit() : super(InitiateCompanyItemsState());

  static CompanyItemCubit get(BuildContext context) => BlocProvider.of(context);

  List<GetOrganizationItem> organizationItemsList = [];
  Future getOrganizations() async{
    emit(CompanyItemLoadingState());
    if(organizationItemsList!.isEmpty) {
      await DioHelper.getData(
        path: EndPoint.getOrganizations,
        token: token,
      ).then((value) {
        print(value.data);
        value.data.forEach((element) {
          organizationItemsList.add(GetOrganizationItem.fromJson(element));
        });
        print('###############################');
        print(organizationItemsList[0].name);
        emit(CompanyItemSuccessfullyState());
      }).catchError((error) {
        print(error.toString());
        emit(CompanyItemErrorState());
      });
    }
  }
}