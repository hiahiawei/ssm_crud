package fan.service;

import fan.bean.User;
import fan.bean.UserExample;
import fan.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    public boolean login(User user){
        long c=0;
        UserExample example=new UserExample();
        UserExample.Criteria criteria=example.createCriteria();
        criteria.andUserNameEqualTo(user.getUserName());
        criteria.andUserPasswordEqualTo(user.getUserPassword());
        long count=userMapper.countByExample(example);
        return count==c;
    }
}
