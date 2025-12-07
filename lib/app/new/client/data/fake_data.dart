class ClientData {
  final String? name;
  final String? phone;
  final String? address;
  final String? password;

  ClientData({
    this.address,
    this.password,
    required this.name,
    required this.phone,
  });
}

List<ClientData> clientList = [
  ClientData(name: "name1 name1", phone: "123456789"),
  ClientData(name: "name2 name2", phone: "123456789"),
  ClientData(name: "name3 name3", phone: "123456789"),
  ClientData(name: "name4 name4", phone: "123456789"),
  ClientData(name: "name5 name5", phone: "123456789"),
  ClientData(name: "name6 name6", phone: "123456789"),
];
