package linksharing

import global.MyEnum


class Topic {


    String name
    Date dateCreated
    Date lastUpdated
    MyEnum.Visibility visibility

    static hasMany = [resource: Resource, subscription: Subscription]
    static constraints = {
    }

    static belongsTo = [user: User]
}
