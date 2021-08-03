import 'package:flutter/material.dart';

class HomeOption {
  final IconData homeOptionIcon;
  final String homeOptionText;
  HomeOption({
    required this.homeOptionIcon,
    required this.homeOptionText,
  });
}

List<HomeOption> homeOptions = [
  HomeOption(
    homeOptionIcon: Icons.location_on_outlined,
    homeOptionText: "Shipping Address",
  ),
  HomeOption(
    homeOptionIcon: Icons.payment_outlined,
    homeOptionText: "Payment Method",
  ),
  HomeOption(
    homeOptionIcon: Icons.history,
    homeOptionText: "Order History",
  ),
  HomeOption(
    homeOptionIcon: Icons.delivery_dining_outlined,
    homeOptionText: "Delivery Status",
  ),
  HomeOption(
    homeOptionIcon: Icons.language_outlined,
    homeOptionText: "Language",
  ),
  HomeOption(
    homeOptionIcon: Icons.favorite_border,
    homeOptionText: "Favorite",
  ),
  HomeOption(
    homeOptionIcon: Icons.lock_outlined,
    homeOptionText: "Privacy Policy",
  ),
  HomeOption(
    homeOptionIcon: Icons.quiz_outlined,
    homeOptionText: "Frequently Asked Questions",
  ),
  HomeOption(
    homeOptionIcon: Icons.info_outline,
    homeOptionText: "Legal Information",
  ),
  HomeOption(
    homeOptionIcon: Icons.star,
    homeOptionText: "Rate Our App.",
  )
];
