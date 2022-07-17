// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/downloads/downloads_bloc.dart' as _i5;
import '../../../application/fast_laugh/fast_laugh_bloc.dart' as _i6;
import '../../../application/hot_and_new/hot_and_new_bloc.dart' as _i11;
import '../../../application/search/search_bloc.dart' as _i12;
import '../../../infrastructure/downloads/downloads_impl.dart' as _i4;
import '../../../infrastructure/hot_and_new/hot_and_new_impl.dart' as _i8;
import '../../../infrastructure/search/saerch_impl.dart' as _i10;
import '../../downloads/download_service.dart' as _i3;
import '../../hot_and_new/hot_and_new_service.dart' as _i7;
import '../../search/search_service.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.DownloadService>(() => _i4.DownloadsRepository());
  gh.factory<_i5.DownloadsBloc>(
      () => _i5.DownloadsBloc(get<_i3.DownloadService>()));
  gh.factory<_i6.FastLaughBloc>(
      () => _i6.FastLaughBloc(get<_i3.DownloadService>()));
  gh.lazySingleton<_i7.HotAndNewService>(() => _i8.HotAndNewImplementation());
  gh.lazySingleton<_i9.SearchService>(() => _i10.SearchImpl());
  gh.factory<_i11.HotAndNewBloc>(
      () => _i11.HotAndNewBloc(get<_i7.HotAndNewService>()));
  gh.factory<_i12.SearchBloc>(() =>
      _i12.SearchBloc(get<_i9.SearchService>(), get<_i3.DownloadService>()));
  return get;
}
