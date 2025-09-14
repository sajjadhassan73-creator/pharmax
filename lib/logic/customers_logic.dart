import '../models/customer_model.dart';

class CustomersLogic {
  static bool validateCustomer(CustomerModel customer) {
    return customer.name.trim().isNotEmpty;
  }

  static CustomerModel merge(CustomerModel oldData, CustomerModel newData) {
    return CustomerModel(
      id: oldData.id,
      name: newData.name,
      phone: newData.phone,
      email: newData.email,
      address: newData.address,
      notes: newData.notes,
      medicalHistory: newData.medicalHistory,
    );
  }

  static CustomerModel empty() => CustomerModel(
        name: '',
        phone: '',
        email: '',
        address: '',
        notes: '',
        medicalHistory: '',
      );
}
