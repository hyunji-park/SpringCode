package com.spring.exam.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.exam.dao.IExamDao;

@Service
public class ExamService implements IExamService {
	@Autowired
	public IExamDao iExamDao;

	@Override
	public HashMap<String, String> getM(HashMap<String, String> params) throws Throwable {
		return iExamDao.getM(params);
	}

	@Override
	public int writeOb(HashMap<String, String> params) throws Throwable {
		return iExamDao.writeOb(params);
	}

	@Override
	public int getObCnt(HashMap<String, String> params) throws Throwable {
		return iExamDao.getObCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getObList(HashMap<String, String> params) throws Throwable {
		return iExamDao.getObList(params);
	}

	@Override
	public int updateOb(HashMap<String, String> params) throws Throwable {
		return iExamDao.updateOb(params);
	}

	@Override
	public int deleteOb(HashMap<String, String> params) throws Throwable {
		return iExamDao.deleteOb(params);
	}
}
