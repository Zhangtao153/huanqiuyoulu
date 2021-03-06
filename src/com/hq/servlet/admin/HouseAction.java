package com.hq.servlet.admin;

import com.hq.bean.City;
import com.hq.bean.House;
import com.hq.db.DB;
import com.hq.db.PageDiv;
import com.hq.servlet.core.Action;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @author zth
 * @Date 2019-05-15 15:35
 */
@WebServlet("/admin/house")
public class HouseAction extends Action {
    Logger log = Logger.getLogger(HouseAction.class);
    @Override
    public void index(Mapping mapping) throws ServletException, IOException {

        try{
            // 所有国家
            String sql = "select * from city where display=1 and parent_id = 0 order by level";
            List<City> countrys = DB.getAll(City.class,sql);
            mapping.setAttr("countrys",countrys);

            PageDiv<House> pageDiv = null;
            int pageSize = 10;
            int paseNo = 1;

            if (mapping.getInt("pageNo")>0){
                paseNo = mapping.getInt("pageNo");
            }

            long cid = mapping.getLong("cid");
            if(cid<1) cid=null!=(Long)mapping.getAttr("cid")?(Long) mapping.getAttr("cid"):0;

            if (cid > 0){
                mapping.setAttr("country",DB.get(cid,City.class));
                pageDiv = DB.getByPage(House.class,"select * from House where country_id = ? order by level,id ",paseNo,pageSize,cid);

            }else {
                pageDiv = DB.getByPage(House.class,"select * from House  order by level,id ",paseNo,pageSize);

            }

            mapping.setAttr("cid",cid);
            mapping.setAttr("pageDiv",pageDiv);

        } catch (SQLException e) {
            log.error("com.hq.servlet.admin.HouseAction_列出楼盘信息出错"+e.getMessage());
            e.printStackTrace();
        }

        mapping.forward("admin/house_list.jsp");
    }

    /**
     * 跳转到添加楼盘页面
     */
    public void toadd(Mapping mapping) throws ServletException, IOException{
        try {
            List<City> countrys = DB.getAll(City.class,"select * from city where display = 1 and parent_id = 0 order by level");
            mapping.setAttr("countrys",countrys);
        } catch (SQLException e) {
            log.error("com.hq.servlet.admin.HouseAction_跳转到添加楼盘页面出错"+e.getMessage());
        }
        mapping.forward("admin/house_add.jsp");
    }

    /**
     * 保存房产信息
     */
    public void saveadd(Mapping mapping) throws ServletException, IOException{

            House house = new House();
            mapping.getBean(house);

            String[] alltys = mapping.getStringArray("types");
            house.setTypes(Arrays.toString(alltys));
            String[] alltarget = mapping.getStringArray("target");
            house.setTarget(Arrays.toString(alltarget));
            house.setCtimes(new Date());
        try {
            DB.add(house);
            mapping.setAttr("msg", "增加成功!");
        } catch (SQLException e) {
            mapping.setAttr("err", "增加失败!");
            e.printStackTrace();
        }
        this.index(mapping);
    }

    public void toEdit(Mapping mapping) throws ServletException, IOException{
        long id = mapping.getInt("id");

        if (id > 0){

            try {
                // 所有国家信息
                String sql = "select * from city where display = 1 and parent_id = 0 order by level";
                List<City> countrys = DB.getAll(City.class,sql);
                mapping.setAttr("cons",countrys);
                House house = DB.get(id,House.class);
                mapping.setAttr("house",house);

            } catch (SQLException e) {
                log.error("com.hq.servlet.admin.HouseAction_跳转到楼盘基本信息修改出错"+e.getMessage());
            }
        }
        mapping.forward("admin/house_edit.jsp");
    }

    public void savebase(Mapping mapping) throws ServletException, IOException{
        House house = new House();
        mapping.getBean(house);
        house.setCtimes(new Date());

        String[] alltys = mapping.getStringArray("types");
        house.setTypes(Arrays.toString(alltys));
        String[] alltarget = mapping.getStringArray("target");
        house.setTarget(Arrays.toString(alltarget));

        try {
            DB.update(house);

            // 所有国家信息
            String sql = "select * from city where display = 1 and parent_id = 0 order by level";
            List<City> countrys = DB.getAll(City.class,sql);
            mapping.setAttr("cons",countrys);

            mapping.setAttr("msg", "修改成功!");
        } catch (SQLException e) {
            mapping.setAttr("err", "修改失败!");
            e.printStackTrace();
        }
        this.index(mapping);
    }

    /**
     * 发布信息
     */
    public void pub(Mapping mapping) throws ServletException, IOException{
        int id = mapping.getInt("id");
        if (id >0){
            String basepath = mapping.basePath()+"web/houseContent?id="+id;
            String realPath = this.getServletContext().getRealPath("/house_"+id+".html");
            mapping.setAttr("msg","发布成功");
        }else {
            mapping.setAttr("err","发布失败");
        }
        index(mapping);
    }

    public void isdel(Mapping mapping) throws ServletException, IOException{
        int id = mapping.getInt("id");

        try {
            if(id>0)
            {
                DB.update("update House set isdel=? where id=?",mapping.getInt("vv"),id);

                mapping.setAttr("msg","修改成功!");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            mapping.setAttr("err","修改失败!");
            e.printStackTrace();
        }

        mapping.setAttr("cid",mapping.getLong("cid"));
        index(mapping);
    }

}


















