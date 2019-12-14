package fan.test;

import fan.bean.Employee;
import fan.dao.DepartmentMapper;
import fan.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * 测试dao层的工作
 * 推荐Spring的项目就可以使用spring的单元测试，可以自动注入我们需要的组件
 * 1、导入SpringTest模块
 * 2、@ContextConfiguration指定Spring配置文件的位置
 * 3、直接@Autowire
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    /**
     * 测试department的Mapper
     */
    @Test
    public void testCRUD(){

//        ApplicationContext ioc=new ClassPathXmlApplicationContext("applicationContext.xml");
//        DepartmentMapper bean=ioc.getBean(DepartmentMapper.class);

        System.out.println(departmentMapper);

//        //插入几个部门
//        departmentMapper.insertSelective(new Department(null,"咸鱼部"));
//        departmentMapper.insertSelective(new Department(null,"钓鱼部"));

//        //生成员工数据，测试员工插入
//        employeeMapper.insertSelective(new Employee(null,"nick","M","nick@guigu.com",1));

        //批量插入多个员工；批量，使用可以执行批量操作的sqlSession
        //
        /*for(){
            employeeMapper.insertSelective(new Employee(null,"nick","M","nick@guigu.com",1));
        }*/

        EmployeeMapper mapper=sqlSession.getMapper(EmployeeMapper.class);
        for(int i=0;i<50;i++){
            String uid=UUID.randomUUID().toString().substring(0,5)+i;
            mapper.insertSelective(new Employee(null,uid,"M",uid+"@shuwei.com",1,null));
        }
        System.out.println("批量完成");


    }

}
