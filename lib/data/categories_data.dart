import 'package:flutter/material.dart';
import 'package:to_do_list/models/task_category.dart';

final categories = [
  TaskCategory(
    id: 'work_tasks',
    title: 'Work',
    icon: Icons.factory_outlined,
  ),
  TaskCategory(
    id: 'school_tasks',
    title: 'School',
    icon: Icons.school_outlined,
  ),
  TaskCategory(
    id: 'home_tasks',
    title: 'Home',
    icon: Icons.home_outlined,
  ),
];

final allCategories = [
  TaskCategory(
    id: 'all',
    title: 'All tasks',
    icon: Icons.apps,
  ),
  TaskCategory(
    id: 'work_tasks',
    title: 'Work',
    icon: Icons.factory_outlined,
  ),
  TaskCategory(
    id: 'school_tasks',
    title: 'School',
    icon: Icons.school_outlined,
  ),
  TaskCategory(
    id: 'home_tasks',
    title: 'Home',
    icon: Icons.home_outlined,
  ),
];
