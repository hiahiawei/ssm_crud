package fan.service;

import fan.bean.Employee;
import fan.bean.EmployeeExample;
import fan.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    /**
     * 查询所有员工（分页查询）
     * @return
     */
    public List<Employee> getAll(){

        return employeeMapper.selectByExampleWithDept(null);
    }

    public void saveEmp(Employee employee){
        employeeMapper.insertSelective(employee);
    }

    /**
     * 检验用户名是否可用
     * @return  ture:代表当前姓名可用  false：不可用
     */
    public boolean checkUser(String empName){
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria=example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        int count=employeeMapper.countByExample(example);
        return count==0;
    }

    /**
     * 按照员工id查询员工
     */
    public Employee getEmp(Integer id){
        Employee employee=employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    /**
     * 员工更新
     */

    public void updateEmp(Employee employee){
        employeeMapper.updateByPrimaryKeySelective(employee);
    }

    /**
     * 员工删除
     * @param id
     */
    public void deleteEmp(Integer id){
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids){
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria=example.createCriteria();
        //delete from xxx where emp_id in(1,2,3)按照条件删除
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);
    }
}
