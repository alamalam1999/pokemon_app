import 'dart:convert';

class PokemonDetail {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final bool isDefault;
  final int order;
  final int weight;
  final List<Ability> abilities;
  final List<Species> forms;
  final List<GameIndex> gameIndices;
  final List<HeldItem> heldItems;
  final String locationAreaEncounters;
  final List<Move> moves;
  final Species species;
  final Sprites sprites;
  final List<Stat> stats;
  final List<Type> types;
  final Map<String, String> cries;

  PokemonDetail({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.abilities,
    required this.forms,
    required this.gameIndices,
    required this.heldItems,
    required this.locationAreaEncounters,
    required this.moves,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.cries,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    return PokemonDetail(
      id: json['id'],
      name: json['name'],
      baseExperience: json['base_experience'],
      height: json['height'],
      isDefault: json['is_default'],
      order: json['order'],
      weight: json['weight'],
      abilities: List<Ability>.from(
        json['abilities'].map((x) => Ability.fromJson(x)),
      ),
      forms: List<Species>.from(json['forms'].map((x) => Species.fromJson(x))),
      gameIndices: List<GameIndex>.from(
        json['game_indices'].map((x) => GameIndex.fromJson(x)),
      ),
      heldItems: List<HeldItem>.from(
        json['held_items'].map((x) => HeldItem.fromJson(x)),
      ),
      locationAreaEncounters: json['location_area_encounters'],
      moves: List<Move>.from(json['moves'].map((x) => Move.fromJson(x))),
      species: Species.fromJson(json['species']),
      sprites: Sprites.fromJson(json['sprites']),
      stats: List<Stat>.from(json['stats'].map((x) => Stat.fromJson(x))),
      types: List<Type>.from(json['types'].map((x) => Type.fromJson(x))),
      cries: Map<String, String>.from(json['cries']),
    );
  }
}

class Ability {
  final bool isHidden;
  final int slot;
  final Species ability;

  Ability({required this.isHidden, required this.slot, required this.ability});

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      isHidden: json['is_hidden'],
      slot: json['slot'],
      ability: Species.fromJson(json['ability']),
    );
  }
}

class Species {
  final String name;
  final String url;

  Species({required this.name, required this.url});

  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(name: json['name'], url: json['url']);
  }
}

class GameIndex {
  final int gameIndex;
  final Species version;

  GameIndex({required this.gameIndex, required this.version});

  factory GameIndex.fromJson(Map<String, dynamic> json) {
    return GameIndex(
      gameIndex: json['game_index'],
      version: Species.fromJson(json['version']),
    );
  }
}

class HeldItem {
  final Species item;
  final List<VersionDetail> versionDetails;

  HeldItem({required this.item, required this.versionDetails});

  factory HeldItem.fromJson(Map<String, dynamic> json) {
    return HeldItem(
      item: Species.fromJson(json['item']),
      versionDetails: List<VersionDetail>.from(
        json['version_details'].map((x) => VersionDetail.fromJson(x)),
      ),
    );
  }
}

class VersionDetail {
  final int rarity;
  final Species version;

  VersionDetail({required this.rarity, required this.version});

  factory VersionDetail.fromJson(Map<String, dynamic> json) {
    return VersionDetail(
      rarity: json['rarity'],
      version: Species.fromJson(json['version']),
    );
  }
}

class Move {
  final Species move;
  final List<VersionGroupDetail> versionGroupDetails;

  Move({required this.move, required this.versionGroupDetails});

  factory Move.fromJson(Map<String, dynamic> json) {
    return Move(
      move: Species.fromJson(json['move']),
      versionGroupDetails: List<VersionGroupDetail>.from(
        json['version_group_details'].map(
          (x) => VersionGroupDetail.fromJson(x),
        ),
      ),
    );
  }
}

class VersionGroupDetail {
  final int levelLearnedAt;
  final Species versionGroup;
  final Species moveLearnMethod;

  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.versionGroup,
    required this.moveLearnMethod,
  });

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) {
    return VersionGroupDetail(
      levelLearnedAt: json['level_learned_at'],
      versionGroup: Species.fromJson(json['version_group']),
      moveLearnMethod: Species.fromJson(json['move_learn_method']),
    );
  }
}

class Sprites {
  final String frontDefault;
  final String frontShiny;
  final String frontFemale;
  final String frontShinyFemale;
  final String backDefault;
  final String backShiny;
  final String backFemale;
  final String backShinyFemale;
  final Other other;

  Sprites({
    required this.frontDefault,
    required this.frontShiny,
    required this.frontFemale,
    required this.frontShinyFemale,
    required this.backDefault,
    required this.backShiny,
    required this.backFemale,
    required this.backShinyFemale,
    required this.other,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      frontDefault: json['front_default'] ?? '',
      frontShiny: json['front_shiny'] ?? '',
      frontFemale: json['front_female'] ?? '',
      frontShinyFemale: json['front_shiny_female'] ?? '',
      backDefault: json['back_default'] ?? '',
      backShiny: json['back_shiny'] ?? '',
      backFemale: json['back_female'] ?? '',
      backShinyFemale: json['back_shiny_female'] ?? '',
      other: Other.fromJson(json['other']),
    );
  }
}

class Other {
  final OfficialArtwork officialArtwork;
  final Showdown showdown;

  Other({required this.officialArtwork, required this.showdown});

  factory Other.fromJson(Map<String, dynamic> json) {
    return Other(
      showdown: Showdown.fromJson(json['showdown']),
      officialArtwork: OfficialArtwork.fromJson(json['official-artwork']),
    );
  }
}

class Showdown {
  final String frontDefault;

  Showdown({required this.frontDefault});

  factory Showdown.fromJson(Map<String, dynamic> json) {
    return Showdown(frontDefault: json['front_default']);
  }
}

class OfficialArtwork {
  final String frontDefault;

  OfficialArtwork({required this.frontDefault});

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) {
    return OfficialArtwork(frontDefault: json['front_default']);
  }
}

class Stat {
  final int baseStat;
  final int effort;
  final Species stat;

  Stat({required this.baseStat, required this.effort, required this.stat});

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      baseStat: json['base_stat'],
      effort: json['effort'],
      stat: Species.fromJson(json['stat']),
    );
  }
}

class Type {
  final int slot;
  final Species type;

  Type({required this.slot, required this.type});

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(slot: json['slot'], type: Species.fromJson(json['type']));
  }
}
