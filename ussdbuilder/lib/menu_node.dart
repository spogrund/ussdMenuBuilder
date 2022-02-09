// ignore_for_file: prefer_initializing_formals, non_constant_identifier_names, prefer_const_declarations, unnecessary_this

final String tableNodes = 'nodes';

class MenuNodeFields{
  static final List<String> values = [
    menuID, parentID, USSDText
  ];

  static final String menuID = '_menuID';
  static final String parentID = 'parentID' ;
  static final String USSDText = 'USSDText';
}

class MenuNode{

  final int? menuID;
  final String parentID;
  final String USSDText;
  


  const MenuNode({
    this.menuID,
    required this.parentID,
    required this.USSDText,
    

  });

  MenuNode copy({
    int? menuID,
    String? parentID,
    String? USSDText,

  }) => MenuNode(
    menuID: menuID ?? this.menuID,
    parentID: parentID ?? this.parentID,
    USSDText: USSDText ?? this.USSDText
    );

  

  Map<String, Object?> toJson() => {
    MenuNodeFields.menuID: menuID,
    MenuNodeFields.parentID: parentID,
    MenuNodeFields.USSDText: USSDText,


  };

  static MenuNode fromJson(Map<String, Object?> json) => MenuNode(
    menuID: json[MenuNodeFields.menuID] as int?,
    parentID: json[MenuNodeFields.parentID] as String,
    USSDText : json[MenuNodeFields.USSDText] as String

  );
}

