import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'model/recipe_entity.dart';

class RecipeState implements Cloneable<RecipeState> {
  List<RecipeData> data;
  TabController tabController;
  List<HomeDataRecipe> recipe;

  @override
  RecipeState clone() {
    return RecipeState()
      ..data = data
      ..recipe = recipe
      ..tabController = tabController;
  }
}

RecipeState initState(Map<String, dynamic> args) {
  return RecipeState()
    ..data = []
    ..data = (args['recipe'] as List<HomeDataRecipe>)
        .map((item) => RecipeData(title: item.name))
        .toList();
}

class RecipePageState extends ComponentState<RecipeState>
    with SingleTickerProviderStateMixin {}
