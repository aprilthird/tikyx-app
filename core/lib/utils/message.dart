class MessageUtils {
  static String requiredError(String fieldName) {
    return "El campo '$fieldName' es obligatorio.";
  }

  static String noValidError(String fieldName) {
    return "El campo '$fieldName' es inválido.";
  }

  static String noValidEmailError(String fieldName) {
    return "El campo '$fieldName' no es un email válido.";
  }

  static String digitsCountError(String fieldName, int limit) {
    return "El campo '$fieldName' debe tener $limit dígitos.";
  }

  static String rangeError(
      String fieldName, int greaterValue, int lesserValue) {
    return "El campo '$fieldName' debe encontrarse dentro del rango de $lesserValue a $greaterValue.";
  }

  static String greatThanError(String fieldName, int limit) {
    return "El campo '$fieldName' debe ser mayor a $limit.";
  }

  static String greatOrEqualThanError(String fieldName, int limit) {
    return "El campo '$fieldName' debe ser mayor o igual a $limit.";
  }

  static String lessThanError(String fieldName, int limit) {
    return "El campo '$fieldName' debe ser menor a $limit.";
  }

  static String lessOrEqualThanError(String fieldName, int limit) {
    return "El campo '$fieldName' debe ser menor o igual a $limit.";
  }
}
