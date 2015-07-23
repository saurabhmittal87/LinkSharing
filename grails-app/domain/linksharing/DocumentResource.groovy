package linksharing

class DocumentResource extends Resource{

    String filePath

    static constraints = {
    }

    boolean equals(other) {
        if (!(other instanceof DocumentResource)) {
            return false
        }

        other.filePath == this.filePath
    }
}
