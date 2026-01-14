class CreditCardIcons {
  static String getIcon(String brand) {
    switch (brand) {
      case "visa":
        return 'assets/svgs/visa.svg';
      case "amex":
        return 'assets/svgs/amex.svg';
      case "mastercard":
        return 'assets/svgs/mastercard.svg';
      case "discover":
        return 'assets/svgs/discover.svg';
      case "cash":
        return 'assets/svgs/cash.svg';
      default:
        return 'assets/svgs/unknown.svg';
    }
  }
}
