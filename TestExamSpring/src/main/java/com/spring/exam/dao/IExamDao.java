package com.spring.exam.dao;

import java.util.HashMap;
import java.util.List;

public interface IExamDao {

	public HashMap<String, String> getM(HashMap<String, String> params) throws Throwable;

	public int writeOb(HashMap<String, String> params) throws Throwable;

	public int getObCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getObList(HashMap<String, String> params) throws Throwable;

	public int updateOb(HashMap<String, String> params) throws Throwable;

	public int deleteOb(HashMap<String, String> params) throws Throwable;

}
