class InputValidator{
  String simpleTextValidator(String value){
    if(value.length<3){
      return "Al menos 3 caracteres";
    }
    return null;
  }
  String passwordTextValidator(String value){
    if(value.length<8){
      return "Al menos 8 caracteres";
    }
    return null;
  }
}