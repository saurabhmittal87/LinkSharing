package linksharing

import global.MyEnum

class Topic {
    String name
    Date dateCreated
    Date lastUpdated
    MyEnum.Visibility visibility
    Integer subscriptionCount = 0
    Integer resourceCount = 0
    Boolean isSubscribed;

    static transients = ['subscriptionCount','resourceCount','isSubscribed']

    static hasMany = [resource: Resource, subscription: Subscription]

    static mapping = {
        resource cascade: 'all-delete-orphan'
        subscription cascade: 'all-delete-orphan'
    }
    static belongsTo = [user: User]
    
    def afterInsert = {
        Subscription subscription = new Subscription()
        subscription.seriousness = MyEnum.Seriousness.Casual
        subscription.topic = this
        subscription.user = this.user

        if(subscription.validate())
            addToSubscription(subscription)
        else
            println subscription.errors
    }
}
