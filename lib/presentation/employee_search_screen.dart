import 'package:employee_directory/api_folders/employee_details_model.dart';
import 'package:flutter/material.dart';

class EmployeeSearchDelegate extends SearchDelegate {
  final List<EmployeeDetailsModel?>? employeeList;
  final Function? onPassengerClick;

  EmployeeSearchDelegate({this.employeeList, this.onPassengerClick});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  List<EmployeeDetailsModel?>? _suggestedList(String query) {
    List<EmployeeDetailsModel?>? _searchList = [];
    employeeList?.forEach((employee) {
      if (employee!.name!.toLowerCase().contains(query)) {
        _searchList.add(EmployeeDetailsModel.copy(employee));
      }
    });
    return _searchList;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      List<EmployeeDetailsModel?> _suggestionList = [];
      _suggestionList = _suggestedList(query) ?? [];
      return ListView.builder(
          itemCount: _suggestionList.length,
          itemBuilder: (BuildContext context, int employeeIndex) => InkWell(
                child: ListTile(
                    title: Text(_suggestionList[employeeIndex]?.name ?? '')),
                onTap: () {
                  Navigator.of(context).pop();
                  onPassengerClick?.call(_suggestionList[employeeIndex]);
                },
              ));
    } else {
      return ListView.builder(
          itemCount: employeeList!.length,
          itemBuilder: (BuildContext context, int employeeIndex) => InkWell(
                child: ListTile(
                    title: Text(employeeList![employeeIndex]?.name ?? '')),
                onTap: () {
                  Navigator.of(context).pop();
                  onPassengerClick?.call(employeeList![employeeIndex]);
                },
              ));
      ;
    }
  }
}
