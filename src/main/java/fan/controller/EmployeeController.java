package fan.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import fan.bean.Employee;
import fan.bean.Msg;
import fan.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理员工CRUD请求
 */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;
    /**
     * 查询员工数据（分页查询）
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
    //PathVariable从路径中取出参数
    public Msg deleteEmp(@PathVariable("ids")String ids) {
        if(ids.contains("-")) {//批量删除
            String []str_ids=ids.split("-");
            List<Integer> del_ids=new ArrayList<Integer>();
            //组装ids集合
            for(String s:str_ids) {
                del_ids.add(Integer.parseInt(s));
            }
            employeeService.deleteBatch(del_ids);//批量删除
            return Msg.success();
        }else {     			//单个删除
            Integer id=Integer.parseInt(ids);
            employeeService.deleteEmp(id);
            return Msg.success();
        }

    }

    /**
     *如果直接发送ajax=PUT形式的请求
     *封装的数据
     * Employee
     * 将要更新的员工数据：Employee{empId=3, empName='null', empGender='null', email='null', deptId=null, department=null}
     *
     *  问题：请求体中有数据（f12 form data），但是employee对象封装不上
     *会报SQL语句的语法错误
     *
     * 原因：
     *  Tomcat：
     *      1、将请求体中的数据，封装一个map
     *      2、request.getParameter("empName")就会从这个map中取值
     *      3、SpringMVC封装POJO对象的时候
     *              会把POJO中每个属性的值调用request.getParameter("email");拿到
     *AJAX发送PUT请求引发的血案：
     *      PUT请求，请求体中的数据，request.getParameter("email");拿不到
     *      Tomcat一看是PUT不会封装请求体中的数据为map，只有POST形式的请求才封装请求体为map
     *      tomcat源码（略）
     *
     * 解决方案;
     * 我们要能支持直接发送PUT之类的请求还要封装请求体中的数据
     * 配置上HttpPutFormContentFilter;
     * 他的作用：将请求体中的数据解析成一个map
     *request被重新包装，request.getParameter()被重写，就会从自己封装的map中取数据
     */
    @RequestMapping(value="/emp_update/{empId}",method=RequestMethod.PUT)
    @ResponseBody
    public Msg saveEmp(Employee employee) {
        //在bean中加tostring方法就能直接输出employee信息了，不然就是输出employee的地址
        System.out.println("将要更新的员工数据："+employee);
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    /**
     * 根据id查询员工
     * @return
     */
    @RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id")Integer id) {
        Employee employee =employeeService.getEmp(id);
        return Msg.success().add("emp", employee);
    }

    /**
     * 检查用户名是否可用
     * @param empName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkuser")
    public Msg checkUser(@RequestParam("empName")String empName) {
        //先判断用户名是否是合法的表达式
        String regempName="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        //string中的方法：matches
        if(!empName.matches(regempName)) {
            return Msg.fail().add("va_msg", "用户名可以是2-5位中文或者6-16位英文和数字或者下划线的组合（后端）");
        }

        //数据库用户名重复验证，在正则校验之后进行
        boolean b=employeeService.checkUser(empName);
        if(b) {
            return Msg.success();  //100
        }else {
            return Msg.fail().add("va_msg", "用户名不可用（后端）");
        }

    }

    /**
     * 员工保存
     * @param employee
     * @param result
     * @return
     * 1、支持JSR303校验
     * 2、导入Hibernate-Validator
     */
    @RequestMapping(value="/emp",method=RequestMethod.POST)     //规定POST请求为保存
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result) {   //@Valid :校验
        if(result.hasErrors()) {
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            List <FieldError> errors=result.getFieldErrors();
            Map<String ,Object> map=new HashMap();
            for(FieldError fieldError:errors) {
                System.out.println("错误的字段名:"+fieldError.getField());
                System.out.println("错误的信息:"+fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);	//校验失败
        }else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }

    @RequestMapping("/emps")
    @ResponseBody       //@ResponseBody作用自动将返回的对象转为json字符串   需要导入jackson包
    public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
        PageHelper.startPage(pn, 5);//pn:页码  pageSize:一页的尺寸
        List<Employee> emps= employeeService.getAll();
        //使用pageInfo包装查询后的结果，只需将pageInfo交给页面就行了。
        //里面封装了详细的分页信息，包括有我们查询出来的数据
        PageInfo page=new PageInfo(emps,5);  //连续显示的页数
        return Msg.success().add("pageInfo", page);

    }

    //@RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue="1")Integer pn,Model model){
        //这不是一个分页查询
        //引入PageHelper分页插件
        //在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,5);
        //startPage后面紧跟的这个查询就是应该分页查询
        List<Employee> emps =employeeService.getAll();
        //使用pageInfo查询包装后的结果,只需将pageInfo交给页面就行了
        //封装了详细的分页信息，包括有我们查询出来的数据,传入连续显示的页数
        PageInfo page=new PageInfo(emps,5);

        model.addAttribute("pageInfo",page);

        return "list";
    }


}
