import 'package:hive/hive.dart';
import 'package:rafeeq_app/models/Library/library_model.dart';

class LibraryLocalService {
  static const String _boxName = 'library_box';

  Future<Box<LibraryItemModel>> _getBox() async {
    if (Hive.isBoxOpen(_boxName)) {
      return Hive.box<LibraryItemModel>(_boxName);
    }
    return await Hive.openBox<LibraryItemModel>(_boxName);
  }

  Future<void> saveLibraryList(List<LibraryItemModel> items) async {
    final box = await _getBox();
    await box.clear(); 
    await box.addAll(items);
  }

  Future<List<LibraryItemModel>>? getCachedLibraryList() async {
    final box = await _getBox();
    return box.values.toList();
  }

  Future<void> clearLibraryCache() async {
    final box = await _getBox();
    await box.clear();
  }

  Future<void> addSingleItem(LibraryItemModel item) async {
    final box = await _getBox();
    await box.put(item.entryId, item); 
  }

  Future<void> deleteSingleItem(String entryId) async {
    final box = await _getBox();
    await box.delete(entryId);
  }

  Future<bool> hasCachedData() async {
    final box = await _getBox();
    return box.isNotEmpty;
  }
}