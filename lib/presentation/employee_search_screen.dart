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

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      return ListView.builder(
          itemBuilder: (BuildContext context, int employeeIndex) => InkWell(
                child: ListTile(
                    title: Text(employeeList?[employeeIndex]?.name ?? '')),
                onTap: () {
                  onPassengerClick?.call(employeeList?[employeeIndex]);
                },
              ));
    } else {
      return const Text('Empty');
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
