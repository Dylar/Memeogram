// class Services extends InheritedWidget {
//   final DeviceBinding deviceBinding;
//   final AppGatewayServiceClient gatewayClient;
//   final ArticleDB articleDB;
//   final SupplierDB supplierDB;
//   final ArticleChangesService articleChangesService;
//   final ShelfChangesService shelfChangesService;
//   final ShelfLockService shelfLockService;
//   final ShelfVersionService shelfVersionService;
//   final ESLEditService eslEditService;
//   final ESLChangesService eslChangesService;
//   final PrintChangesService printChangesService;
//
//   const Services(
//       {@required this.articleDB,
//         @required this.supplierDB,
//         @required this.deviceBinding,
//         @required this.gatewayClient,
//         @required this.articleChangesService,
//         @required this.shelfChangesService,
//         @required this.shelfLockService,
//         @required this.shelfVersionService,
//         @required this.eslChangesService,
//         @required this.eslEditService,
//         @required this.printChangesService,
//         Key key,
//         Widget child})
//       : assert(articleDB != null),
//         assert(supplierDB != null),
//         assert(deviceBinding != null),
//         assert(gatewayClient != null),
//         assert(articleChangesService != null),
//         assert(shelfChangesService != null),
//         assert(shelfLockService != null),
//         assert(shelfVersionService != null),
//         assert(eslChangesService != null),
//         assert(eslEditService != null),
//         assert(printChangesService != null),
//         super(key: key, child: child);
//
//   factory Services.init({
//     @required ArticleDB articleDB,
//     @required SupplierDB supplierDB,
//     @required DeviceBinding deviceBinding,
//     @required AppGatewayServiceClient gatewayClient,
//     Key key,
//     Widget child,
//   }) {
//     final shelfVersionService = ShelfVersionService(
//       deviceBinding: deviceBinding,
//       gatewayClient: gatewayClient,
//     );
//     final shelfChangesService = ShelfChangesService(
//       deviceBinding: deviceBinding,
//       shelfVersionService: shelfVersionService,
//       articleDB: articleDB,
//     );
//     final eslEditService = ESLEditService(deviceBinding, gatewayClient);
//     final printChangesService = PrintChangesService(deviceBinding);
//
//     return Services(
//       articleDB: articleDB,
//       supplierDB: supplierDB,
//       deviceBinding: deviceBinding,
//       gatewayClient: gatewayClient,
//       articleChangesService: ArticleChangesService(
//           supplierDB: supplierDB,
//           articleDB: articleDB,
//           deviceBinding: deviceBinding),
//       shelfChangesService: shelfChangesService,
//       shelfLockService: ShelfLockService(deviceBinding: deviceBinding),
//       shelfVersionService: shelfVersionService,
//       eslChangesService: ESLChangesService(deviceBinding, eslEditService),
//       printChangesService: printChangesService,
//       eslEditService: eslEditService,
//       key: key,
//       child: child,
//     );
//   }
//
//   @visibleForTesting
//   const Services.create({
//     this.deviceBinding,
//     this.gatewayClient,
//     this.articleDB,
//     this.supplierDB,
//     this.articleChangesService,
//     this.shelfChangesService,
//     this.shelfLockService,
//     this.shelfVersionService,
//     this.eslEditService,
//     this.eslChangesService,
//     this.printChangesService,
//     Key key,
//     Widget child,
//   }) : super(key: key, child: child);
//
//   static Services of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<Services>();
//   }
//
//   @override
//   bool updateShouldNotify(Services oldWidget) {
//     return true;
//   }
// }
