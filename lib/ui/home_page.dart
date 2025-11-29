import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptoapp/helpers/decimal_rounder.dart';
import 'package:cryptoapp/models/cryptoModel/crypto_data.dart';
import 'package:cryptoapp/network/response_model.dart';
import 'package:cryptoapp/provider/crypto_data_provider.dart';
import 'package:cryptoapp/ui/ui_helper/home_page_view.dart';
import 'package:cryptoapp/ui/ui_helper/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageViewController = PageController(initialPage: 0);

  var defaultChoiceIndex = 0;

  final List<String> _choicesList = [
    'Top MarketCaps',
    'Top Gainers',
    'Top Losers',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cryptoProvider = Provider.of<CryptoDataProvider>(
      context,
      listen: false,
    );
    cryptoProvider.getTopMarketCapData();
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Flutter Course A',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        actions: [ThemeSwitcher()],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // PageView
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 5, right: 5),
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      HomePageView(controller: _pageViewController),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: SmoothPageIndicator(
                            controller: _pageViewController,
                            count: 4,
                            effect: const ExpandingDotsEffect(
                              dotWidth: 10,
                              dotHeight: 10,
                            ),
                            onDotClicked: (index) =>
                                _pageViewController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: Marquee(
                    text: 'This is top news for application 💰',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.all(20),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Buy',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.all(20),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Sell',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(_choicesList.length, (index) {
                    return ChoiceChip(
                      label: Text(
                        _choicesList[index],
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      selected: defaultChoiceIndex == index,
                      selectedColor: Colors.blue,
                      onSelected: (value) {
                        setState(() {
                          defaultChoiceIndex = value
                              ? index
                              : defaultChoiceIndex;
                        });
                      },
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 500,
                child: Consumer<CryptoDataProvider>(
                  builder: (context, cryptoDataProvider, child) {
                    switch (cryptoDataProvider.state.status) {
                      case Status.LOADING:
                        return SizedBox(
                          height: 80,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.shade400,
                            highlightColor: Colors.white,
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsGeometry.only(
                                        top: 8,
                                        bottom: 8,
                                        left: 8,
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30,
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8.0,
                                          left: 8,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 50,
                                              height: 15,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: SizedBox(
                                                width: 25,
                                                height: 15,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: SizedBox(
                                        width: 70,
                                        height: 40,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 50,
                                              height: 15,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
                                              child: SizedBox(
                                                width: 25,
                                                height: 15,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      case Status.COMPLETED:
                        List<CryptoData>? model = cryptoDataProvider
                            .dataFuture
                            .data!
                            .cryptoCurrencyList;
                        print(model![0].symbol);
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            var number = index + 1;
                            var tokenId = model[index].id;
                            MaterialColor filterColor =
                                DecimalRounder.setColorFilter(
                                  model[index].quotes![0].percentChange24H,
                                );
                            var finalPrice = DecimalRounder.removePriceDecimals(
                              model[index].quotes![0].price,
                            );
                            // percent change setup decimals and colors
                            var percentChange =
                                DecimalRounder.removePercentDecimals(
                                  model[index].quotes![0].percentChange24H,
                                );

                            Color percentColor =
                                DecimalRounder.setPercentChangesColor(
                                  model[index].quotes![0].percentChange24H,
                                );
                            Icon percentIcon =
                                DecimalRounder.setPercentChangesIcon(
                                  model[index].quotes![0].percentChange24H,
                                );
                            return SizedBox(
                              height: height * 0.075,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsGeometry.only(left: 10),
                                    child: Text(
                                      number.toString(),
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 15,
                                    ),
                                    child: CachedNetworkImage(
                                      fadeInDuration: const Duration(
                                        milliseconds: 500,
                                      ),
                                      height: 32,
                                      width: 32,
                                      imageUrl:
                                          "https://s2.coinmarketcap.com/static/img/coins/32x32/$tokenId.png",
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) {
                                        return const Icon(Icons.error);
                                      },
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          model[index].name!,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodySmall,
                                        ),
                                        Text(
                                          model[index].symbol!,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                        filterColor,
                                        BlendMode.srcATop,
                                      ),
                                      child: SvgPicture.network(
                                        'https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/$tokenId.svg',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "\$$finalPrice",
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodySmall,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              percentIcon,
                                              Text(
                                                " $percentChange%",
                                                style: GoogleFonts.ubuntu(
                                                  color: percentColor,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: model.length,
                        );
                      case Status.ERROR:
                        return Text(cryptoDataProvider.state.message);
                      default:
                        return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
