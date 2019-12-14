package fan.controller;


import fan.bean.Msg;
import fan.bean.User;
import fan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/login",method=RequestMethod.GET)
    public String toLogin(){
        return "login";
    }

    @RequestMapping(value = "/toEmp",method=RequestMethod.GET)
    public String toEmp(){
        return "employee";
    }

    @RequestMapping(value="/userSelect",method= RequestMethod.POST)
    @ResponseBody
    public Msg login(User user){
        System.out.println(user);
        if(userService.select(user)){
            return Msg.fail();
        }else{
            return Msg.success();
        }
    }

    @RequestMapping(value="/userInsert",method= RequestMethod.POST)
    @ResponseBody
    public Msg register(User user){
        System.out.println(user);
        if(userService.register(user)){
            return Msg.fail();
        }else{
            return Msg.success();
        }
    }


}
