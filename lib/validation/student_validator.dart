mixin StudentValidationMixin{

  String validateFirtName(String? value){
    if(value == null || value.isEmpty){
      return "İsim boş olamaz.";
    }else if(value.length<2){
      return "İsim en az iki karakter olmalıdır.";
    }else
      return "başarılı";
  }

  String validateLastName(String? value){
    if(value == null || value.isEmpty){
      return "Soyisim boş olamaz.";
    }else if(value.length<2){
      return "Soyisim en az iki karakter olmalıdır.";
    }else
      return "başarılı";
  }

  String validateGrade(String? value){
    var grade = int.parse(value!);
    if(grade < 0 || grade > 100){
      return "0-100 arasında olmalıdır.";
    }else
      return "başarılı";
  }
}