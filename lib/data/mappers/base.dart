abstract class Mapper<A, B> {
  const Mapper();

  B fromEntity(A entity);

  A toEntity(B item);
}

class BaseListMapper<A, B> implements Mapper<List<A>, List<B>> {
  final Mapper<A, B> mapper;

  const BaseListMapper(this.mapper);

  @override
  List<B> fromEntity(List<A> entityList) {
    List<B> list = [];

    if (entityList.isEmpty) {
      return list;
    }

    for (A entity in entityList) {
      list.add(mapper.fromEntity(entity));
    }
    return list;
  }

  @override
  List<A> toEntity(List<B> itemList) {
    List<A> list = [];

    if (itemList.isEmpty) {
      return list;
    }

    for (B item in itemList) {
      list.add(mapper.toEntity(item));
    }
    return list;
  }
}
