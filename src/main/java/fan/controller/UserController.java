package fan.controller;


import fan.bean.Msg;
import fan.bean.User;
import fan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/topage/{jspPage}",method=RequestMethod.GET)
    public String toPage(@PathVariable("jspPage") String jspPage){
        System.out.println(jspPage);
        return jspPage;
    }

    @RequestMapping(value="/user",method= RequestMethod.POST)
    @ResponseBody
    public Msg login(User user){
        System.out.println(user);
        if(userService.login(user)){
            return Msg.fail();
        }else{
            return Msg.success();
        }
    }



}
