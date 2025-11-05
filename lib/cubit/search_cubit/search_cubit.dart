import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  int _page = 1;
  int _pageSize = 10;
  bool _hasMore = true;
  bool _isFetch = false;
  List<Articles> _allArticles = [];

  Future<void> searchArticles(String query) async {
    if (!_hasMore || _isFetch) return;
    _isFetch = true;

    emit(LoadingState());
    try {
      final articles = await ApiManager.searchArticles(
        searchQuery: query,
        page: _page,
        pageSize: _pageSize,
      );

      if (articles == null || articles.isEmpty) {
        emit(EmptyState('No articles found'));
        _hasMore = false;
      } else {
        _allArticles.addAll(articles);
        emit(SuccessState(List.from(_allArticles)));
        _page++;
        _isFetch = false;
      }
    } catch (e) {
      emit(ErrorState('Failed to fetch search results: $e'));
    }
  }
}
