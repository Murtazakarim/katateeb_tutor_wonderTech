import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:flutter_onboard/src/contants/constants.dart';
import 'package:flutter_onboard/src/models/onboard_state_model.dart';
import 'package:flutter_onboard/src/providers/providers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnBoard extends HookConsumerWidget {
  /// Data for OnBoard [List<OnBoardModel>]
  /// @Required
  final List<OnBoardModel> onBoardData;

  /// OnTapping skip button action
  final VoidCallback? onSkip;

  /// OnTapping done button action
  final VoidCallback? onDone;

  /// Controller for [PageView]
  /// @Required
  final PageController pageController;

  /// Title text style
  final TextStyle? titleStyles;

  /// Description text style
  final TextStyle? descriptionStyles;

  /// OnBoard Image width
  final double? imageWidth;

  /// OnBoard Image height
  final double? imageHeight;

  /// Skip Button Widget
  final Widget? skipButton;

  final Widget? backButton;

  /// Next Button Widget
  final Widget? nextButton;

  /// Animation [Duration] for transition from one page to another
  /// @Default [Duration(milliseconds:250)]
  final Duration duration;

  /// [Curve] used for animation
  /// @Default [Curves.easeInOut]
  final Curve curve;

  /// [PageIndicatorStyle] dot styles
  final PageIndicatorStyle pageIndicatorStyle;

  const OnBoard({
    Key? key,
    required this.onBoardData,
    this.backButton,
    this.onSkip,
    this.onDone,
    required this.pageController,
    this.titleStyles,
    this.descriptionStyles,
    this.imageWidth,
    this.imageHeight,
    this.skipButton,
    this.nextButton,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
    this.pageIndicatorStyle = const PageIndicatorStyle(
        width: 150,
        activeColor: Colors.blue,
        inactiveColor: Colors.blueAccent,
        activeSize: Size(12, 12),
        inactiveSize: Size(8, 8)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      child: _OnBoard(
        onBoardData: onBoardData,
        pageController: pageController,
        onSkip: onSkip,
        backButton: backButton,
        onDone: onDone,
        titleStyles: titleStyles,
        descriptionStyles: descriptionStyles,
        imageWidth: imageWidth,
        imageHeight: imageHeight,
        skipButton: skipButton,
        nextButton: nextButton,
        duration: duration,
        curve: curve,
        pageIndicatorStyle: pageIndicatorStyle,
      ),
    );
  }
}

class _OnBoard extends HookConsumerWidget {
  /// Data for OnBoard [List<OnBoardModel>]
  /// @Required
  final List<OnBoardModel> onBoardData;

  /// OnTapping skip button action
  final VoidCallback? onSkip;

  /// OnTapping done button action
  final VoidCallback? onDone;

  /// Controller for [PageView]
  /// @Required
  final PageController pageController;

  /// Title text style
  final TextStyle? titleStyles;

  /// Description text style
  final TextStyle? descriptionStyles;

  /// OnBoard Image width
  final double? imageWidth;

  /// OnBoard Image height
  final double? imageHeight;

  /// Skip Button Widget
  final Widget? skipButton;

  final Widget? backButton;

  /// Next Button Widget
  final Widget? nextButton;

  /// Animation [Duration] for transition from one page to another
  /// @Default [Duration(milliseconds:250)]
  final Duration duration;

  /// [Curve] used for animation
  /// @Default [Curves.easeInOut]
  final Curve curve;

  /// [PageIndicatorStyle] dot styles
  final PageIndicatorStyle pageIndicatorStyle;

