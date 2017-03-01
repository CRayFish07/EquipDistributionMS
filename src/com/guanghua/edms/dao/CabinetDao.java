package com.guanghua.edms.dao;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import net.sf.json.JSONObject;
/**
 * 2017/2/25 15:17
 * @author wuqingvika
 *
 */
public interface CabinetDao {
	/**
	 * 1-1.显示局站
	 * @return
	 */
	@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
	public List<Map<String, String>> selJuZhan();
	/**
	 * 1-2.根据局站显示机房列表
	 * @return 
	 */
	@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
	public List<Map<String, String>> selJiFangByJuZhanId(int regionId);
	/**
	 * 1-3.显示机柜专业
	 * @return 
	 */
	@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
	public List<Map<String, String>> selZhuanYes();
	/**
	 * 
	 * 1-4.查询机柜信息
	 * @return
	 */
	@Transactional(readOnly = true, propagation = Propagation.REQUIRED)
	public JSONObject selJiGuiByQuery(int pageSize,int rows,String juZhan,String jiFang,String zhuanYe,String bianOrMc);
	
}
