import 'package:artikool_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ArtikoolEndpoint extends Endpoint {
  //fetch articel from db
  Future<List<Articel>> getArticles(Session session, {String? keyword}) async {
    return await Articel.find(
      session,
      where: (t) =>
          keyword != null ? t.title.like("%$keyword%") : Constant(true),
    );
  }

  //add articel in db
  Future<bool> addArticel(Session session, Articel articel) async {
    await Articel.insert(session, articel);
    return true;
  }

  //update articel in db
  Future<bool> updateArticel(Session session, Articel articel) async {
    var result = await Articel.update(session, articel);
    return result;
  }

  //delete articel in db
  Future<bool> deleteArticel(Session session, int id) async {
    var result = await Articel.delete(session, where: (t) => t.id.equals(id));
    return result == 1;
  }

  
}
