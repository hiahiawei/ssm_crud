<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% pageContext.setAttribute("path", request.getContextPath()); %>

<html>
<head>
    <!--引入jquery path=/ssm_crud-->
    <script type="text/javascript" src="${path}/static/js/jquery-3.4.1.min.js"></script>

    <!--引入bootstrap样式-->
    <link href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <title>员工列表</title>
</head>
<body>

<!-- 显示页面 -->
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>FSW-SSM-CRUD</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-9">
            <button type="button" class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button type="button" class="btn btn-danger" id="emp_del_all_modal_btn">删除</button>
        </div>
    </div>
    <!-- 显示数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id ="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#Id</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>departmentName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 分页信息 -->
    <div class="row">
        <!-- 分页文字信息 -->
        <div class="col-md-6" id="page_info_area"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
</div>

<!-- Modal  员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span class="help-block" ></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@123.com">
                            <span class="help-block" ></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="gender_add_input" value="M" checked="checked">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="gender_add_input02" value="F">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="deptId" id="dept_add_select"></select>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal  员工修改的模态框 （弹出框）-->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <%--表单中的静态控件--%>
                            <p class="form-control-static" id="empName_update_static"></p>
                            <span class="help-block" ></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@123.com">
                            <span class="help-block" ></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="gender_update_input" value="M" checked="checked">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="empGender" id="gender_update_input02" value="F">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_update_input" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="deptId" id="dept_update_select"></select>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>


<%--=====================以下为javascript 脚本==================================--%>

