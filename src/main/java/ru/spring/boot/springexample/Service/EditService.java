package ru.spring.boot.springexample.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import ru.spring.boot.springexample.forms.EditForm;
import ru.spring.boot.springexample.forms.PasswordEditForm;
import ru.spring.boot.springexample.models.Role;
import ru.spring.boot.springexample.models.User;
import ru.spring.boot.springexample.repositories.UserRepo;

import java.util.Set;

@Service
public class EditService {
    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    UserRepo userRepo;

    public void edit(User user, EditForm editForm, Set<Role> roles){
        user.setName(editForm.getName());
        user.setLastName(editForm.getLastName());
        if (roles != null){
            user.setRoles(roles);
        }
        userRepo.save(user);
    }

    public String changePassword( User user, PasswordEditForm editForm, ModelMap modelMap){
        boolean checkPasswords = passwordEncoder.matches(editForm.getOldPassword(),
                user.getHashPassword());
        if (!checkPasswords){
            modelMap.addAttribute("messageFromServer1",
                    true);
            return "Неправильный старый пароль.";//Не совпадает oldPassword
        }else {
            if (!editForm.getNewPassword().equals(editForm.getRepeatedNewPassword())){
                modelMap.addAttribute("messageFromServer2",
                        true);
                return "Новые пароли не совпали";//Не совпадают Новые пароли
            }else {
                user.setHashPassword(passwordEncoder.encode(editForm.getNewPassword()));
                return "Пароль успешно сменен.";
            }
        }
    }
}
