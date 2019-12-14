package fan.bean;

import javax.validation.constraints.Pattern;

public class Employee {
    private Integer empId;

    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",
            message = "用户名可以是2-5位中文或者6-16位英文和数字或者下划线的组合!!!（JSR303）")
    private String empName;

    private String empGender;

    @Pattern(regexp = "(^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$)",
            message = "邮箱格式不正确!!!（JSR303）")
    private String email;

    private Integer deptId;

    //希望查询员工的同时部门信息也是查询好的
    private Department department;

    public Employee() {
    }

    public Employee(Integer empId, @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",
            message = "用户名可以是2-5位中文或者6-16位英文和数字或者下划线的组合!!!（JSR303）") String empName, String empGender, @Pattern(regexp = "(^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$)",
            message = "邮箱格式不正确!!!（JSR303）") String email, Integer deptId, Department department) {
        this.empId = empId;
        this.empName = empName;
        this.empGender = empGender;
        this.email = email;
        this.deptId = deptId;
        this.department = department;
    }

    //这个别忘了，不然启动后直接500错误
    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getEmpGender() {
        return empGender;
    }

    public void setEmpGender(String empGender) {
        this.empGender = empGender == null ? null : empGender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", empGender='" + empGender + '\'' +
                ", email='" + email + '\'' +
                ", deptId=" + deptId +
                ", department=" + department +
                '}';
    }
}