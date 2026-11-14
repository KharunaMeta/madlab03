/// Pure data for one cruise destination.
///
/// The model holds raw content only. It does not store booking choices
/// or notify the UI when something changes.
class CruiseDestination {
  const CruiseDestination({
    required this.name,
    required this.location,
    required this.landmark,
    required this.description,
    required this.imageAsset,
  });

  final String name;
  final String location;
  final String landmark;
  final String description;
  final String imageAsset;

  static const rajangExpress = CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    landmark: 'Sibu Esplanade Landmark',
    description:
        'Experience the heart of Sibu along Malaysia\'s longest river, '
        'the Rajang. Cruise past historic temples, timber hubs, and '
        'traditional waterfront settlements while experiencing authentic '
        'Sarawakian hospitality.',
    imageAsset: 'assets/images/rajang_header.jpg',
  );
}
