import UIKit

// MARK: Singletons
/**
 The singleton pattern is a way to make sure  that a class has only one instance and it provides a single point of access to it.
 The pattern specifies that the class should be responsible itself for keeping track of its sole instance and it can further ensure that no
 other instance can be created by intercepting requests for creating new objects and provide a way to access the sole instance
 **/

// MARK: - API Module
class ApiClient {
    static let instance = ApiClient()
    private init() {}
    
    func execute(_ : URLRequest, compeltion: (Data) -> Void) { }
}

// MARK: - Main Module
extension ApiClient {
    func login(completion: (LoggedInUser) -> Void) { }
}

extension ApiClient {
    func loadFeed(completion: ([FeedItem]) -> Void) { }
}

let client = ApiClient.instance

class MockApiClient: ApiClient {}

// MARK: - Login Module
struct LoggedInUser {}

class LoginViewController: UIViewController {
    var login: (((LoggedInUser) -> Void) -> Void)?
    func didTapLoginButton() {
        login? { user in
            // Show next screen
            
            
        }
    }
}

// MARK: Feed Module
struct FeedItem {}

typealias FeedLoader = (([String]) -> Void) -> Void

class FeedViewController: UIViewController {
    var loadFeed: FeedLoader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFeed? { loadedItems in
            // Update UI
            
        }
    }
}

protocol FeedLoaderProtocol {
    func loadFeed(completion: @escaping ([String]) -> Void)
}

class FeedViewControllerRefactor: UIViewController {
    var loader: FeedLoaderProtocol!
    
    convenience init(loader: FeedLoaderProtocol) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.loadFeed { loadedItems in
            // updateUI
        }
    }
}

class RemoteFeedLoader {
    var loadFeed: FeedLoader!
    
}

class LocalFeedLoader {
    var loadFeed: FeedLoader!
    
}


