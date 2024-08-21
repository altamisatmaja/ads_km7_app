part of '../../onboarding_injection.dart';

Container dotWidget(int index, int currentPage, BuildContext context) {
  return Container(
    width: 10,
    height: 10,
    margin: const EdgeInsets.only(right: 5.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Theme.of(context).primaryColor),
  );
}
