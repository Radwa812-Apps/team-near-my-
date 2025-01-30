part of 'custom_places_bloc.dart';

// Base state class
class CustomPlacesState {}

// Initial state for adding custom places
class AddCustomPlacesInitial extends CustomPlacesState {}

// Loading state for adding custom places
class AddCustomPlacesLoading extends CustomPlacesState {}

// Success state for adding custom places
class AddCustomPlacesSuccess extends CustomPlacesState {}

// Failure state for adding custom places
class AddCustomPlacesFailure extends CustomPlacesState {
  final String error;

  AddCustomPlacesFailure(this.error);
}

// Initial state for updating custom places
class UpdateCustomPlacesInitial extends CustomPlacesState {}

// Loading state for updating custom places
class UpdateCustomPlacesLoading extends CustomPlacesState {}

// Success state for updating custom places
class UpdateCustomPlacesSuccess extends CustomPlacesState {}

// Failure state for updating custom places
class UpdateCustomPlacesFailure extends CustomPlacesState {
  final String error;

  UpdateCustomPlacesFailure(this.error);
}

// Initial state for deleting custom places
class DeleteCustomPlacesInitial extends CustomPlacesState {}

// Loading state for deleting custom places
class DeleteCustomPlacesLoading extends CustomPlacesState {}

// Success state for deleting custom places
class DeleteCustomPlacesSuccess extends CustomPlacesState {}

// Failure state for deleting custom places
class DeleteCustomPlacesFailure extends CustomPlacesState {
  final String error;

  DeleteCustomPlacesFailure(this.error);
}

class ShowCustomPlacesInitial extends CustomPlacesState {}

class ShowCustomPlacesLoading extends CustomPlacesState {}

class ShowCustomPlacesSuccess extends CustomPlacesState {
  final List<CustomPlace> places;
  ShowCustomPlacesSuccess(this.places);
}

class ShowCustomPlacesFailure extends CustomPlacesState {
  final String error;
  ShowCustomPlacesFailure(this.error);
}
