package com.spring.exam.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExamDao implements IExamDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public HashMap<String, String> getM(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("exam.getM", params);
	}

	@Override
	public int writeOb(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("exam.writeOb", params);
	}

	@Override
	public int getObCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("exam.getObCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getObList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("exam.getObList", params);
	}

	@Override
	public int updateOb(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("exam.updateOb", params);
	}

	@Override
	public int deleteOb(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("exam.deleteOb", params);
	}
}








