
import 'package:avtomobile/features/home/data/model/beer_model.dart';
import 'package:hive/hive.dart';

class BeerModelAdapter extends TypeAdapter<BeerModel> {
  @override
  final typeId = 0;

  @override
  void write(BinaryWriter writer, BeerModel obj) {
    writer.writeString(obj.price);
    writer.writeString(obj.model);
    writer.writeString(obj.strength);
    writer.writeString(obj.volume);
  }

  @override
  BeerModel read(BinaryReader reader) {
    return BeerModel(
      price: reader.readString(),
      model: reader.readString(),
      strength: reader.readString(),
      volume: reader.readString(),
    );
  }
}
