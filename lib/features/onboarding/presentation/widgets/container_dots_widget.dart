part of '../../onboarding_injection.dart';

Container dotWidget(int index, int currentPage, BuildContext context) {
  return Container(
    width: 10,
    height: 10,
    margin: const EdgeInsets.symmetric(horizontal: 4.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color:
          index == currentPage ? Theme.of(context).primaryColor : Colors.grey,
    ),
  );
}
