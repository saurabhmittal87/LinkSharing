package linksharing

import global.MyEnum

class Topic {
    String name
    Date dateCreated
    Date lastUpdated
    MyEnum.Visibility visibility
    transient Integer subscriptionCount = 0
    transient Integer resourceCount = 0
    transient Boolean isSubscribed;

//    static transients = ['subscriptionCount','resourceCount','isSubscribed']

    static hasMany = [resource: Resource, subscription: Subscription]
    static constraints = {
        subscriptionCount(nullable: true, blank: true)
        resourceCount(nullable: true, blank: true)
        isSubscribed(nullable: true, blank: true)
    }

    static mapping = {
        resource cascade: 'all-delete-orphan'
        subscription cascade: 'all-delete-orphan'
    }
    static belongsTo = [user: User]
}