<script type="text/javascript">
    var totalRecord,currentPage;

    //body中页面加载完成后，直接发送一个ajax请求，请求首页数据
    $(document).ready((function(){
        to_page(1);//首页
    }));

    //页面跳转到指定页，加载除静态表头外的全部数据和样式
    function to_page(pn){
        $.ajax({
            url:"${path}/emps",
            data:"pn="+pn,
            type:"GET",
            //result是请求返回的结果
            success:function(result){
                //console.log(result);
                //1.解析并显示员工数据
                build_emps_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析显示分页条数据
                build_page_nav(result);

                //清除全选(这个是静态资源，页面改变时他不变)
                $("#check_all").prop("checked",false);

            }
        });
    }

    //构建员工表
    function build_emps_table(result){
        //构建之前都清空table表格!!!!!!!，不然页面上会有上次请求的数据
        $("#emps_table tbody").empty();

        var emps=result.extend.pageInfo.list;

        //遍历  function两个参数，第一个参数表示遍历的数组的下标，第二个参数表示下标对应的值
        $.each(emps,function(index,item){
            var checkBoxTD=$("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTD=$("<td></td>").append(item.empId);
            var empNameTD=$("<td></td>").append(item.empName);
            var empGenderTD=$("<td></td>").append(item.empGender=="M"?"男":"女");
            var emailTD=$("<td></td>").append(item.email);
            var deptNameTD=$("<td></td>").append(item.department.deptName);
            //编辑按钮  addClass是bootstrap css的class
            var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义属性  ，来表示当前员工的id
            editBtn.attr("edit-id",item.empId);
            //删除按钮
            var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id",item.empId);
            //把编辑和删除按钮加入同一个单元格，并在编辑和删除按钮间加空字符串（增加空隙）
            var btnTD=$("<td></td>").append(editBtn).append("  ").append(delBtn);

            //append方法执行完以后还是返回原来的元素，每次执行完以后还是会返回tr，所以可以持续append
            $("<tr></tr>").append(checkBoxTD)
                .append(empIdTD)
                .append(empNameTD)
                .append(empGenderTD)
                .append(emailTD)
                .append(deptNameTD)
                .append(btnTD)
                /*员工表格的id*/
                .appendTo("#emps_table tbody");

        });
    }

    //分页信息，页面最下面左边的
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+result.extend.pageInfo.pages+"页,总"+result.extend.pageInfo.total+"条记录");

        totalRecord=result.extend.pageInfo.total;
        currentPage=result.extend.pageInfo.pageNum;
    }

    //分页信息，页面最下面右边的条
    function build_page_nav(result){
        $("#page_nav_area").empty();
        var ul=$("<ul></ul>").addClass("pagination");

        //首页和前一页
        var firsPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage==false){
            firsPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            firsPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum-1);
            });
        }

        var nexPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage==false){
            nexPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nexPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum+1);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            });
        }

        ul.append(firsPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){
            var numLi=$("<li></li>").append($("<a></a>").append(item));
            //判断为当前页面，就会有高亮
            if(result.extend.pageInfo.pageNum==item ){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        ul.append(nexPageLi).append(lastPageLi);

        var nav=$("<nav></nav>").append(ul);  //把ul加入到nav中去

        $("#page_nav_area").append(nav);
        //nav.appendTo("#page_nav_area");


    }



//===============以上，页面样式和数据加载完成===================

    //点击新增按钮弹出模态框
    $('#emp_add_modal_btn').click(function(){

        //弹出之前都该清除表单数据(表单重置)   所有数据都重置（数据和样式） 不然还会保留上一次ajax校验后的数据，这次再提交会出现错误
        reset_form("#empAddModal form");
        //$("#empAddModal form")[0].reset();

        $("#empAddModal").modal({
            backdrop:"static"//此参数设为static则在模态框外面点一下，模态框不会关闭
        });

        //发送Ajax请求，查出部门信息，显示在下拉列表
        getDeptInfo("#empAddModal select");

    });

    //重置 所有数据都重置（数据和样式）
    function reset_form(ele){
        //jquery没有这个方法，这个方法是dom对象的，所以要ele[0]取出
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");   //$(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");   //清空span里面的提示信息
    }

    //查出所有部门信息并且显示到下拉列表中
    function getDeptInfo(ele){
        //清空之前下拉列表的数据
        $(ele).empty();
        $.ajax({
            url:"${path}/depts",
            type:"GET",
            success:function(result){
                //result里面应该都是部门数据
                //console.log(result);//[{deptId: 1, deptName: "开发部"}, {deptId: 2, deptName: "人事部"}, {deptId: 3, deptName: "开发部02"},…]

                $.each(result.extend.depts,function(){//遍历
                    var optionE=$("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionE.appendTo(ele);
                });
            }
        });
    }

    //给输入框添加一个change事件
    $("#empName_add_input").change(function(){
        //发送ajax请求校验用户名是否可用
        var empName=this.value;
        $.ajax({
            url:"${path}/checkuser",
            data:"empName="+empName,
            type:"POST",
            success:function(result){
                if(result.code==100){
                    show_validate_msg("#empName_add_input","success","用户名可用!");
                    //给保存按钮添加一个属性（任意key-value值）
                    //$('#emp_save_btn').attr("ajax-va","success");  添加一个校验标记  判断是否真的可以保存  禁用保存按钮
                    $('#emp_save_btn').attr("ajax-va","success");//添加一个校验标记    判断是否真的可以保存  禁用保存按钮
                }else{
                    show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                    $('#emp_save_btn').attr("ajax-va","error");
                }
            }
        });
    });

    //保存按钮事件
    $('#emp_save_btn').click(function(){
        //1.模态框中填写的表单数据提交给服务器保存
        //保存前先对员工信息进行校验

        //用后端来校验  更加安全    使用前后端一起校验  安全性！！！！！！
        if(!validate_add_form()){
            return false;
        }


        //1.判断之前Ajax校验用户名是否正确
        if($(this).attr("ajax-va")=="error"){
            return false;
        }

        //2.发送Ajax请求保存员工
        $.ajax({
            url:"${path}/emp",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function(result){
                if(result.code==100){
                    //alert(result.msg);
                    //员工保存成功后 1.关闭模态框  2.到最后一页显示数据 (发送ajax请求显示最后一页数据即可)
                    $("#empAddModal").modal('hide');
                    to_page(totalRecord);	  //取得很大的一个数   使得分页到最后一页 totalRecord是全局变量的总记录数
                }else{
                    //显示失败信息
                    console.log(result);
                    if(undefined!=result.extend.errorFields.email){
                        //显示邮箱错误信息
                        show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                    }
                    if(undefined!=result.extend.errorFields.empName){
                        //显示用户名错误信息
                        show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
                    }
                }
            }
        });
    });

    //校验表单数据（用户名和邮箱格式在保存时前端校验）
    function validate_add_form(){
        //取得校验数据,适应正则表达式
        var empName=$("#empName_add_input").val();
        var regName=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;  //允许1.“a-z”  2.“A-Z”  3.“0-9”  4.“_”（下划线） 5.“-” 6. 6到16位字符  7.允许中文
        if(!regName.test(empName)){
            //alert("用户名可以是2-5位中文或者6-16位英文和数字或者下划线的组合!!!");
            show_validate_msg("#empName_add_input","error","用户名可以是2-5位中文或者6-16位英文和数字或者下划线的组合!!!（前端）");
            return false;
        }else{
            show_validate_msg("#empName_add_input","success","");
        }

        //2.校验邮箱信息
        var email=$("#email_add_input").val();
        var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            //alert("邮箱格式不正确!!!");
            show_validate_msg("#email_add_input","error","邮箱格式不正确!!!（前端）");
            return false;
        }else{
            show_validate_msg("#email_add_input","success","");
        }

        return true;
    }

    //显示校验信息
    function show_validate_msg(element,status_info,msg){
        //清除当前元素的校验状态
        $(element).parent().removeClass("has-success has-error");
        $(element).next("span").text("");
        if("success"==status_info){
            $(element).parent().addClass("has-success");
            $(element).next("span").text(msg);
        }else if("error"==status_info){
            $(element).parent().addClass("has-error");
            $(element).next("span").text(msg);
        }
    }

