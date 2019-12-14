package fan.controller;

import fan.bean.Department;
import fan.bean.Msg;
import fan.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.List;

/**
 * 处理和部门有关的请求
 */

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        //查出所有的部门信息
        List<Department> list=departmentService.getDepts();
        return Msg.success().add("depts",list);
    }
}
