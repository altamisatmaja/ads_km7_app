part of '../../fragment_injection.dart';

Widget _buildSearchBar(
    dynamic searchBarKey, dynamic positionSearchBar, BuildContext context) {
  return Positioned(
    key: searchBarKey,
    top: positionSearchBar,
    left: 16,
    right: 16,
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: ADSColor.borderColor,
            spreadRadius: 0.5,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: ADSColor.textSecondary,
            size: 16,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Medicine & Healthcare products',
                border: InputBorder.none, // Menghilangkan border default
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: ADSColor.textSecondary),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0), // Padding di dalam TextField
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
