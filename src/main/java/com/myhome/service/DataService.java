package com.myhome.service;

import java.util.List;

import com.myhome.dto.DataDto;
import com.myhome.dto.DefaultDto;

public interface DataService {

	int insertDataboard(DataDto dto) throws Exception;

	int selectDataboardTotal(DefaultDto defaultDto) throws Exception;

	List<?> selectDataboardList(DefaultDto defaultDto) throws Exception;

	/**
	 * 조회수 증가
	 * @param seqid
	 * @throws Exception
	 */
	void updateDataboardHits(int seqid) throws Exception;

	/**
	 * 상세보기
	 * @param seqid
	 * @return
	 * @throws Exception
	 */
	DataDto selectDataboardDetail(int seqid) throws Exception;

	int updateDataboardFilename(DataDto dto) throws Exception;

	int updateDataboard(DataDto dto) throws Exception;

	
	
}
