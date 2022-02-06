import 'package:employee_directory/api_folders/employee_details_model.dart';
import 'package:flutter/material.dart';

/// Constants used in this page.
const _spaceBetweenComponents = SizedBox(height: 10.0);

class EmployeeDetailsPage extends StatefulWidget {
  const EmployeeDetailsPage({Key? key, this.model}) : super(key: key);
  final EmployeeDetailsModel? model;

  @override
  State<EmployeeDetailsPage> createState() => _EmployeeDetailsPageState();
}

class _EmployeeDetailsPageState extends State<EmployeeDetailsPage> {
  /// Employee details page.
  Widget _detailsPage(BuildContext context) => ListView(
        children: [
          Text('Name : ${widget.model?.name ?? ''}'),
          _spaceBetweenComponents,
          Text('Username : ${widget.model?.username ?? ''}'),
          _spaceBetweenComponents,
          Text('ID : ${widget.model?.id?.toString() ?? ''}'),
          _spaceBetweenComponents,
          Text('Email ID : ${widget.model?.email ?? ''}'),
          _spaceBetweenComponents,
          Text('Phone umber : ${widget.model?.phone ?? ''}'),
          _spaceBetweenComponents,
          const Text('Address details:'),
          Text(widget.model?.address?.city ?? ''),
          Text(widget.model?.address?.street ?? ''),
          Text(widget.model?.address?.suite ?? ''),
          Text(widget.model?.address?.zipcode ?? ''),
          Text(widget.model?.address?.geo?.lat ?? ''),
          Text(widget.model?.address?.geo?.lng ?? ''),
          _spaceBetweenComponents,
          const Text('Company details:'),
          Text(widget.model?.company?.catchPhrase ?? ''),
          Text(widget.model?.company?.bs ?? ''),
          Text(widget.model?.company?.name ?? ''),
          _spaceBetweenComponents,
          Text('Profile Image : ${widget.model?.profileImage ?? ''}'),
          _spaceBetweenComponents,
          Text('Website : ${widget.model?.website ?? ''}')
        ],
      );

  /// Scaffold widget.
  Widget _scaffoldWidget(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Employee Details'),
        ),
        body: _detailsPage(context),
      );

  @override
  Widget build(BuildContext context) => _scaffoldWidget(context);
}
