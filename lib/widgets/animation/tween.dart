import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

abstract class MergeTweenable<T>{
  T get empty;
  
  Tween<T> tweenTo(T other);

  bool operator <(T other);
}


class MergeTween<T extends MergeTweenable<T>> extends  Tween<List<T>>{
  MergeTween(List<T> begin,List<T> end) : super(begin:begin,end:end) {
    
  }
}