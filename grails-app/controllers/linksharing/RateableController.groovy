package linksharing

class RateableController {

    def rate() {
        println "1. " + params.id
        println "2. 0" + params.rating
    }
}
