package linksharing


class ReadingStatus implements Serializable{

    static belongsTo = [user: User, resource: Resource]

    static mapping = {
        id composite:['resource', 'user']
    }
    static constraints = {
    }

}
