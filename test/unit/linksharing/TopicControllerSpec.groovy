package linksharing

import grails.test.mixin.TestFor
import spock.lang.FailsWith
import spock.lang.Specification

import javax.validation.constraints.Null

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(TopicController)
class TopicControllerSpec extends Specification {

    def setup() {
    }

    @FailsWith(IndexOutOfBoundsException)
    def cleanup() {
    }

    void "test something"() {
    }
}
