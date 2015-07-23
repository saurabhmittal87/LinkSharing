package linksharing

class ReadingItem {

    Resource resource
    User user
    Boolean read

    static mapping = {
        table "ReadingItem"
        id composite:["resource", "user"]
    }
    static constraints = {
    }
}
