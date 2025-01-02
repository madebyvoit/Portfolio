import 'package:portfolio/utils/responsive_layout.dart';
import 'package:portfolio/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/data/configs/configs.dart';

const double lineHeight = 4;
Color defaultLineColor = AppColors.loadingLineColor;

class LoadingHomePageAnimation extends StatefulWidget {
  static const String loadingPageRoute = 'Pascal Dohle';
  const LoadingHomePageAnimation({
    super.key,
    required this.text,
    required this.style,
    required this.onLoadingDone,
    this.lineColor,
  });

  final String text;
  final TextStyle style;
  final VoidCallback onLoadingDone;
  final Color? lineColor;

  @override
  State<LoadingHomePageAnimation> createState() =>
      _LoadingHomePageAnimationState();
}

class _LoadingHomePageAnimationState extends State<LoadingHomePageAnimation>
    with TickerProviderStateMixin {
  late AnimationController _fadeOutController;
  late AnimationController _containerController;
  late AnimationController _scaleOpacityController;
  late Animation<double> containerAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;
  late Animation<double> fadeAnimation;
  late Color lineColor;
  final Duration _scaleDuration = const Duration(milliseconds: 750);
  final Duration _leftRightContainerDuration =
      const Duration(milliseconds: 750);
  final Duration _containerDuration = const Duration(milliseconds: 2000);
  bool _leftRightAnimationStarted = false;
  bool _leftRightAnimationDone = false;
  bool _isAnimationOver = false;
  late Size size;
  late double textWidth;
  late double textHeight;

  @override
  void initState() {
    super.initState();
    setTextWidthAndHeight();
    lineColor = widget.lineColor ?? defaultLineColor;
    _scaleOpacityController = AnimationController(
      vsync: this,
      duration: _scaleDuration,
    );
    _containerController = AnimationController(
      vsync: this,
      duration: _containerDuration,
    );
    _fadeOutController = AnimationController(
      vsync: this,
      duration: _leftRightContainerDuration,
    );
    scaleAnimation = Tween<double>(begin: 0.9, end: 0.5).animate(
      CurvedAnimation(
        parent: _scaleOpacityController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    opacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleOpacityController,
        curve: Curves.easeIn,
      ),
    );
    fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _fadeOutController,
        curve: Curves.easeIn,
      ),
    );
    containerAnimation = Tween<double>(begin: 0, end: textWidth).animate(
      CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    _scaleOpacityController.forward();
    _scaleOpacityController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _containerController.forward();
        });
      }
    });
    _containerController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _leftRightAnimationStarted = true;
          _fadeOutController.forward();
        });
      }
    });

    _fadeOutController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _leftRightAnimationDone = true;
        });
      }
    });
  }

  void setTextWidthAndHeight() {
    size = Functions.textSize(
      text: widget.text,
      style: widget.style,
      context: context,
    );
    textWidth = size.width;
    textHeight = size.height;
  }

  @override
  void dispose() {
    _fadeOutController.dispose();
    _scaleOpacityController.dispose();
    _containerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setTextWidthAndHeight();
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double halfHeightOfScreen = screenHeight / 2;
    double leftContainerStart = (screenWidth / 2) - (textWidth / 2);
    double widthOfLeftLine = assignWidth(context, 0.5) - (textWidth / 2);
    double widthOfRightLine = screenWidth - ((screenWidth / 2) + (textWidth / 2));

    return _isAnimationOver
        ? const SizedBox(
            height: 0,
            width: 0,
          )
        : Stack(
            children: [
              AnimatedContainer(
                width: screenWidth,
                height: _leftRightAnimationDone ? 0 : halfHeightOfScreen + 0.5,
                duration: _scaleDuration,
                color: AppColors.darkBackground,
                onEnd: () {
                  widget.onLoadingDone();
                  setState(() {
                    _isAnimationOver = true;
                  });
                },
              ),
              Positioned(
                bottom: 0,
                child: AnimatedContainer(
                  width: screenWidth,
                  height:
                      _leftRightAnimationDone ? 0 : halfHeightOfScreen + 0.5,
                  duration: _scaleDuration,
                  color: AppColors.darkBackground,
                ),
              ),
              SizedBox(
                width: widthOfScreen(context),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          SizedBox(
                            width: textWidth,
                            child: FadeTransition(
                              opacity: fadeAnimation,
                              child: AnimatedBuilder(
                                animation: _scaleOpacityController,
                                child: DefaultTextStyle(
                                  style: widget.style,
                                  textAlign: TextAlign.center,
                                  child: Text(widget.text),
                                ),
                                builder: (context, child) => Transform.scale(
                                  scale: 2 * scaleAnimation.value,
                                  alignment: Alignment.center,
                                  child: AnimatedOpacity(
                                    opacity: opacityAnimation.value,
                                    duration: _scaleDuration,
                                    child: child,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widthOfLeftLine,
                            child: Stack(
                              children: [
                                RepaintBoundary(
                                  child: Container(
                                    width: widthOfLeftLine,
                                    height: lineHeight,
                                    decoration: BoxDecoration(
                                      color: lineColor,
                                    ),
                                  ),
                                ),
                                RepaintBoundary(
                                  child: AnimatedContainer(
                                    width: _leftRightAnimationStarted
                                        ? 0
                                        : leftContainerStart,
                                    height: lineHeight,
                                    color: AppColors.darkBackground,
                                    duration:
                                        _leftRightContainerDuration, // curve: Curves.ease,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          containerAnimationBuilder(
                            controller: _containerController,
                            animation: containerAnimation,
                            color: lineColor,
                          ),
                          SizedBox(
                            width: widthOfRightLine,
                            child: Stack(
                              children: [
                                RepaintBoundary(
                                  child: Container(
                                    width: widthOfRightLine,
                                    height: lineHeight,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(2),
                                        bottomRight: Radius.circular(2),
                                      ),
                                      color: lineColor,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: RepaintBoundary(
                                    child: AnimatedContainer(
                                      width: _leftRightAnimationStarted
                                          ? 0
                                          : widthOfRightLine,
                                      height: lineHeight,
                                      color: AppColors.darkBackground,
                                      duration: _leftRightContainerDuration,
                                      onEnd: () {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget containerAnimationBuilder({
    required Animation<double> animation,
    required AnimationController controller,
    Color color = Colors.red,
  }) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Container(
        height: lineHeight,
        width: animation.value,
        decoration: BoxDecoration(
          color: color,
        ),
      ),
    );
  }
}
