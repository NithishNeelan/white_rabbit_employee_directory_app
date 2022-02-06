import 'package:employee_directory/api_folders/employee_details_model.dart';
import 'package:employee_directory/presentation/employee_details_page.dart';
import 'package:employee_directory/presentation/employee_search_screen.dart';
import 'package:flutter/material.dart';

import '../api_folders/employee_details_repository.dart';

/// Is the starting screen where the user reaches on opening the app.
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  EmployeeDetailsRepository? _employeeDetailsRepository;
  @override
  void initState() {
    super.initState();
    _employeeDetailsRepository = EmployeeDetailsRepository();
  }

  /// Returns the list tile required for each passenger
  Widget _listTile(BuildContext context, EmployeeDetailsModel? model) =>
      InkWell(
        child: ListTile(
          title: Text(model?.name ?? ''),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EmployeeDetailsPage(
                      model: model,
                    )),
          );
        },
      );

  /// Search employees button.
  Widget _searchButton(BuildContext context) => IconButton(
        onPressed: () {
          showSearch(
            context: context,
            delegate: EmployeeSearchDelegate(
                employeeList: _employeeDetailsRepository?.employeeList,
                onPassengerClick: (EmployeeDetailsModel? model) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmployeeDetailsPage(model: model),
                    ),
                  );
                }),
          );
        },
        icon: const Icon(Icons.search),
      );

  /// Body of the scaffold page widget.
  Widget _scaffoldBody(BuildContext context) =>
      FutureBuilder<List<EmployeeDetailsModel?>?>(
        future: _employeeDetailsRepository?.getEmployeeDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Following are the list of employees'),
                ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int itemIndex) =>
                        _listTile(
                            context,
                            _employeeDetailsRepository
                                ?.employeeList?[itemIndex]),
                    itemCount: _employeeDetailsRepository?.employeeList?.length)
              ],
            );
          }
          return const CircularProgressIndicator();
        },
      );

  /// Welcome screen widget.
  Widget _welcomeScreen(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: const Text('Welcome'),
            actions: [_searchButton(context)],
            leading: null),
        body: _scaffoldBody(context),
      );

  @override
  Widget build(BuildContext context) => _welcomeScreen(context);
}
