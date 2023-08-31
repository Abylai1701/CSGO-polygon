import Foundation

enum API {
    //MARK: - URLs
    static let prodURL              = "http://161.35.145.58"
    
    //MARK: - Authorization
    static let register             = "v2/user/register"
    static let verification         = "v2/user/verification"
    static let auth                 = "v2/user/auth"
    static let editProfile          = "v2/user"
    
    //MARK: - Main Page
    static let eventCategories      = "v2/event_category"
    static let popularEvents        = "v2/event/popular"
    static let upcomingEvents       = "v2/event/upcoming"
    
    //MARK: - Event
    static func event
    (id: Int)-> String{             "v2/event/\(id)"}
    static func stepEvent
    (step: Int) -> String{          "v3/event/step/\(step)"}
    static let currentStep          = "v3/user/event/current_step"
    
    //MARK: - Ordering
    static func checkOrder
    (id: Int) -> String{            "v2/order/check/\(id)"}
    static let setTicketAmount    = "v2/order/set_tickets_amount"
    static let firstStep          = "v2/order/step/first"
    static func setUserData
    (id: Int) -> String{            "v2/order/\(id)/set_user_data"}
    static func setTeamData
    (id: Int) -> String{            "v2/order/\(id)/set_team_data"}
    
    //MARK: - Organization
    static let organizations        = "v2/organization"
    static func orgEvents
    (id: Int) -> String{               "v2/organization/\(id)/events"}
    static func orgCommission
    (orgId: Int) -> String{            "v2/organization/\(orgId)/commission"}
    static func organization
    (userId: Int) -> String{           "v2/organization/\(userId)"}
    static func orgActiveEvents
    (id: Int) -> String{               "v2/organization/\(id)/events/active"}
    static func orgArchivalEvents
    (id: Int) -> String{               "v2/organization/\(id)/events/archive"}
    //MARK: - Create Event
    static func createEvent
    (step: Int) -> String{             "v3/event/\(step)"}
    
    //MARK: - Filter
    static let filter               = "v2/filter/parameters"
    
    //MARK: - Image
    static func mainImage
    (eventId: Int) -> String {        "v3/event/\(eventId)/image"}
    static func removeAddImage
    (imageId: Int) -> String {         "v3/event/additional_image/\(imageId)" }
    static func uploadAddImage
    (eventId: Int) -> String {         "v3/event/\(eventId)/additional_image" }
    
    //MARK: - List
    static let languages            = "v2/language"
    static let cities               = "v2/city"
    
    //MARK: - Search
    static let eventSearch          = "v2/event"
    static let searchCats           = "v2/filter/search_category"
    static let searchAll            = "v2/event/search"

    //MARK: - Favorites
    static let favorites            = "v2/event_favorite"
    static func favorite
    (id: Int) -> String            {  "v2/event_favorite/\(id)" }
  
    //MARK: - Profile
    static let profile              = "v2/user_profile"
    
    //MARK: - Event Rules
    static func cancellationRules
    (eventId: Int) -> String {        "v3/event/\(eventId)/cancellation_rules" }
    static func rules
    (eventId: Int) -> String {        "v3/event/\(eventId)/rules" }
    
    //MARK: - My Tickets
    static let upcomingTickets      = "v2/ticket/upcoming"
    static let pastTickets          = "v2/ticket/past"
    static let rejectedTickets      = "v2/ticket/rejected"
    static let cancellationReasons  = "v2/ticket/cancellation_reasons"
    static func ticket
    (id: Int) -> String {             "v2/ticket/\(id)" }
    static func ticketReject
    (id: Int) -> String {             "v2/ticket/\(id)/reject" }
}
