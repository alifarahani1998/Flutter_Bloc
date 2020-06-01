import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/Employee/Employee.dart';
import 'package:flutterapp/bloc/Employee_Bloc.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final EmployeeBloc _employeeBloc = new EmployeeBloc();


  @override
  void dispose() {
    _employeeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Employee App"
        ),
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBloc.employeeListStream,
          builder: (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            return ListView.builder(
                itemBuilder: (context, position) {
                  return Card(
                    elevation: 5.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "${snapshot.data[position].id}",
                            style: TextStyle(
                              fontSize: 20.0
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${snapshot.data[position].name}",
                                style: TextStyle(
                                  fontSize: 18.0
                                ),
                              ),
                              Text(
                                "\$ ${snapshot.data[position].salary}",
                                style: TextStyle(
                                    fontSize: 16.0
                                ),
                              )
                            ],
                          )
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(Icons.thumb_up, color: Colors.green,),
                            onPressed: () {
                              _employeeBloc.employeeSalaryIncrement.add(snapshot.data[position]);
                            },
                          ),
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(Icons.thumb_down, color: Colors.red,),
                            onPressed: () {
                              _employeeBloc.employeeSalaryDecrement.add(snapshot.data[position]);
                            },
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: snapshot.data.length,);
          },
        ),
      ),
    );
  }
}
