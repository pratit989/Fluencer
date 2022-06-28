import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int indexProvider(
  DocumentReference postReferenc,
  List<PostsRecord> postRecordsList,
) {
  // index of postReference in PostRecordsList
  int index;
  for (int i = 0; i < postRecordsList.length; i++) {
    if (postRecordsList[i].reference == postReferenc) {
      index = i;
    }
  }
  return index;
}
