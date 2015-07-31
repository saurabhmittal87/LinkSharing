package linksharing

class TopicController {

    def index() {
        redirect(action:"topic")
    }

    def topic(){
        render params.id
    }
}
