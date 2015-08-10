package linksharing

import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    UserService userService
    ResourceService resourceService
    SubscriptionService subscriptionService
    TopicService topicService

    def index(Integer max) {
        User user = userService.getUserByID(params.id.toLong())

        List<Topic> topicList = topicService.getTopicByUser(user)
        [user:user, topicList: topicList]
    }

    def login()
    {
        if(session.user)
            redirect(action: "dashboard")
        List<Resource> topPosts = resourceService.getTopPosts()
        List<Resource> recentShares = resourceService.getRecentShares()




        [topPosts: topPosts, recentShares: recentShares]
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
            List<Resource> resourceList = resourceService.getResourcesByTopicList(topicList);

            [user: user, subscriptionCount:subscriptionCount, topicCount:topicCount, topicList:topicList, trendingTopics:trendingTopics, resourceList:resourceList]
        }
        catch (NullPointerException noe)
        {
            println noe.stackTrace
            redirect(action: "login")
        }

    }
    def authenticatelogin = {

        def user = User.findByUsernameAndPasswordAndActive(params.username, params.password, true)
        if(user)
        {   session.user = user
            redirect(action: "dashboard")
        }
        else
        {
            redirect(action: "login")
        }
    }

    def authenticatesignup = {

        def errorMessage = userService.authenticateSignUp(params,session)
        if(errorMessage.length()>0) {
        flash.error = errorMessage
        redirect(action: "login")
        }
        else{
            redirect(action: "dashboard")
        }

    }

    def logout = {
        session.user = null
        redirect(action: "login")

    }

    def profile = {
        User user = session.user;
        List<Topic> topicList = topicService.getTopicByUser(session.user)

        [user:user, topicList:topicList]
    }

    def subscriptionManager = {
        User user = session.user;
        Topic topic = topicService.getTopicById(params.topicid.toLong())
        String action = params.actionstatus
        subscriptionService.manageSubscrition(user,topic,action)
        redirect(action: "dashboard")
    }


    def deleteTopic = {
        topicService.deleteTopicById(params.topicid.toLong())
        redirect(action: "dashboard")
    }

    def users = {
        List <User> userList = userService.getUserList()
        [userList:userList]
    }
}
