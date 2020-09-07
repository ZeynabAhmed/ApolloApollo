// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct PaginateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - page
  ///   - limit
  public init(page: Swift.Optional<Int?> = nil, limit: Swift.Optional<Int?> = nil) {
    graphQLMap = ["page": page, "limit": limit]
  }

  public var page: Swift.Optional<Int?> {
    get {
      return graphQLMap["page"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "page")
    }
  }

  public var limit: Swift.Optional<Int?> {
    get {
      return graphQLMap["limit"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "limit")
    }
  }
}

public final class HomeGetAllQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query HomeGetALL($paginate: PaginateInput) {
      featuredStores(paginate: $paginate) {
        __typename
        items {
          __typename
          ...fragStoreAllDetails
        }
        pageInfo {
          __typename
          ...fragPageInfo
        }
      }
    }
    """

  public let operationName: String = "HomeGetALL"

  public var queryDocument: String { return operationDefinition.appending(FragStoreAllDetails.fragmentDefinition).appending(FragPageInfo.fragmentDefinition) }

  public var paginate: PaginateInput?

  public init(paginate: PaginateInput? = nil) {
    self.paginate = paginate
  }

  public var variables: GraphQLMap? {
    return ["paginate": paginate]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("featuredStores", arguments: ["paginate": GraphQLVariable("paginate")], type: .object(FeaturedStore.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(featuredStores: FeaturedStore? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "featuredStores": featuredStores.flatMap { (value: FeaturedStore) -> ResultMap in value.resultMap }])
    }

    /// Based on: country -> city -> interests -> promotions -> visits
    public var featuredStores: FeaturedStore? {
      get {
        return (resultMap["featuredStores"] as? ResultMap).flatMap { FeaturedStore(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "featuredStores")
      }
    }

    public struct FeaturedStore: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["StorePaginator"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("pageInfo", type: .object(PageInfo.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(items: [Item?]? = nil, pageInfo: PageInfo? = nil) {
        self.init(unsafeResultMap: ["__typename": "StorePaginator", "items": items.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.flatMap { (value: PageInfo) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (resultMap["items"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Item?] in value.map { (value: ResultMap?) -> Item? in value.flatMap { (value: ResultMap) -> Item in Item(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }, forKey: "items")
        }
      }

      public var pageInfo: PageInfo? {
        get {
          return (resultMap["pageInfo"] as? ResultMap).flatMap { PageInfo(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "pageInfo")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Store"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragStoreAllDetails.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String? = nil, name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Store", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragStoreAllDetails: FragStoreAllDetails {
            get {
              return FragStoreAllDetails(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragPageInfo.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(page: Int? = nil, totalCount: Int? = nil, totalPages: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "page": page, "totalCount": totalCount, "totalPages": totalPages])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragPageInfo: FragPageInfo {
            get {
              return FragPageInfo(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public struct FragStoreAllDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment fragStoreAllDetails on Store {
      __typename
      id
      name
    }
    """

  public static let possibleTypes: [String] = ["Store"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .scalar(String.self)),
    GraphQLField("name", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: String? = nil, name: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Store", "id": id, "name": name])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String? {
    get {
      return resultMap["id"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return resultMap["name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }
}

public struct FragPageInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment fragPageInfo on PageInfo {
      __typename
      page
      totalCount
      totalPages
    }
    """

  public static let possibleTypes: [String] = ["PageInfo"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("page", type: .scalar(Int.self)),
    GraphQLField("totalCount", type: .scalar(Int.self)),
    GraphQLField("totalPages", type: .scalar(Int.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(page: Int? = nil, totalCount: Int? = nil, totalPages: Int? = nil) {
    self.init(unsafeResultMap: ["__typename": "PageInfo", "page": page, "totalCount": totalCount, "totalPages": totalPages])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var page: Int? {
    get {
      return resultMap["page"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "page")
    }
  }

  public var totalCount: Int? {
    get {
      return resultMap["totalCount"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "totalCount")
    }
  }

  public var totalPages: Int? {
    get {
      return resultMap["totalPages"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "totalPages")
    }
  }
}
