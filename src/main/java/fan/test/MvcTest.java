package fan.test;

import com.github.pagehelper.PageInfo;
import fan.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * 使用Spring测试模块提供的测试请求功能，测试crud请求的正确性
 * Spring4测试的时候，需要servlet3.0的支持
 */

@RunWith(SpringJUnit4ClassRunner.class)
/*使用这个annotation会在跑单元测试的时候真实的启一个web服务，
然后开始调用Controller的Rest API，待单元测试跑完之后再将web服务停掉;*/
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springmvc.xml"})
public class MvcTest {
    //传入Springmvc的ioc
    @Autowired
    WebApplicationContext context;
    //虚拟mvc请求，获取到处理结果。
    /*使用Mock O bject进行测试，主要是用来模拟那些在应用中不容易构造
    （如HttpServletRequest必须在Servlet容器中才能构造出来）
    或者比较复杂的对象（如JDBC中的ResultSet对象）从而使测试顺利进行的工具。*/
    MockMvc mockMvc;

    @Before
    public void initMokcMvc(){
        mockMvc=MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        //模拟请求，拿到返回值
        MvcResult result=mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn","4")).andReturn();

        //请求成功以后，请求域中会有pageInfo：我们可以取出它进行验证
        MockHttpServletRequest request=result.getRequest();
        PageInfo pi=(PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码"+pi.getPageNum());
        System.out.println("总页码"+pi.getPages());
        System.out.println("总记录数"+pi.getTotal());
        System.out.println("在页面需要连续显示的页码");
        int [] nums=pi.getNavigatepageNums();
        for(int i:nums){
            System.out.print(" "+i);
        }
        System.out.println();

        //获取员工数据
        List<Employee> list=pi.getList();
        for(Employee employee:list){
            System.out.println("ID:"+employee.getEmpId()+"==>Name:"+employee.getEmpName());
        }

    }

}
