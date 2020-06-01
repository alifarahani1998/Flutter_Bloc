/*

//TODO: imports

//TODO: List of objects >>> here is list of employee

//TODO: Stream controllers

//TODO: stream and sink getter

//TODO: constructor - add data - listen to changers

//TODO: core functions

//TODO: dispose



// sink to add data to pipe
//stream to get data from pipe
//pip is data flow

*/

//  1- imports
import 'dart:async';
import 'package:flutterapp/Employee/Employee.dart';


class EmployeeBloc {


  //  2- list of objects
  List<Employee> _employeeList = [

    Employee(1, "Employee One", 10000.0),
    Employee(2, "Employee Two", 20000.0),
    Employee(3, "Employee Three", 30000.0),
    Employee(4, "Employee Four", 40000.0),
    Employee(5, "Employee Five", 50000.0),

  ];


  //  3- general
  final _employeeListStreamController = StreamController<List<Employee>>();


  //  3- for inc and dec
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();


  //  4- getters
  Stream<List<Employee>> get employeeListStream => _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink => _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement => _employeeSalaryIncrementStreamController.sink;
  StreamSink<Employee> get employeeSalaryDecrement => _employeeSalaryDecrementStreamController.sink;


  //  5- constructor

  EmployeeBloc() {
    _employeeListStreamController.add(_employeeList);
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

  //  6- core functions
  _incrementSalary(Employee employee) {
    double salary = employee.salary;

    double incrementedSalary = salary * 20 / 100;
    _employeeList[employee.id - 1].salary = salary + incrementedSalary;

    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;

    double decrementedSalary = salary * 20 / 100;
    _employeeList[employee.id - 1].salary = salary - decrementedSalary;

    employeeListSink.add(_employeeList);
  }


  //  7- dispose
  void dispose() {
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
    _employeeListStreamController.close();
  }

}
