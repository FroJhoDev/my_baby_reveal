enum FlavorProducts {
  family,
  parents,
}

class FlavorConfig {
  String appName = '';
  FlavorProducts flavor = FlavorProducts.family;

  static FlavorConfig shared = FlavorConfig.create();

  factory FlavorConfig.create({
    String appName = '',
    FlavorProducts flavor = FlavorProducts.family,
  }) {
    return shared = FlavorConfig(appName, flavor);
  }

  FlavorConfig(this.appName, this.flavor);
}