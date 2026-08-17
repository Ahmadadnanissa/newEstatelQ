class CacheKey {
  CacheKey._();
  
  static const String _tourPrefix = 'vt_tour_';
  static const String _roomsPrefix = 'vt_rooms_';
  static const String _hotspotsPrefix = 'vt_hotspots_';
  static const String _timestampPrefix = 'vt_ts_';
  
  static String tour(String tourId) => '$_tourPrefix$tourId';
  static String rooms(String tourId) => '$_roomsPrefix$tourId';
  static String hotspots(String roomId) => '$_hotspotsPrefix$roomId';
  static String timestamp(String key) => '$_timestampPrefix$key';
  
  static String tourTimestamp(String tourId) => timestamp(tour(tourId));
  static String roomsTimestamp(String tourId) => timestamp(rooms(tourId));
  static String hotspotsTimestamp(String roomId) => timestamp(hotspots(roomId));
}
