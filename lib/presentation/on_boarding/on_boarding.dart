import 'package:advanced_flutter/presentation/on_boarding/on_boarding_view_model.dart';
import 'package:advanced_flutter/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter/presentation/resources/color_manager.dart';
import 'package:advanced_flutter/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../domain/slider_object.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController _pageController = PageController(initialPage: 0);

  OnBoardingViewModel _viewModel= OnBoardingViewModel();

  _bind(){
    _viewModel.start();
  }
  @override
  void initState() {
    _bind();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context,snapShot){
        return _getContentWidget(snapShot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject){
      if(sliderViewObject == null){
        return Container();
      }else{
        return Scaffold(
          backgroundColor: ColorManager.white,
          appBar: AppBar(
            backgroundColor: ColorManager.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark,
            ),
          ),
          body: PageView.builder(
            controller: _pageController,
            itemCount: sliderViewObject.numOfSlider,
            onPageChanged: (index) {
              _viewModel.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(sliderViewObject.sliderObject);
            },
          ),
          bottomSheet: Container(
            color: ColorManager.white,
            height: AppSize.s100,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO Add Skip Button
                    },
                    child: Text(
                      AppStrings.skip,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorManager.primary,
                      ),
                    ),
                  ),
                ),
                _getButtonSheetWidget(sliderViewObject),
              ],
            ),
          ),
        );
      }
  }

  Widget _getButtonSheetWidget(SliderViewObject sliderViewObject) {
    return Expanded(
      child: Container(
        color: ColorManager.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.leftArrowIcons),
                ),
                onTap: () {
                  _pageController.animateToPage(
                    _viewModel.goPrevious(),
                    duration: Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut,
                  );
                },
              ),
            ),

            Row(
              children: [
                for (int i = 0; i < sliderViewObject.numOfSlider; i++)
                  Padding(
                    padding: EdgeInsets.all(AppPadding.p8),
                    child: _getProperCircle(i,sliderViewObject.currentIndex),
                  ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.rightArrowIcons),
                ),
                onTap: () {
                  _pageController.animateToPage(
                    _viewModel.goNext(),
                    duration: Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _getProperCircle(int index, int _currentIndex) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIcons);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIcons);
    }
  }
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s40),
        Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(height: AppSize.s60),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}

