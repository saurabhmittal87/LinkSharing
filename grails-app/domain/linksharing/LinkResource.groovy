package linksharing

class LinkResource extends Resource {

    String url
    static constraints = {
    }

    boolean equals(other) {
        if (!(other instanceof LinkResource)) {
            return false
        }
        other.url == this.url
    }
}
