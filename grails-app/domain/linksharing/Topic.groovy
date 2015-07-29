package linksharing

import global.MyEnum

class Topic {
    String name
    Date dateCreated
    Date lastUpdated
    MyEnum.Visibility visibility
    transient Integer subscriptionCount = 0
    transient Integer resourceCount = 0

    static hasMany = [resource: Resource, subscription: Subscription]
    static constraints = {
        subscriptionCount(nullable: true, blank: true)
        resourceCount(nullable: true, blank: true)
    }

    static belongsTo = [user: User]
}
