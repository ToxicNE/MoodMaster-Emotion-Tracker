enum RegisterErrorEnum {
  incorrectEmail,
  diffrentPasswords,
  undefiendError,
  emailHasAlreadyBeenUsed,
  shortPassword;

  String get errorText {
    switch (this) {
      case RegisterErrorEnum.incorrectEmail:
        return "Incorrect Email";
      case RegisterErrorEnum.diffrentPasswords:
        return "Diffrent Passwords";
      case RegisterErrorEnum.shortPassword:
        return "Short Password";
      case RegisterErrorEnum.undefiendError:
        return "Undefiend Error";
      case RegisterErrorEnum.emailHasAlreadyBeenUsed:
        return "Email Has Already Been Used";
    }
  }
}