  const _OnBoard({
    Key? key,
    required this.onBoardData,
    this.onSkip,
    this.backButton,
    this.onDone,
    required this.pageController,
    this.titleStyles,
    this.descriptionStyles,
    this.imageWidth,
    this.imageHeight,
    this.skipButton,
    this.nextButton,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
    this.pageIndicatorStyle = const PageIndicatorStyle(
        width: 150,
        activeColor: Colors.blue,
        inactiveColor: Colors.blueAccent,
        activeSize: Size(12, 12),
        inactiveSize: Size(8, 8)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onBoardState = ref.watch(onBoardStateProvider);
    final onBoardStateNotifier = ref.watch(onBoardStateProvider.notifier);

    final screenSize = MediaQuery.of(context).size;
    final double pageViewHeight = screenSize.height -
        skipContainerHeight -
        footerContentHeight -
        pageIndicatorHeight;

    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(!pageController.hasClients)
                Container(
                  height: skipContainerHeight,
                  alignment: Alignment.centerLeft,
                  child: skipButton ??
                      TextButton(
                        onPressed: () => _onSkipPressed(onSkip),
                        child: const Text(
                          "Skip",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                ),
              if(pageController.hasClients)
                if(pageController.page!.round() == 0)
              const Expanded(child: SizedBox()),
              if(pageController.hasClients)
              if(pageController.page!.round() != 0)
            Container(
              height: skipContainerHeight,
              alignment: Alignment.centerLeft,
              child: skipButton ??
                  TextButton(
                    onPressed: () => _onSkipPressed(onSkip),
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
            ),
            if(pageController.hasClients)
            if(pageController.page!.round() != 2)
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)),
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: backButton ?? const SizedBox(),
            ),
          ],),
          Expanded(
            child: SizedBox(
                height: pageViewHeight,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (page) => onBoardStateNotifier.onPageChanged(
                      page, onBoardData.length),
                  itemCount: onBoardData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: SvgPicture.asset(
                              width: imageWidth,
                              height: imageHeight,
                              fit: BoxFit.contain, onBoardData[index].imgUrl,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              onBoardData[index].title,
                              textAlign: TextAlign.center,
                              style: titleStyles ??
                                  const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              onBoardData[index].description,
                              textAlign: TextAlign.center,
                              style: descriptionStyles ??
                                  const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ),
          Container(
            height: footerContentHeight,
            width: screenSize.width,
            alignment: Alignment.center,
            child: ButtonTheme(
              minWidth: 230,
              height: 50,
              child: nextButton != null
                  ? nextButton!
                  : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 0,
                ),
                onPressed: () => _onNextTap(onBoardState),
                child: Text(
                  onBoardState.isLastPage ? "Done" : "Next",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: pageIndicatorHeight,
            child: PageIndicator(
              count: onBoardData.length,
              activePage: pageController.hasClients ? pageController.page!.round(): pageController.initialPage,
              pageIndicatorStyle: pageIndicatorStyle,
            ),
          ),
        ],
      ),
    );
  }

  void _onNextTap(OnBoardState state) {
    if (!state.isLastPage) {
      pageController.animateToPage(
        state.page + 1,
        duration: duration,
        curve: curve,
      );
    } else {
      if (onDone == null) {
        throw Exception(
            'Either provide "onDone" callback or add "nextButton" Widget to "OnBoard" Widget to handle done state');
      } else {
        onDone!();
      }
    }
  }

  void _onSkipPressed(VoidCallback? onSkip) {
    if (onSkip == null) {
      throw Exception(
          'Either provide "onSkip" callback or add "skipButton" Widget to "OnBoard" Widget to handle skip state');
    } else {
      onSkip();
    }
  }
}


class PageIndicatorStyle {
  final double? width;
  final Color? activeColor;
  final Color? inactiveColor;
  final Size? activeSize;
  final Size? inactiveSize;

  const PageIndicatorStyle({
    this.width,
    this.activeColor,
    this.inactiveColor,
    this.activeSize,
    this.inactiveSize,
  });
}


class PageIndicator extends StatelessWidget {
  /// No of dot to be appeared should be equal to
  /// the length of the [List<OnBoardModel>]
  final int count;

  /// Active page
  final int activePage;

  /// styling [PageIndicatorStyle]
  final PageIndicatorStyle? pageIndicatorStyle;

  const PageIndicator({
    Key? key,
    required this.count,
    required this.activePage,
    this.pageIndicatorStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dots = List.generate(count, _dotBuilder);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOutSine,
      width: pageIndicatorStyle!.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _dots,
      ),
    );
  }

  Widget _dotBuilder(index) {
    final activeSize = pageIndicatorStyle!.activeSize;
    final inactiveSize = pageIndicatorStyle!.inactiveSize;

    return index == activePage
        ? Container(
      width: activeSize!.width,
      height: activeSize.height,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: pageIndicatorStyle!.activeColor,
      ),
    )
        : Container(
      width: inactiveSize!.width,
      height: inactiveSize.height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: pageIndicatorStyle!.inactiveColor,
      ),
    );
  }
}
