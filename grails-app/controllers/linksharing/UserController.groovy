package linksharing


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    UserService userService
    ResourceService resourceService
    SubscriptionService subscriptionService
    TopicService topicService

    def index(Integer max) {
        redirect(action: "login")
    }

    def login()
    {
        List<Resource> topPosts = resourceService.getTopPosts()
        List<Resource> recentShares = resourceService.getRecentShares()
        [topPosts: topPosts, recentShares: recentShares]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    def dashboard() {
        try {
            User user = session.user
            if(user == null)
                redirect(action: "login")
            Integer subscriptionCount = userService.getSubscriptionCountByUser(user)
            Integer topicCount = userService.getTopicCountByUser(user)
            List<Topic> topicList = userService.getTopicsSubscribedByUser(user);
            List<Topic> trendingTopics = topicService.getTrendingTopics()
            List<Resource> resourceList = resourceService.getResourcesByTopicList(Topic.list());

            [user: user, subscriptionCount:subscriptionCount, topicCount:topicCount, subscriptionList:topicList, trendingTopics:trendingTopics]
        }
        catch (NullPointerException noe)
        {
            redirect(action: "login")
        }

    }
    def authenticatelogin = {

        def user = User.findByUsernameAndPassword(params.username, params.password)
        if(user)
        {   session.user = user
            flash.message = "Hello ${user.firstName}"
            redirect(action: "dashboard")
        }
        else
        {   flash.message = "Sorry ${params.username}. Please Try Again"
            redirect(action: "login")
        }
    }

    def authenticatesignup = {

        def errorMessage = userService.authenticateSignUp(params)
        if(errorMessage.length()>0) {
        flash.error = errorMessage
        redirect(action: "login")
        }
        else{
            redirect(action: "dashboard")
        }

    }

    def logout = {
        flash.message = "GoodBye ${session.user.fullName}"
        session.user = null
        redirect(action: "login")

    }
    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'create'
            return
        }

        userInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: userInstance.username, default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view: 'edit'
            return
        }

        userInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: userInstance.username, default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: userInstance.username, default: 'User'), userInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: userInstance.username, default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
