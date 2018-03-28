package service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.ModuleMapper;
import pojo.Module;
@Service
public class ModuleServiceImpl implements ModuleService {
	
	@Autowired
	private  ModuleMapper moduleMapper;
	
	@Override
	public List<Module> findAll() {

		return moduleMapper.findAll();
	}



}
