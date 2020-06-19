import 'app_state.dart';
import 'actions.dart';

AppState AppReducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);

  if (action is myAccount) {
    newState.myAccount = action.payload;
  } else if (action is myNetwork) {
    newState.myNetwork = action.payload;
  } else if (action is myBalance) {
    newState.myBalance = action.payload;
  }

  return newState;
}