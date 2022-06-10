import "dart:math";
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

List<List<Color>> list = [
  GradientColors.warmFlame,
  GradientColors.nightFade,
  GradientColors.springWarmt,
  GradientColors.rainyAshville,
  GradientColors.dustyGrass,
  GradientColors.rareWind,
  GradientColors.skyGlider,
  GradientColors.politeRumors,
  GradientColors.paloAlto,
  GradientColors.noontoDusk,
  GradientColors.marbleWall,
  GradientColors.cleanMirror,
  GradientColors.kindSteel,
  GradientColors.amyCrisp,
  GradientColors.nightFade
];

// generates a new Random object
final random = Random();

// generate a random index based on the list length
// and use it to retrieve the element
var element = list[random.nextInt(list.length)];
