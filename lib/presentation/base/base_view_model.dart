abstract class BaseViewModel implements BaseViewModelInput, BaseViewModelOutput{
  // Shared variable and functions that will be used
  // through any view model
}

abstract class BaseViewModelInput{
  void start();
  void dispose();
}

abstract class BaseViewModelOutput{}