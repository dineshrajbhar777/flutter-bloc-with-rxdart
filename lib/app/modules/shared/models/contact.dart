class Contact {
  int id;
  String name, phone, email, category;
  bool enable;

  Contact({
    this.id,
    this.name, this.phone, this.email, this.category,
    this.enable,
  });

  Map<String, dynamic> toJson() {
    return {
      "id":       this.id,
      "name":     this.name,
      "phone":    this.phone,
      "email":    this.email,
      "category": this.category,
      "enable":   this.enable   == false ? 0 : 1,
    };
  }
}
