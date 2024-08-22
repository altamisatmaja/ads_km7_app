part of '../../fragment_injection.dart';

class HomeDealsOfTheDayWidget extends StatelessWidget {
  const HomeDealsOfTheDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Deals of the Day",
                  style: Theme.of(context).textTheme.headlineSmall),
              Text("More",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: ADSColor.secondary)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 240,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final isFirst = index == 0;
              final isLast = index == 1;
              return Padding(
                padding: EdgeInsets.only(
                  left: isFirst ? 20.0 : 0.0,
                  right: isLast ? 20.0 : 0.0,
                ),
                child: _buildDealItem(
                  context,
                  image: 'assets/images/product_image_${index + 1}.png',
                  title: index == 0
                      ? 'Accu-check Active Test Strip'
                      : 'Omron HEM-8712 BP Monitor',
                  price: index == 0 ? 'Rp 112.000' : 'Rp 150.000',
                  rating: index == 0 ? '4.2' : '4.0',
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDealItem(BuildContext context,
      {required String image,
      required String title,
      required String price,
      required String rating}) {
    return Column(
      children: [
        Container(
          width: 185,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: ADSColor.borderColor,
                blurRadius: 4.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ADSColor.backgroundProduct,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      image,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 6.0),
                    child: Text(price,
                        style: Theme.of(context).textTheme.labelLarge),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      color: ADSColor.secondary,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(rating,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
      ],
    );
  }
}
