package com.bin.home.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bin.base.BaseController;
import com.bin.contant.TipMsg;
import com.bin.context.UserContext;
import com.bin.model.Address;
import com.bin.service.AddressService;
import com.bin.util.AjaxModel;

@Controller
@RequestMapping(value = "/home/address")
public class AddressController extends BaseController{
	
	@Autowired
	private AddressService addressService;
	
	@RequestMapping(value = "/save" , method = RequestMethod.POST , 
			produces = "text/html;charset=utf-8")
	@ResponseBody
	public String save(@RequestParam String name ,@RequestParam String pcc,
			@RequestParam String tel,@RequestParam String detailAddr,
			Boolean isDefault){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.SAVE_SUCCESS);
		if(isDefault != null){
			resetAddressToNotDefault();
		}
		Address address = new Address();
		address.setName(name);
		String pccArray [] = pcc.split("/");
		address.setProvince(pccArray[0]);
		address.setCity(pccArray[1]);
		address.setCounty(pccArray[2]);
		address.setAddress(detailAddr);
		address.setTel(tel);
		address.setDisable(1);
		address.setCreateTime(new Date());
		address.setIsDefault(isDefault != null ? 2 : 1);
		address.setUid(UserContext.getContext().getUser().getId());
		address.setId(addressService.save(address));
		model.setData(address);
		return toJson(model);
	}

	@RequestMapping(value = "/update" , method = RequestMethod.POST,
			produces = "text/html;charset=utf-8")
	@ResponseBody
	public String update(@RequestParam String name ,@RequestParam String pcc,
			@RequestParam String tel,@RequestParam String detailAddr,
			@RequestParam Integer id , Boolean isDefault){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.UPDATE_SUCCESS);
		if(isDefault != null){
			resetAddressToNotDefault();
		}
		Address address = addressService.get(Address.class, id);
		address.setName(name);
		String pccArray [] = pcc.split("/");
		address.setProvince(pccArray[0]);
		address.setCity(pccArray[1]);
		address.setCounty(pccArray[2]);
		address.setAddress(detailAddr);
		address.setTel(tel);
		address.setIsDefault(isDefault != null ? 2 : 1);
		addressService.update(address);
		return toJson(model);
	}
	
	@RequestMapping(value = "/delete/{id}" , method = RequestMethod.POST,
			produces = "text/html;charset=utf-8")
	@ResponseBody
	public String delete(@PathVariable Integer id){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.UPDATE_SUCCESS);
		addressService.batchDelete(id);
		return toJson(model);
	}
	
	@RequestMapping(value = "/setDefault/{id}" , method = RequestMethod.POST,
			produces = "text/html;charset=utf-8")
	@ResponseBody
	public String setDefault(@PathVariable Integer id){
		AjaxModel model = new AjaxModel(true);
		model.setMsg(TipMsg.UPDATE_SUCCESS);
		addressService.setDeafult(id);
		return toJson(model);
	}
	
	@RequestMapping(value = "/list" , method = RequestMethod.POST,
			produces = "text/html;charset=utf-8")
	@ResponseBody
	public String list(){
		return toJson(addressService.queryList("from Address where uid = ? and disable = 1", 
				UserContext.getContext().getUser().getId()));
	}
	
	//将某个用户下的所有地址全部设为非默认地址
	private void resetAddressToNotDefault(){
		StringBuilder hql = new StringBuilder("update Address set isDefault = 1 where uid = ? and disable = 1");
		addressService.execute(hql.toString(), UserContext.getContext().getUser().getId());
	}
	
	@RequestMapping(value = "/getById/{id}" , method = {RequestMethod.GET , RequestMethod.POST},
			produces = "text/html;charset=utf-8")
	@ResponseBody
	public String getById(@PathVariable Integer id){
		return toJson(addressService.get(Address.class, id));
	}
}