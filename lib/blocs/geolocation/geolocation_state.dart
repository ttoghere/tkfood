part of 'geolocation_bloc.dart';

abstract class GeolocationState extends Equatable {
  const GeolocationState();

  @override
  List<Object> get props => [];
}

class GeolocationLoading extends GeolocationState {}

class GeolocationLoaded extends GeolocationState {
  final Position position;
  const GeolocationLoaded({required this.position});
  @override
  // TODO: implement props
  List<Object> get props => [position];
}

class GeolocationError extends GeolocationState {}
