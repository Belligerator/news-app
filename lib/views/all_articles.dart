import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/locator.dart';
import 'package:news/models/article_dto.dart';
import 'package:news/models/tag_dto.dart';
import 'package:news/services/api_service.dart';
import 'package:news/theme/style.dart';
import 'package:news/views/article_detail.dart';
import 'package:news/widgets/list_item.dart';
import 'package:news/widgets/search_bar.dart';
import 'package:news/widgets/tag_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AllArticlesPage extends StatefulWidget {
  const AllArticlesPage({super.key});

  @override
  State<AllArticlesPage> createState() => _AllArticlesPageState();
}

class _AllArticlesPageState extends State<AllArticlesPage> {
  final ApiService _apiService = locator<ApiService>();

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  List<ArticleDto> articles = [];
  List<TagDto> tags = [];
  int _selectedIndex = 0;
  bool _isSearching = false;
  String? _selectedTagId;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _getTags();
    _getArticles();
  }

  /// Get tags from API.
  void _getTags() async {
    tags = await _apiService.getTags();
    setState(() {});
  }

  /// Get articles from API.
  void _getArticles() async {
    articles = await _apiService.getArticles(_selectedIndex == 0 ? 'news' : 'story', _selectedTagId);
    _refreshController.refreshCompleted();
    setState(() {});
  }

  /// Search articles by pattern. Use debounce to prevent multiple API calls.
  Future<void> _search(String pattern) async {
    // Cancel previous timer.
    if (_debounce != null && _debounce!.isActive) {
      _debounce!.cancel();
    }

    // Start new timer.
    _debounce = Timer(const Duration(milliseconds: 500), () async {

      // Reset selected tag.
      for (var element in tags) {
        element.selected = false;
      }
      _selectedTagId = null;

      // If pattern is empty, get all articles.
      if (pattern.isEmpty) {
        _getArticles();
        return;
      }

      articles = await _apiService.searchArticles(_selectedIndex == 0 ? 'news' : 'story', pattern);
      _refreshController.refreshCompleted();
      setState(() {});
    });
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });
            },
            icon: Icon(_isSearching ? Icons.search_off : Icons.search),
          )
        ],
        title: _isSearching ? SearchBar(onChanged: _search) : const Text('Best news'),
        bottom: TagBar(
            tags: tags,
            onTagSelected: (TagDto tag) {
              setState(() {
                for (var element in tags) {
                  if (element.id != tag.id) {
                    element.selected = false;
                  }
                }
                tag.selected = !tag.selected;
                _selectedTagId = tag.selected ? tag.id : null;
                _getArticles();
              });
            }),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: _getArticles,
        child: ListView.builder(
          padding: paddingMainView,
          itemCount: articles.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ArticleListItem(
                  article: articles[index],
                  onTap: (ArticleDto article) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ArticleDetail(article: article),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Stories',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _getArticles();
          });
        },
      ),
    );
  }
}
