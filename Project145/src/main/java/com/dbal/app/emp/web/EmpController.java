package com.dbal.app.emp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dbal.app.emp.EmpVO;
import com.dbal.app.emp.service.EmpService;

@Controller
public class EmpController  {

    @Autowired
    EmpService empService;
    
    //등록폼
    @RequestMapping("insertFormEmp")
    public String insertFormEmp(EmpVO vo) {
        return "emp/insertEmp";
    }

    //등록처리
    @RequestMapping("insertEmp")
    public String insertEmp(EmpVO vo) {
        empService.empInsert(vo);
        return "redirect:empList";
    }
    
    //목록조회 
    @RequestMapping("empList")
    public String empList(Model model) {
        model.addAttribute("empList", empService.getEmpList(null));
        return "emp/empList";
    }
    
}