//=====================================以上为新增操作=====================================


    //为编辑按钮绑事件     按钮创建之前就去绑定事件  所以不能成功（按钮是通过Ajax去请求的）
    //方法1.在创建按钮的时候就绑定事件
    //方法2.绑定单击事件    live()可以为以后添加的元素添加事件    使用on方法也可以替代
    /* $(".edit_btn").click(function(){
        alert("edit");
    }); */
    $(document).on("click",".edit_btn",function(){
        //alert("edit");
        //1.查出部门信息，显示部门列表
        getDeptInfo("#empUpdateModal select");
        //2.查出员工信息，显示员工信息
        getEmp($(this).attr("edit-id"));
        //3.将员工id传递到模态框的更新按钮里面
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));

        //弹出模态框
        $("#empUpdateModal").modal({
            backdrop:"static"
        });
    });

    //修改时候获取当前员工的信息
    function getEmp(id){
        $.ajax({
            url:"${path}/emp/"+id,
            type:"GET",
            success:function(result){
                var emp=result.extend.emp;
                $("#empName_update_static").text(emp.empName);
                $("#email_update_input").val(emp.email);
                $("#empUpdateModal input[name=empGender]").val([emp.empGender]);
                $("#empUpdateModal select").val([emp.deptId]);

            }
        });
    }

    //更新按钮
    $("#emp_update_btn").click(function(){
        //验证邮箱是否合法
        var email=$("#email_update_input").val();
        var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            //alert("邮箱格式不正确!!!");
            show_validate_msg("#email_update_input","error","邮箱格式不正确!!!");
            return false;
        }else{
            show_validate_msg("#email_update_input","success","");
        }
        //2.发送ajax请求保存更新的员工数据
        $.ajax({
            url:"${path}/emp_update/"+$(this).attr("edit-id"),
            //方法1 完全ok
            // type:"POST",
            // data:$("#empUpdateModal form").serialize()+"&_method=PUT",
            //方法二 PUT会产生错误，在controller中有说明
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function(result){
                //alert(result.msg);
                //1.关闭模态框
                $("#empUpdateModal").modal("hide");
                //2.回到本页
                to_page(currentPage);
            }
        });
    });

//========================================以上为编辑更新操作==========================================


    //单个删除按钮
    $(document).on("click",".delete_btn",function(){
        //弹出是否确认删除对话框
        //找到祖先 元素  第二个td
        var delempName=$(this).parents("tr").find("td:eq(2)").text();
        var delempId=$(this).attr("del-id");
        //confirm确认框
        if(confirm("确认删除【"+delempName+"】吗？")){
            //确认之后发送ajax请求
            $.ajax({
                url:"${path}/emp/"+delempId,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });

//========================================以上为单个删除操作==========================================

    //完成全选和全不选的功能
    $("#check_all").click(function(){
        //attr是获取自定义属性的值$(this).attr("checked");
        //prop是修改和读取dom原始属性的值
        //alert($(this).prop("checked"));   $(this).prop("checked") 返回值为true和false
        $(".check_item").prop("checked",$(this).prop("checked"));
    });

    //为每一个选择绑定事件，达到5个单选全选时，全选按钮也全选上
    $(document).on("click",".check_item",function(){
        //$("#check_all").prop("checked");
        //alert($(".check_item:checked").length);   //$(".check_item").length
        //被选中的个数是否等于所有单选框的个数
        var flag=$(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    });

    //点击全部删除   即批量删除
    $("#emp_del_all_modal_btn").click(function(){
        var empNames="";
        var del_ids="";
        $.each($(".check_item:checked"),function(){   //遍历已经选中的元素
            empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";//找到父元素的tr里面的索引为2的td
            //组装员工ids
            del_ids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        //去掉最后的逗号
        //alert("111："+empNames);

        empNames=empNames.substring(0,empNames.length-1);
        //alert("222："+empNames);
        del_ids=del_ids.substring(0,del_ids.length-1);

        if(del_ids.length>0){
            if(confirm("确认删除【"+empNames+"】吗？")){
                //发送ajax请求
                // alert(1);
                $.ajax({
                    url:"${path}/emp/"+del_ids,
                    type:"DELETE",
                    success:function(result){
                        alert(result.msg);
                        //回到当前页面
                        to_page(currentPage);
                    }
                });
            }
        }else {
            confirm("请选择要删除的员工！");
        }

    });


</script>
</body>
</html>