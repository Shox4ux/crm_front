enum AdminPermission {
  primary,
  secondry;

  String toPermit(int i) =>
      AdminPermission.values.where((v) => v.index == i).first.name;
}
